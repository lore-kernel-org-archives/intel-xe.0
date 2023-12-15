Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F3E6C35274
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 22:06:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F9F910EA92;
	Fri, 15 Dec 2023 22:06:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9388E10EA92
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 22:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702678017; x=1734214017;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nrdhtmxvHyESI/8vK9Z8ce8H5GIQHQAt7FIMTeo0/fg=;
 b=MQ22RtOgmQK3Kju2JaNifKhCx1vwH6aCZ91Ua2SXhaE65HfWEcsa/eBd
 aZ1FY5AM9VNvn7qKfoDvzbbSX/krsBNuM9Ag06wdqQTLoPsLn7JnCOJrE
 TSX/6a8EGVl0oMA/Ux0h1F6Gh90HkQ56JnU9rDjSg8Pg6o3jXXGQIigt5
 ti93NSHkmrHU9Nguk98D5vWKuHAX+c/HoiCZ273ophS4ib9mM2bpisZBD
 EJySjHi49xI+9NbcTxBpGu/ui7qmQm7M0agzbQoUVBDWQxUxqhn1SZNCv
 QJ765d2Xp1PStq9GZKSEQ2F8OKl8Qjmt9l3+9xiJ656cqRaLq5lsh6EcN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="385752139"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; d="scan'208";a="385752139"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 14:06:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="898279694"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; d="scan'208";a="898279694"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Dec 2023 14:06:57 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 14:06:56 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 14:06:56 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Dec 2023 14:06:56 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Dec 2023 14:06:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=edSzLi6ArrXkIzCuSE0jttsKCx8s36bVPzof6faxqXQoxnCxvaTZDsuvZoDP21/By53wlr/0Uke3mcXYtw0vOcLYCQ2+f3ZMk570+vuqE0UO7QtkTVnkpf1mIATn4ZaYyammnXz00pmgKrvYBkmk3BHI7okOAqIcTTM73PZacoZ+vD5jLPqmTDwxyXkLV/BpaofusNFwK5wSQT9wQstkOSe025P3gaNOTm8YG7Pti1rVSdk1AbdU5nZDgPg34WWb0jqPlYykAmjkPZH35k4543t7JIZMDSFpePK33Sg1NrBrPyqjoekErM6o8h0ViJM6WMZ1XZzKNuVtMjRK/dBDIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SxZ2Wa+UjhV3ofQPTrJa7zAV3acojNl742MMJgXfEe0=;
 b=QM5ZWdsWpaPr5eiqXf11gGTgidM3ZktTeifzsgGz/Ngu8S97NTiPlIPY2YHOwbt9/q5wxKUWPxb4Y1v4CLSk8vOxMpyOCduEQF7gRcjKrMca/vG8rMIiairDpqOP/ppzav9Y/WXCdpFks8YtUdtM0plPG734Fs9DtaT1lzGDP8Jb8P1hZnP4ufhteHXSm+o0tSXPm84xinBbxqPuiMy9nCl4c80U9XoyuIZZZ7fCYjNAz1/hVMDL7j54X/q/POpofkfyInl8tXilgVf6p/SManzJAcGUAojalhI7v4cPrBTHw0shM2UllZ2Rn8R7FNzwzFFYi7LZ8OB4dSnzxeZ6kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY5PR11MB6413.namprd11.prod.outlook.com (2603:10b6:930:37::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.31; Fri, 15 Dec
 2023 22:06:53 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7091.028; Fri, 15 Dec 2023
 22:06:53 +0000
Date: Fri, 15 Dec 2023 16:06:51 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v4 09/10] drm/xe/kunit: Enable CONFIG_LOCKDEP in tests
Message-ID: <jrbkufctbpucxxyskiiqedfyexyhqtflxm6rgbnkkdjkjxflmv@n6qdtd2ndacu>
References: <20231215162502.1879-1-michal.wajdeczko@intel.com>
 <20231215162502.1879-10-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231215162502.1879-10-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ2PR07CA0012.namprd07.prod.outlook.com
 (2603:10b6:a03:505::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY5PR11MB6413:EE_
X-MS-Office365-Filtering-Correlation-Id: dc5b0c70-4c95-48fd-ea06-08dbfdba254e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ppEReEMAZSklnzHOvCXPVNZcSNNu5QxxjC6A/gUm71atwLirmwiHcoj/XdU5CosNqSJO+x6U290bX3Yj94EOAiv2oNdJDTh5QKqJZtMP6K2bnzC3NoFbG3mQA/DcN8aCtnIzT3BXwiImIABZJ8LkdjQlBshR3mFcrNqxjQ1FDjYPd9NuL8gZ0PZNgnBa9aTRmzD/0eTjMOfApruziV5gdAGU9NGJwUrbUdWATEbqYnqKICtMcu4Oc1evM5gSB7nGtsV2Ge5FGAM7Ypk6yZN6n25wenTAlUx7rVBPsTJ6GLk6e3Xkr8eAeIsFh1vFFlThKFOIq+WeXRiCAMJq7OGde4lIoxu6W5g8Tt5vRUTr4losu2ZKl9aDcmJAVob45HNaad9WXhERnyLC7ZeQhnbFhsUOcNwHQJcoiZzoiDkAY/PCa44D8Mpr7DmytJYwSOUse9+4CP3BPMzUmd1HZ/prJsww+Tg21v0gbqo3IanELF0XBJVV1qcYTVFZAsk0aLtYINJMgFjQ1UMG3n8+nsE641xbV78T3QSTxGuAYs7+i+CFAqpDIwSLjThreqGbLldw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(376002)(396003)(346002)(39860400002)(136003)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(6512007)(9686003)(6506007)(478600001)(66946007)(316002)(38100700002)(41300700001)(6862004)(8936002)(6486002)(8676002)(4326008)(26005)(2906002)(5660300002)(66556008)(66476007)(6636002)(4744005)(82960400001)(83380400001)(86362001)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UK6jfCZNtWr2AGFtBfv6SeLd9oo8xZ/oBqmLTzASDzKCCJM7Zg7dXk48PYyP?=
 =?us-ascii?Q?5lzNNHCmOKjschG+lB0T9IEJop4F1NxkO7vfFGjvgpGV8Yy1js/lZ9waIGQP?=
 =?us-ascii?Q?U6T+hafOMiMbeQAxTH7aKpUfgir4EM208+pEnZhTDt0R+33nPjL00pvP6tiW?=
 =?us-ascii?Q?aFXJaisUh5uYb0DUrgKdQZm8gBJMrlruBstqmVzJCDkPCgkYAev8CpkuRFR5?=
 =?us-ascii?Q?VWGNl4+sPBf83HXZExOg7CPmN0cu/9r4F63GriczZ701CR91ToUf09dJTrLG?=
 =?us-ascii?Q?wGMNSxZUDg9fXyZJSCRYiW3X1a/MFdonWdwiAdMuXPcZFhU/zCPdkEw/mXkD?=
 =?us-ascii?Q?cbPVeCRgLsqJRePwKODiH2YogG9TPjzBYmLi7Q+iYr1FXGvOlq/2OS84pBVf?=
 =?us-ascii?Q?UCuUfnV8j9L4vLfuoW4HLQ9DRrlMYZqBh1rRbu/6tgy6hEHpKvTcJhUB2APv?=
 =?us-ascii?Q?t7nhF416n8ODFolVEEf8xF0fNJdT/b56Hm+kpMONKW+33HNtQS0Wk/xfkMAV?=
 =?us-ascii?Q?snb6InFHOYMI7yIG1BhGLn50xXyHmGA7Zu4sZl1mp/Kz39dXbFspBSjwohHD?=
 =?us-ascii?Q?l4fxRwlv+5L+LlMFKWiYpHtZMsQk7XOW4/mT3H31BPeuQLewmF8E3ciDu+Ch?=
 =?us-ascii?Q?RhtJTeRDz37YNF/+T/Yxvx3hdxxpor5wFGSyAjPKhvKbN11+lB+dGr0tnUki?=
 =?us-ascii?Q?xcAY8N5LAd/wNhjJigtT621MGsjhgJTt+OFA35u35ApdABdn0i2X62DFBo6D?=
 =?us-ascii?Q?/qYZCWEj0VfzuIBdRJN3+qxlWp+8ajKTk48Zc0pUX6tNCwYOl+5JACk6/u1G?=
 =?us-ascii?Q?3ouTl3L90LFbUEW34hTTGXXLl3P1ETO7aSUHu5fIsf5ACTUMwZEJu7OQJBoT?=
 =?us-ascii?Q?TqaE3NU5OUlg0DlKuipGzLlFz4KXGvL4ubu4vdAzbvY5SvSZ/pLT5Y2o/FPV?=
 =?us-ascii?Q?fg5ssTKS+Wm4vyF5O67mN4ryGM/wnoPB9MPNvzn7YhyppdQwlqmzpyR6TQvA?=
 =?us-ascii?Q?Y5yy3ndxmxTkwDoe9TsIBmlUP24k3MU4jjSiB73csE/Di1IZ/PfHG5IwJoMO?=
 =?us-ascii?Q?RU04eaOX4k7uAQJmKywVKK+LC7yXqIfYsQ/8JmXYrRWQCe3qnnp+RblKMlmL?=
 =?us-ascii?Q?BKb9GmiewzKJUPOayGiMVLcMhaF5rGP6axK8F+owCy9UF4R5osGZukE4QDDc?=
 =?us-ascii?Q?YVuU1Br5NKiJg3tPhd1EBEMEhBI1/jtty/ug785Z+Gz1Dsq6TFY9hM0uIvPj?=
 =?us-ascii?Q?tI4fuE+RB4Q7RiyblUDeBG9M28ySnhYJIZ7hBQj4xDEME6V5WU9DAuMxbGvK?=
 =?us-ascii?Q?xwBqy1ufJVmG4ysWwzVQMu4a/wFU8ztz+3wA7aBUfJ2joFZDmhT91yrkMd4k?=
 =?us-ascii?Q?BzCNe6Q8XoQtMafc/psfDyzpQwd+qvoL+/meACFvLx2FZI5L3Ia0m7nw6ahs?=
 =?us-ascii?Q?9Gp6QqV/ORwUSheXXUgJ7ipPNDj2uTLSdvS3o/s1+BQvEmIMSTzjQvJbmvm1?=
 =?us-ascii?Q?3BTKfrm9dRTSOqVp7Sd+LFlpc+JoRqTsnQccARXNs289aGY4yHzN6dj4EosE?=
 =?us-ascii?Q?s0cs7KFnNLBvP3azaIHbc0OMP9jWdOV3wv7go4q6whrfB0xK4Y27cQesB2Sd?=
 =?us-ascii?Q?yQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc5b0c70-4c95-48fd-ea06-08dbfdba254e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2023 22:06:53.6441 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a+qj6BoOBTVitToBoxYECRcRmzdWTPfCK/cEWb5kYPmZGdVbmEEzGsyNftZdkwM6UFm55ygwnXu6JxgQqTjrPPQcFQ7gvQvNd7Ad363oSts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6413
X-OriginatorOrg: intel.com
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

On Fri, Dec 15, 2023 at 05:25:01PM +0100, Michal Wajdeczko wrote:
>Tests might use locking, better to have LOCKDEP enabled.
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/.kunitconfig | 5 +++++
> 1 file changed, 5 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/.kunitconfig b/drivers/gpu/drm/xe/.kunitconfig
>index 9590eac91af3..ad4b9b4a9f55 100644
>--- a/drivers/gpu/drm/xe/.kunitconfig
>+++ b/drivers/gpu/drm/xe/.kunitconfig
>@@ -11,3 +11,8 @@ CONFIG_DRM_XE_DISPLAY=n
> CONFIG_EXPERT=y
> CONFIG_FB=y
> CONFIG_DRM_XE_KUNIT_TEST=y
>+CONFIG_LOCK_DEBUGGING_SUPPORT=y
>+CONFIG_PROVE_LOCKING=y
>+CONFIG_DEBUG_MUTEXES=y
>+CONFIG_LOCKDEP=y
>+CONFIG_DEBUG_LOCKDEP=y
>-- 
>2.25.1
>
