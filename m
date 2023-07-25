Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F39C001DF
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 15:20:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD1410E0EC;
	Tue, 25 Jul 2023 15:20:36 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E89010E0EC
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jul 2023 15:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690298434; x=1721834434;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mddrZC41gQZV2eTJi5nuTF/mezPvhl4ofc+5eR7J/Ek=;
 b=Ag88folsz0Qv1YKZbeCZqSAw2nwRtukfRfQSaBADn42pXpSx6ITpnEuN
 sWx0Q8VqwVKF5j8fQNRG001yF9k1SoRhCjK89s/u14NFi2mJme90ZoWRs
 ZKjwE4/7Jrw1nCiazmdV5CsnqUrm6+nQZLslgQlpiAPYZOcL2QGqDw7yd
 8R+zUkcXwrb1/TOk+m/KlX2LIC63+TraFCWtSAydJKauG1vd1bCyPeb0c
 ThaV7WznyRIvkKCWea2pny5Agcj1WlaXAWpUZg2Tk2MAiV8FneT22np6i
 SDz7YYSLPoVbv2JI03bvs/CTh3nsFiADjZh6MP9ZNKVjZsV7Fde48NE+4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="371367348"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="371367348"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 08:20:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="791434791"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="791434791"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 25 Jul 2023 08:20:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 08:20:22 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 25 Jul 2023 08:20:22 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 25 Jul 2023 08:20:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tuc8Ft66HV56GRaX9CdLdbW2o6rwqVpBRh9XEiwR2XyUOsyICo/0obuxzUblwM4KO2IZelX1taTYGZb92U2n0AGm0bQXXx/iWEYlz8DUKC5ICJq9X9LO6FXYHZFgVFAXucwGoX6q96mYub4tF/4zHX3K/jgTqe5vEDovyS9CEghwCi46uk576nHsBzMAlAEPXtrAzWAFRpXz/ch+hxQ2adxky1k603RzBILf3hTv/xpZALq9/YCESqQqhxrBUmSaGyQhPHk1GnklrsG/MVEfSbxg+8ndozevRoQStDHIb5OtF6+PdSyYtuhx1uprb3l8PwQjw5v+Rh6GDu9hl/2f2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Az9gIlW9WjuAKxSys/3pyxHLujbdS7ObtpThBgEwxtU=;
 b=lGlN7IFm9yc+W6Gvdv8+pzB63ZwfFp7fdZ8vYoglYYE5ahn8xIFJcyUkzErkRViKXKjAmvdaYMYjhL/QGLzBtN5f0//5c5G0ZPYcJlg8cJ3ZQjDtPKmjtfdiRXGJ+CXR94GMuj2HPMOEyiPf6e4XFlRvr1Uxaz+Z9uvh2Y3JCu/17MVtHZK2ZybYrWp5w50aHqMGP9xXCgfdGOI2tKTBTA7+PidCw9yBM1GVY8fNf8J3H/MLjapx7rr6NwNSnePk5mR8beSHp63owlsyKrj7ZGsrfovM7qPSAid2yDfD5lUriYdnxh0lpS3ARQVzWI+etl5UZumKHOqI4mw8ejDnkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW6PR11MB8390.namprd11.prod.outlook.com (2603:10b6:303:240::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 15:20:19 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164%7]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 15:20:19 +0000
