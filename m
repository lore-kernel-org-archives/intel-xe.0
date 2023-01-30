Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 351E8C54EAA
	for <intel-xe@archiver.kernel.org>; Mon, 30 Jan 2023 14:57:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A2110E26B;
	Mon, 30 Jan 2023 14:57:29 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 328E010E26B
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Jan 2023 14:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675090647; x=1706626647;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=XyaZUoc4/NInCj+zOfKCUEpsucUsTVPK2zxCb5ogkA0=;
 b=ejfA3PII/eliwrwa0pqcJw5ylhU8yOglCWh1rSa6T5X5YyztOfw383Bj
 g13v+aCk3feCk6kOu1bSJAbp9fQ246GZNS7md96cOFwzSQWKb0kCezzA4
 ZuA2RrXkIgDCpo9thIs+9hDccRw/CCPTFcwKnkZJlHVAR7oz/h5qAR7xH
 I1bYfi7HsgaV0PjzeWnvczhncSyc2L9ZbrOMjTUqeI1jisE0R1y4t7N0y
 nrSlmCl0bQEf0Kf8KggQqyCXEyh/0buK0dQvMJ6q8vujnlw84N/shVDNz
 wNi80OmxVLi8AWNDGwO3iJHJii1hpJOhSNoZDA3y7tqvI6bsgmQff7GWI A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="307919667"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; d="scan'208";a="307919667"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 06:57:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="788057309"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; d="scan'208";a="788057309"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 30 Jan 2023 06:57:26 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 30 Jan 2023 06:57:25 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 30 Jan 2023 06:57:25 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 30 Jan 2023 06:57:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RWsu46f/3KKCVb/rwYmDHMGgNUOFmgdq79z3kp2EFBM4fuiPFx8UhUTtcfqQ7LncV56SNoxenkouwY7By3elkfQSsy3KcNLaj2NOegSdx5IhQHmYsb2/izC7FuBRxlrh91V24K2vp7YHAcdcs01x54Rv7kvOKJXf16ILu3BkSmfyEPia2CsicKy5Yf+tRpPQgM2PYhPI/5Q61lWK/aXR1fJabxnr3CsfNS7I5td+9fUH+hkWGdGweeFUAn9VO3/+b69eeIvCz1LS+ONqFVAXGLkMOCUqe66bBJyLfNY5GPEDF9Siab6HXCdApB8TISzR5oPS44iRJ5W504d+AKRHpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lsi+IhRPwyz8Y70v/9vDdlGT1fAatwFU5gepuHy40Nw=;
 b=cKsVymrGVnJht7L/Bs8FAG2t3KVe9xX12fnlJtwSzB7kZi/hSNO/7UtqMJeiUoHzfEjZ6V1HxXmy0S7C6qe1h857FiTLD1peabRT/qQSZGNivNFhzlWLSgabBhOvDoZjbChzrdFJz3pfUKz17JcikfrfmR11AsyCOtF7LBBSG30qyzXyBOi3xS1v1nzRLvmLIH8vr3Aw81yeS9M5Kg0+Y69LayOH7F1IOwRCPVlVKWEOl3GTLN0CtlglyVxLYLK6BuaT/cFUJ2DJsbvf0w8es5FmJrJE4iPHmi7eVozBOvOzNBvqVSo3Yh9RqZLHnZFr2lok3SvOdqzVMiLA6Kvkhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB5643.namprd11.prod.outlook.com (2603:10b6:510:d5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 14:57:22 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::593:877e:dd33:5b7a]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::593:877e:dd33:5b7a%5]) with mapi id 15.20.6043.033; Mon, 30 Jan 2023
 14:57:22 +0000
Date: Mon, 30 Jan 2023 06:57:19 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: =?utf-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>
Message-ID: <20230130145719.4emqzuhiitf2q2p4@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20230129213044.100693-1-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230129213044.100693-1-jose.souza@intel.com>
X-ClientProxiedBy: BYAPR02CA0060.namprd02.prod.outlook.com
 (2603:10b6:a03:54::37) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB5643:EE_
