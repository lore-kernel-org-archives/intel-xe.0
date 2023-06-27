Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB2DEB64D9
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jun 2023 19:10:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F36010E02C;
	Tue, 27 Jun 2023 19:10:22 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 134D910E02C
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jun 2023 19:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687893020; x=1719429020;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=bEDipKi4bYBeJysWbTNUpyNfQTrYTEktTLEfh1laO4A=;
 b=QI973fjgczyqZZRr1lOAAV2ZzY6wvoyCDbWLigt1/6C8PyH9R1FFo49S
 CRIaybLC6Y4RiAMWGytMi6JOolWxlwZ+TQAfFYPVUjSM2CXxkmgzz4lms
 l/0f1SgB86L+ZIfNfld0xfQrvCAzgdlspPg/XqyKHrtIz+S/XNgB+BQff
 cAo91xL7hrOycv7bWCKn/+uGfOe11N9cYzJzyklf1xsswEA7W3DkyMa8D
 kdarNpmG3baMCucPPxgStIpIB6uW2VASAKsRXnpxqQoNiRD0G9T7n/A9B
 ogP7vwsedxeMBnJoG3o8Xq7Eyrqx5Wi9uCOCHHpf6ZlznIJSsT25j8Rjd g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="342000417"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="342000417"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 12:10:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="963317581"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="963317581"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 27 Jun 2023 12:10:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 27 Jun 2023 12:10:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 27 Jun 2023 12:10:18 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 27 Jun 2023 12:10:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aPMYexAnt+NYhKwTiqJV3HVl7fBzsszQgyMkK9f9l32vPgFwSTCXIA3n1Y9IzAsLfKxNbCR+LtcDcfqVPMQgVgmjj5sQErkR0miFgvlheXqLF4pCksgxCgodOnucbDM3HlmRuZ/CMgRKR6U1KSVuqPBpozPjHdq82SQykbnISGSaaP0JsHr1ubIp980MvmvCfqngX6It5jsYFRuF79veIbGHUSS/y25NQqf+8lSmhhg6tDaHKLAivJKA8EdKq/r/g507lGGb3SSP7u/RrB1E2fTRdCkO8xzCt8jVu3X8h9wvfl9ZTCf38dG9Wo2BdOZbABrpqCEcDnBIWJIaJu0iGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EQiJ9rCdja3MfOf/9KfvD4VaZRpkfyAgiXdXPGG/jxE=;
 b=RG0vKG8M97E8/ZTdQNxUbjpOzHAKivh+Q2quejvUN+ILzpzc3wkmzhu3nckotW3gcpcMg3i9lILtXNu5WkDCHDAqnw7pByhTUy1JeT7T0XUtg03m6D4orgx3+hsokc2GnNqob6fM4saNHMj4h35aPqBurvWmvUExrDBZr07bDr26ZweDvj3E7svhpvf2lV6uWe1sHBudKunVXiwRZ4xCZ54/GOhxUq6jWz9yrAt7oqBW+8JilP6MjMa3zHZL9Q+UqPi0f0NU0fl0E1866qej7CLOS7/3CP5MHWdoaKaIsOvonjKBEOr/+J+wta+sKBAb7ALnXALzMTPNppBfbW6fxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB4876.namprd11.prod.outlook.com (2603:10b6:806:119::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Tue, 27 Jun
 2023 19:10:15 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%7]) with mapi id 15.20.6521.023; Tue, 27 Jun 2023
 19:10:15 +0000