Date: Tue, 25 Jul 2023 12:20:13 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Message-ID: <xiygtjslxuhj6i7af7r6sxty2xalvde6xjo5c3w7eq4es457yh@a4tbc6vs4i4d>
References: <20230725150951.3757483-1-himal.prasad.ghimiray@intel.com>
 <20230725150951.3757483-4-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230725150951.3757483-4-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: SJ0PR05CA0209.namprd05.prod.outlook.com
 (2603:10b6:a03:330::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW6PR11MB8390:EE_
X-MS-Office365-Filtering-Correlation-Id: db7d3282-c59d-4f1d-869d-08db8d22a835
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Mspu2GZM4RTonHHjLchzOcgHNCozIAdlJQ1Yvu5jYL/Aq+EfZaaZ6mVzC1uS/DeErx9qciLs8hlZz9A8exn/zqOWmWVhjdEXkTrWrvW3SBCbSyZJ+q90XlWEQ3fE8jklOdWZdRS+7mv+cVfvl43PLftDEdgl9QUZHDtOSMZ0vzK3uQr5MWHbwwEa4gvHWhsVbKjfmvmr4ffkZGf7+nLezFbwKiwotZBO9ylV20j57S5jN1zirzqduAx7DVRGmT/CGTYMc+GhWV/FDewMsDcOGGhEaw6GpnP81wLARvYtRaYm09XweIQY4U78arD1hiah7uWWy85eb7y2IOOwmKrDthAnTRUQEWdiJxGCAZpECxNVmdh5dAsmuRI3IBxpu9o7eaP7ECl929lBKFV1YC1D7KZQ+2OqN44yi8Ew5DtMOJPW+MEO4ILUpCOM2/65wD0yz6Y3eyX9iZkZanQn5iHuEgv/agC8HGeaowe1VChgZd6hV8/dl0cRucx+pOWf5kKAv7ni+trENtM4T7wvZEAcFwLYhqKK2ycTlaisX2vAIkITgDwICD+AQyYT4f6rC6Ji
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(346002)(39860400002)(136003)(396003)(366004)(451199021)(86362001)(33716001)(2906002)(478600001)(82960400001)(38100700002)(26005)(186003)(6506007)(107886003)(41300700001)(5660300002)(6862004)(9686003)(8676002)(6512007)(6666004)(6486002)(66946007)(8936002)(6636002)(66556008)(83380400001)(4326008)(316002)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?inSkpktzVAmLa9JTCE93e9b1omn/RDFfdBXPPMhkumlaot73InPmR9xCUnsF?=
 =?us-ascii?Q?JKxN9dm1cO0xS78QGIAErQF9IEouAtPVTGdH7qH+SrqNWwU0wc7q6PuD+Cm3?=
 =?us-ascii?Q?mQEZu2bTSvhfKB36R6YmMyidWJzNjVhHJ/TqwRK/sl46+MmQpXIajsJZ9d1o?=
 =?us-ascii?Q?OvPCUD4u2t92+eXEFzPPNP5d+es1EG1ZgfjiYL4Oxkn89BtvG14GPxFfCj9m?=
 =?us-ascii?Q?nTviHTVn7poKDtyalyKzW0b1fCG/rTakhPLdBg0wG8xVCk0X7eFWX3JHRi/4?=
 =?us-ascii?Q?txVyCaE/U0Y6e5SRzW6v6M+9vfDzxl5HdRaUFbpZ7tLhBx+M8nKL5QPpgwHl?=
 =?us-ascii?Q?nSj2NhKoghKYPoxABp4PagivRyhim0G+l0ZDHcLgOAFeSABcX9CimYbCgeTQ?=
 =?us-ascii?Q?akFvpj6NpRN0OBPKvVunxG+T3OglFL1wImNESn8H5E19Ue/8aBSEHc2VU7Rr?=
 =?us-ascii?Q?st7AvcETagVlCHn9D8jyMZfc1pRZk+AO8oFlOrwUkMRypWEZ6C5XWx+BBgx6?=
 =?us-ascii?Q?SY3AnmyAWmXrRUVdxspZx8I7v14nbNMooDFGEFg/SSE/MZDMaHjTp3rF7qR6?=
 =?us-ascii?Q?22nZVKmCGazoTzipcfbMJkc2v1t09x4eTTIj+frOzdC7wMGGTyb0IBJzyj2R?=
 =?us-ascii?Q?V5kQZj9VaBj1bKgR7GWKKPgjctJUW6Swu2TmaixLle9HfhBr5YIwzS4+0TOx?=
 =?us-ascii?Q?ocCiKWhKiJ9aLgD1G1P81cringCZBte+3ZeP9OksWMqiEpe4WzAkVo3WcraT?=
 =?us-ascii?Q?E7bqJTsswzkHkEFExnhJqOd9H9d3nTqP4G5OPL8P5ZpIg2+QG2PmME0qP5dC?=
 =?us-ascii?Q?II2LcznUyfD0/7HGc5ZdT7jBcTAC9HRhtSgdnRajD68htncBza1JkToP2xsA?=
 =?us-ascii?Q?NkbZalz/DpZtlOEmBgKxi4ToJklpEm6jKLeqCJF6om4PbU35a/uWersnc+MD?=
 =?us-ascii?Q?G13RbmSpaGNQ+A7gYiPYiIGCgYwBRD1M0xML8wW25GIyFU889zN3hVbRzi+7?=
 =?us-ascii?Q?N1HxfnXIUK9ByZt1H2MTbADtR9jF1UZttxc3bbkBMUi7x41JXHlcxuK0RAZ3?=
 =?us-ascii?Q?mc1Lfto3y0ITGmEAgQzbUtkz2onJL51IVIvbL0vxDI6nUefXUSglqJx6KxlE?=
 =?us-ascii?Q?k0XLkS93gbDshbxBZfusDNa9kJ7irp9A3zL61pvFlZl2/y97qJ3uKvnymlyW?=
 =?us-ascii?Q?J5tLqPnFTtEFqIRt75mIrPRzFGGBsaAHBMDq+1/iwouPXXkUbeNotkg4nbxm?=
 =?us-ascii?Q?6YsZxCB3mBSG9/QABcY5bI+m7HnNRPh4gnfAGchU7ZWMzKjn1l70+nycmaQW?=
 =?us-ascii?Q?74fPQTXtcGCUf5oFPaNMvZ2IVAC/QHeX+tgCoFEDTmVcJYNYotGNIvMP5dVe?=
 =?us-ascii?Q?sd0t1rRzQGABEVtALqonLwyNhS9A2cwNm0NT/CiG5oPW05KQConUI103vwlP?=
 =?us-ascii?Q?GQ8X2dFFHDGWSkbZSzO//IAY9dd0PBInc15WKFZ8unYn5gMlE2QF4irdCJ01?=
 =?us-ascii?Q?Zuoeai8x6qEkwZ9v6Q0/y66ftBRlWB647o6LsVrt1/LpW1/KSF/NHwsSb08q?=
 =?us-ascii?Q?tt9rUvOZXSsktRzV5GYX/ItWIKdLFnDxlt223ZzO0nJVIlGrrFVjiBcAi4uY?=
 =?us-ascii?Q?Fg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db7d3282-c59d-4f1d-869d-08db8d22a835
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 15:20:19.7369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mr1GyNqWHeS2vRxodNc3pba6wADNc6fviRQJYtRq7/q684k7Y3BPsSSsLYdTiDZYf8h43KQFosa38H1SobZcKDMh3pAURRW7GHy6kx0Ldfs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8390
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v7 3/3] fault-inject: Include linux/types.h
 by default.
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
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jul 25, 2023 at 08:39:51PM +0530, Himal Prasad Ghimiray wrote:
>Functions should_fail_alloc_page, should_failslab, and __should_failslab
>are declared irrespective of CONFIG_FAULT_INJECTION. These functions use
>bool and gfp_t types, which are treated as unknown when CONFIG_FAULT_INJECTION
>is disabled because the inclusion of linux/types.h is missing.
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

I guess you meant Cc only

>Cc: Badal Nilawar <badal.nilawar@intel.com>
>Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>---
> include/linux/fault-inject.h | 3 ++-

use ./scripts/get_maintainer.pl. We can't maintain patches outside xe.
This patch should also be patch 1, otherwise we will break the build in
previous patches

Lucas De Marchi

> 1 file changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/include/linux/fault-inject.h b/include/linux/fault-inject.h
>index 481abf530b3c..f83ab2b6cd08 100644
>--- a/include/linux/fault-inject.h
>+++ b/include/linux/fault-inject.h
>@@ -2,9 +2,10 @@
> #ifndef _LINUX_FAULT_INJECT_H
> #define _LINUX_FAULT_INJECT_H
>
>+#include <linux/types.h>
>+
> #ifdef CONFIG_FAULT_INJECTION
>
>-#include <linux/types.h>
> #include <linux/debugfs.h>
> #include <linux/configfs.h>
> #include <linux/ratelimit.h>
>-- 
>2.25.1
>