X-MS-Office365-Filtering-Correlation-Id: d2521854-4438-4f9c-938b-08db02d24a76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZRNT1S/Ut3488gI44VNmm21lmIy7ODmRFjnAjZlWIvUBiAGdXHObBu12jaU4FwQwnDPNuv7C50M11pP3yHzsUI7KJPA4MP/a+fUDQ+HIQWd3k2/rIqj5FNCKZCtXn7o9EJhfVSHNIatxJmAAIQCnIWFRYfpafJ00yY4YRGZNWbHhlvuE3o8o8B1YmZzDo1qVSR1bKSoZu1h1EhJfs98WoOxL5L/20P2muO8CQBf7eFXflCD7x20xaDF6lBLAlB2Agrrk8Y5InuHJI4oLVw0p3pVnnNsa+iR4lCgp3uK1FMeN1G2Yi5AK44hCm5tzgkfX6zIEn1AcbaDmSEKfQoumPq5J49c1KO5+QrGfbiAyVVVSGPSi2YbRQuk5YKN2wnbIM/ER2rE43aRPNFzaD1lGo7j+biOgWnt8VPAEpq6Fjpq/iw+e2NuUs5VyeGqUNBuQ7llIbwqV3Rcgh8n5GI9RQxuyugFynBQ81BiieWlE/+UG6JOn3TIaaMwAvKOLsHJ471yevxegjdkIm29dZ/921OpPSdHS0/xG/aBhji3KxaShSAf/UhCtktfPQRk6y3hdyVIGEGyJh192kLaqC8obTUYRFQJab5m+zLGecRXXllXfaBbFy6SQi741MqjRUwOf0p1BPUatmzKHRnhmxi+adg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(7916004)(136003)(396003)(366004)(346002)(376002)(39860400002)(451199018)(33716001)(2906002)(5660300002)(86362001)(82960400001)(6862004)(8936002)(41300700001)(6486002)(478600001)(26005)(9686003)(1076003)(6512007)(6666004)(186003)(6506007)(4326008)(66476007)(66946007)(38100700002)(8676002)(66556008)(6636002)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?PAe+gKGrczwIosQSU0nn01NIBR+5UerqniM7vLVxyoX1W73OVtMz9fp4iV?=
 =?iso-8859-1?Q?wC6Oqh1Ws+IZ73vBErzC1R2sl4+4VhWaIujekErL09pLstTBgPvV2cKII5?=
 =?iso-8859-1?Q?NQE/BkuKaMtE6RghLGpnF9K9OEfkkxo23tROrqyn6uphAhO9Pkg6/rh6E9?=
 =?iso-8859-1?Q?Tu6VQ6EIY7oWKj68q7mR1MVODQFa4VDxG0Q2ICsnkQMH1MIcXZCqCiZ5lE?=
 =?iso-8859-1?Q?miTMjAhoI/f785kGoYy6wd48YtRcF6un8QRU7XZK6PEB1nwZT5MRUDxRpj?=
 =?iso-8859-1?Q?NoxVaIYVJK1+H+4igqgvj3wSak5D3VdKjLGESxCXELlvz9U+5QvsFeA2Kg?=
 =?iso-8859-1?Q?4ae90rMdxuODXyFVydeJIw8691G1GDN9qZ2BH7tGOgjuiTFF4Egt92zfPk?=
 =?iso-8859-1?Q?GWmBg1afDVLCgnoavxA82lggXfMe5lwKklZgGfX0Ru69jJoDIBDDIeRHPf?=
 =?iso-8859-1?Q?kkDl5jqmy4m6oJc0aELJb1kbuOwnz4vqrMr0ebj7Dfxh9q74vUuQFWsiH5?=
 =?iso-8859-1?Q?vOfBd7YUci8hVlcZG6CuqHv1EC3Bh5UMeN1cuZClToB7AhYPWFG9KcgG0v?=
 =?iso-8859-1?Q?zJocEgP20ynGHN0rTFk9KeLJyfFLpGyPjDiuo+C0ZZaVlKToJgxgc3yjFr?=
 =?iso-8859-1?Q?VcBc1iaIA9DcDe+G4krSJ/uT4dbdBH50jASpuvJfG1pIKPDAy2gTLl6tT1?=
 =?iso-8859-1?Q?0KpGXwICAj+yuqJM/r/40DzRdYwj17BseJTzGVXB7T9ryKYLwaqEs2FQJ6?=
 =?iso-8859-1?Q?/d7SzkO1tGXpVGtV28aIlmEAcOxSFaukHMHieSvVno6HyXE7MSSMvBC+vY?=
 =?iso-8859-1?Q?x/HIXUVYF/eSPyaLwZYp9qQU8GQftWHn6k7vG8wPbdpP1QA9fWHawgXDNn?=
 =?iso-8859-1?Q?A7AsllOZ24iW4Fc8LvP1VgSWcgMXKuKRnVsyHebFsOpQb0CxvenY3H8lpw?=
 =?iso-8859-1?Q?higdEoeF+S3Xn1bsILFcGY4D+/JYjnF8f0HyvLYRsQkg0Uc4HsTRWsuz1C?=
 =?iso-8859-1?Q?GsA1sx1FI/xY8TQdud1Nr79CkcQEPQH3vhl5QXGI+/Rnpj9Ioj22MBZDzo?=
 =?iso-8859-1?Q?OPhTnOXHgT7C+/1LkkA/6FB7aE+sfo4OOTrO0bxYmQtZh6adKNLUgW4Z5n?=
 =?iso-8859-1?Q?XeGd+AUIMBivBxEY8Kl18mTd+c6RjmxPWZob4fClBbRylRThC5ItZXmfJz?=
 =?iso-8859-1?Q?F4QXaKa5sKQPdUqnYxIA38BkYtzo+F7HliqmYMhUbxuBCuiG+YUiFhXaxN?=
 =?iso-8859-1?Q?jgRqvcUka0iMViGISt4LkbsCuWddvM/En1chgipCBhDdznjEUfufb1v7hj?=
 =?iso-8859-1?Q?AcnqRtKByWazQX+ushH4Z0DTgAT8Mh38IP/ImCv3fJsQ3cxNCtzU5X7M6A?=
 =?iso-8859-1?Q?WtOd7L1warrasVo0MKFVv1x4lZdNzC90WQYDfGhZNo0IOfVIOoAJrVDsK4?=
 =?iso-8859-1?Q?uw8333jm7bkvhg0nC2tZIscxehbKuqfxQJ1w7S4EPgAzGcL/F+vhXMUoAu?=
 =?iso-8859-1?Q?3NY43AD54pqLQpxqTazEvu2sONrtgxGRw6AxLb7BgGwZnYq1S3BatlBjdP?=
 =?iso-8859-1?Q?2/IdXNxJ1pljcs35CSROcZCr7utIRLV2vS9Zxh88rxEeGgpncJ+lnAvOfk?=
 =?iso-8859-1?Q?KOOIBRU40Q7MMeAFydwx484SlXxwBx1N2xAdfMIY7a3NB7IsY2AmDhEQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d2521854-4438-4f9c-938b-08db02d24a76
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 14:57:22.1554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b04cAWU+xGixQFjuv1J9leNSrBXDz0JSSJgbL3twg98droPKRE/1aXOWWpwie72lXqnfR1G4mT3qPA4uw5dW99VtU6m0L0TBlrQeLWoCOmc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5643
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Add fake workaround to maintain
 backward compatible in MI_BATCH_BUFFER_START
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