Date: Tue, 27 Jun 2023 16:10:08 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Paulo Zanoni <paulo.r.zanoni@intel.com>
Message-ID: <ysrqnzx3w76mckgtqhcv7dguf6wz6z3twknaur3cfm7ttbclq2@qhzxzpjam732>
References: <20230626212221.136640-1-paulo.r.zanoni@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230626212221.136640-1-paulo.r.zanoni@intel.com>
X-ClientProxiedBy: SJ0PR03CA0385.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB4876:EE_
X-MS-Office365-Filtering-Correlation-Id: da7deac8-5fb4-4d38-b53c-08db774223ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +n7QU4YXs7gg3nY4tvmECfSKqiNYG+XJ/U5/E1Kcqli1rHXjdZNA6zhwYKuBg4Pn0/CCUfQycPBzjQE/auJZAz1CzQEB+VYwvhrVuihu/Vpn1JyFGEYln50Crf2xYK6h7cULodBy7uPOWnR9dyJcBG2USFMratsn+1V7fQazd1JghqDx4GoC86V+9lYwOIHOohsqC1rLm7p2/J7UGCqLQg/nTX7lcYL/jD9FG29N/kPTii6dfXBF2cfH7l2gDIeVZB5l7PBaxXSby4QaliIbZkOLzEZMeCOL4AwxrYDHeGISLquLCxB6CR3o0+fpCdxVLmQGkNZD3p1h72wi37DIY16Uykh6x3uYFSHBZ25kQQ1D8AwmAyFhtbeWcrG85yt2MDvCPEQxYkOVO5I+TVIG8rKi/fSS5bY+fw9o03AfCg4XFNEq2G4LoVv53vMlSUXtlBrIeOdjTXvCSA6LychD8O6GtQM3tjaOSU1+X13BtYU3ES6kdZmRpylTk+tdvtcvGS6qJvSfZhYF9Bx3C/PFDJNJkz2+ddwZR0jZjwlMq5A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(376002)(366004)(39860400002)(396003)(346002)(451199021)(8676002)(66946007)(4326008)(66476007)(66556008)(41300700001)(8936002)(6636002)(316002)(6506007)(33716001)(6512007)(186003)(966005)(9686003)(478600001)(6666004)(6486002)(5660300002)(2906002)(6862004)(38100700002)(82960400001)(86362001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?1QZSW0zsA6Z333EdHOvyeRE3RqIkvGAWdaaleO3uyazdrqXmEqsRsjTMtF?=
 =?iso-8859-1?Q?vW8nUIZgG6nmYmKZkdWacUxhwaceYFz/G2Ag8fA9Sh7BA+psXm4FYkJtlm?=
 =?iso-8859-1?Q?niFH8lvwkAOHLnu10tsCFMV/IlAXOoVD4c5ge+ua+jw4XjXvdzmHiddUNO?=
 =?iso-8859-1?Q?ZnOTQ93TRbi5kNNN4AWjjbxqb3z1zTUPzMmo5ry/V6CJ68yXsjCxXPMqII?=
 =?iso-8859-1?Q?V0uibWNjtmIKBeCbnInot+KFjgweHwvXhJ6DR0thoCPsGUszbD4/sG2BrB?=
 =?iso-8859-1?Q?hiU6Z5yp8y60YFgJ4yJF2yLq+0GhLhjtjdu0vUAykwP8/SoMhtLhUufvr2?=
 =?iso-8859-1?Q?cmnwE93cjbK6/Lo79xtHsrD5rZ9Ty1zTXr4bYI6xrSnvxO/CUKpoaCG1ZJ?=
 =?iso-8859-1?Q?VEgKJMm50tb0QbetfO+pfpVc9Nfd7M1aLrEIgiJzniv0i/W6jRsXreaBkV?=
 =?iso-8859-1?Q?Og9ETzvVR9XLMtYLjFLlqkEGHgiuJnaUUt/Rp9iVO0asuuRILRs+kOlEmW?=
 =?iso-8859-1?Q?gMOrWJPcUsP+XAhxZBPWs/fluIuMNFNP3W+Ub9fc1FyFbUWSNc/4Zwinod?=
 =?iso-8859-1?Q?nr+54tYvoPHMpOtK6iaPIUiAnC08QeLLWNXF1NsC9a8vMYusvfkUSpeeJ2?=
 =?iso-8859-1?Q?+Dt0S+bGuPlJbfPLUrh6n+YTeb2TeIVn/cGOMdEyHl+mTcDRVZnbYD1/AI?=
 =?iso-8859-1?Q?6lizQvxwOdNUH0dxtyoX/8zAQNNoXMg0YnnER2RAAdA3W1F1uUSbbnIA3U?=
 =?iso-8859-1?Q?gWDRNwpCTgRwX06kojhXu6+dm7+Fo8nk+pUAUFwAHVxHbMZusKCZUCldtW?=
 =?iso-8859-1?Q?3o0CiDVRhvPGN2YUTi4VMPCym7SH01L122w9NM4CuECn0enMJnkkB02WYp?=
 =?iso-8859-1?Q?DEaxv1VjwsYyqiO74z9jZa9Czx25caZ95gzKFOSFIcdECfDz2AR+rqNDC7?=
 =?iso-8859-1?Q?F5l8FN3WRQ3bJm5wF8crZtIoJWkdvZ7Rh8Y/IEhlEo6WxnVn+gyI+3K1Jq?=
 =?iso-8859-1?Q?b6rMJXOn8fh8C56piSLmIv1HUupNIJOz51rSp9JvDigqnhxvvogXaFWDOH?=
 =?iso-8859-1?Q?GA7UCmQwPE0U36guHQVP+CYX1tjWgBXhFMooWeGrkMNQR8ujsa0OUK3229?=
 =?iso-8859-1?Q?YkzfkhFqYQLay/Tt4Gs1F5pLV56pE4FwhAZitbks9P1LXhYfd+NUvnREiY?=
 =?iso-8859-1?Q?/NoafwU1xZbIsSrf8iYN0SHQNmcR6I+uAJvwoDfHYhmbh7lG+I0hw/GhXn?=
 =?iso-8859-1?Q?xW2JOoev5IZGogo/neI/PVeFet2z8VTer8+LTVsCOVjoUCGH3NWi3CZL9l?=
 =?iso-8859-1?Q?k34bbzNBdyvdQV5p8RtnLOzufmjEA3Dqx6rK+lAOTvaN5v86ydmjo7t0hu?=
 =?iso-8859-1?Q?Lugf1y5YbAca2NN8uK5VJswZUIWcA7jX0HGkgdEqvU33FuGcvzKSm568im?=
 =?iso-8859-1?Q?hIGZR96m2JiRR5g6LTgUHVByj+ocstgNb04HJWCCFtlbsP/KpMoV/IghOG?=
 =?iso-8859-1?Q?zlgf9tF281s8zmC9fekQejoPo/w61eN5M9s0oDid5tl2cImZFQi6Z+Y3sT?=
 =?iso-8859-1?Q?3QV+DXGineOA2cCMdkZuRzXNZiSMLQGaN4RTkBP1lUVimMX5A8s90rQcy3?=
 =?iso-8859-1?Q?hyOCnd+aT6RkQbRVJAPidYB3bj7dAtYMra0rXpQcpLdxA+rFQzccwTZtLd?=
 =?iso-8859-1?Q?G4qv/y3eypy8xXS9gtSVhb3m1sYb2a4+pVpXk3JC5lrKUJTdujmJA+bVxz?=
 =?iso-8859-1?Q?mPlw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da7deac8-5fb4-4d38-b53c-08db774223ae
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2023 19:10:15.8085 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IZDoIVItRan+tHR2NW/Z3Mm/nMGuP5qLHgasbh57m18DHzc9f50/a2p/RoiYVM4JMzn+h6T0z4cXQ28zBKd5bdMtXOxv1sBt3aFhH6vgR6o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4876
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2 v2] drm/xe: fix bounds checking for 'len'
 in xe_engine_create_ioctl
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Jun 26, 2023 at 02:22:20PM -0700, Paulo Zanoni wrote:
>There's this shared machine running xe.ko and I often log in to see my
>tmux corrupted by messages such as:
>
>    usercopy: Kernel memory overwrite attempt detected to wrapped address (offset 0, size 18446660151965198754)!
>
>I also sometimes see:
>
>    kernel BUG at mm/usercopy.c:102!
>
>Someone is running a program that's definitely submitting random
>numbers to this ioctl. If you pass width=65535 and
>num_placements=32769 then you get a negative 'len', which avoids the
>EINVAL check, leading to the bug.
>
>Switch 'len' to u32. It is the result of the multiplication of two u16
>numbers, so it won't be able to overflow back into smaller numbers as
>an u32.
>
>Very simple reproducer:
>    https://people.freedesktop.org/~pzanoni/engine-create-bug/

since this will be forever in the git log, maybe instead of a link that
may vanish just add something like this in the commit message itself?

	fd_ = ...;
	vm_id_ = ...;
	instance = ...;
	struct drm_xe_engine_create engine_create = {
		.extensions = (uintptr_t) nullptr,
		.width = 65535,
		.num_placements = 32769,
		.vm_id = vm_id_,
		.flags = 0,
		.engine_id = 0,
		.instances = (uintptr_t) &instance,
	};
	rc = drmIoctl(fd_, DRM_IOCTL_XE_ENGINE_CREATE, &engine_create);
	assert(rc == 0);

>
>v2: Make len u32 instead of checking for <=0 (José).
>
>Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_engine.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
>index 6e6b2913f766..530f55a33b03 100644
>--- a/drivers/gpu/drm/xe/xe_engine.c
>+++ b/drivers/gpu/drm/xe/xe_engine.c
>@@ -522,7 +522,7 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
> 	struct xe_engine *e = NULL;
> 	u32 logical_mask;
> 	u32 id;
>-	int len;
>+	u32 len;
> 	int err;
>
> 	if (XE_IOCTL_ERR(xe, args->flags) ||
>-- 
>2.39.2
>