On Sun, Jan 29, 2023 at 01:30:44PM -0800, Jose Souza wrote:
>i915 has the same fake workaround to return MI_BATCH_BUFFER_START
>nested batch buffer behavior in DG2 and newer platforms to the same
>behavior as older platforms.
>
>So here cleaning up TGL_NESTED_BB_EN in MI_MODE to disable third level
>chained batch buffer level.
>
>Bspec: 45974, 45718
>Cc: Matt Roper <matthew.d.roper@intel.com>
>Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
>---
> drivers/gpu/drm/xe/xe_rtp_types.h |  2 ++
> drivers/gpu/drm/xe/xe_wa.c        | 11 +++++++++++
> 2 files changed, 13 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
>index 14e5d4dbb4c15..72f3e2e83014f 100644
>--- a/drivers/gpu/drm/xe/xe_rtp_types.h
>+++ b/drivers/gpu/drm/xe/xe_rtp_types.h
>@@ -52,6 +52,8 @@ enum {
> 	XE_RTP_MATCH_FUNC,
> };
>
>+#define IP_VERSION_FOREVER 9900

there is already a define for this in this header.

>+
> /** struct xe_rtp_rule - match rule for processing entry */
> struct xe_rtp_rule {
> 	u8 match_type;
>diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>index 3325de3edf691..3616b2284d186 100644
>--- a/drivers/gpu/drm/xe/xe_wa.c
>+++ b/drivers/gpu/drm/xe/xe_wa.c
>@@ -285,6 +285,17 @@ static const struct xe_rtp_entry lrc_was[] = {
> 		     DG1_HZ_READ_SUPPRESSION_OPTIMIZATION_DISABLE,
> 		     XE_RTP_FLAG(MASKED_REG))
> 	},
>+	{ XE_RTP_NAME("FakeWaDisableNestedBBMode"),
>+	  /*
>+	   * This is a "fake" workaround defined by software to ensure we
>+	   * maintain reliable, backward-compatible behavior for userspace with
>+	   * regards to how nested MI_BATCH_BUFFER_START commands are handled.
>+	   */
>+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1255, IP_VERSION_FOREVER)),
>+	  XE_RTP_CLR(RING_MI_MODE(0),
>+		     TGL_NESTED_BB_EN,
>+		     XE_RTP_FLAG(MASKED_REG, ENGINE_BASE))
>+	},

this conflicts with the changesto allow multiple actions in a
single entry, but should be easy to fix.

I think we can leave this wa here, but until now we tried not to mix WAs
with normal programming of the driver. Maybe just add a different table
like lrc_additional_programming[]?

Lucas De Marchi
