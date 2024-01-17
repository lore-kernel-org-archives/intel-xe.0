Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1948C4725D
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 23:42:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D5D310E8F9;
	Wed, 17 Jan 2024 23:42:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 501EE10E8F9
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jan 2024 23:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705534927; x=1737070927;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Pxb17maBXsnfa5Tv3B4uer5RhmsWCZNFekfd17CmnRg=;
 b=bKA7ev+QWb1jAdeEKIXHf50R37iXWz2wyN8SwXuuuePpsgrR5n93hX1d
 M5Gpx7cvztOP8mKcWqG4g53R/Oo44ZZDLx5sRuChTfBLE0eBztLFaqBzC
 53x34ZrbBYa+ZhVvbKqC8oQGiTrrTsObsutIsQkw+pDT853eWePNJkwfw
 wxyaRc9YFFGoPOayb4j1E4LLEf0oFgRNvAlIy2bg4ywZwPSk81ue0Bu4A
 RZ31lPA/RvmiNCqEkIYIulEQ6ETPsWbk+yu9O5+wIZCv4JJwiKBcNvLUM
 b46WhkwcFM9o0lU8xEi4bZd+34hf/O++YmU6/ObTclhZnt+M6E9Hb3JT5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="13656937"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="13656937"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 15:42:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="854826512"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="854826512"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jan 2024 15:42:06 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Jan 2024 15:42:06 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Jan 2024 15:42:05 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Jan 2024 15:42:05 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Jan 2024 15:42:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RtHhUdRmW0WTq7y8WBxRbn9PlFH9MwjgbN0mkXNGNNgZtvdRsohDI0q89GfVZeNnEbdHUoJcdy9iwe62voMLXkeCEcv7r8UeWCsRVucH+Xgd4zd7n2YRyQCjIDTj28+DJfpMHHA+PwfoA+c5YP7LEjMO7QGPRwCBTqg49BJ1OHFWwPhHmluYMebQuT7cdMdJifxt3kVhz7Wz0tipc1XSXN2Xmsnr+uuGRyjlI6tyoRBtU1oqIsUjZVMgr4O0mjH3plTEjo4NabY8HoUpWI6oFX5ItW24jez7wsDOGR3gYsGYgOIh66AhThIOb2dQkAm4CQ/ek+ag2ObOX+0++UB6EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YY5aukYcbUSG8txVZ4F3fQVntigi2AmxWVrHiK20mGE=;
 b=FaujprRiOcZySPrTZfmWu8azoiGWV/OLdvqJ3obqwKx6P2CiXw4ennhbdjLD8Trv5fSFD03QTEfDFShdTAx589RD0QY2L6JmOkgzXl1qFFzJ0g5yeYtOuG+Igkb9/EpZAFZPlUv8Yk4Cj76Z26+kPMnFJGuXe86tJ121YGgOf0XXQjekzRg7EwDG76xoB6HCyhoUOYKqDSE7BimdumQ9Mct0LYubpeezS2+2nAosybBGHZf4V0i3S8aJ6h5+h2ATjPRaKsfynqhJIkArndaa0dOLsNuw2VukeWGGL0IP6gsHrb2gC66IvAcDZ0dhzn8RRzFvOSBht9yk41JoJTbK8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB7814.namprd11.prod.outlook.com (2603:10b6:208:408::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Wed, 17 Jan
 2024 23:42:02 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7202.020; Wed, 17 Jan 2024
 23:42:02 +0000
Date: Wed, 17 Jan 2024 17:42:00 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/xe: Do not flood dmesg with guc log
Message-ID: <ztv76j5a2333n3sdl3h6nuulqcdscqcosambxe62rydprzpepz@mitp3w4jgb2o>
References: <20240117204059.345143-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240117204059.345143-1-rodrigo.vivi@intel.com>
X-ClientProxiedBy: BYAPR05CA0090.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB7814:EE_
X-MS-Office365-Filtering-Correlation-Id: 02d26fc6-9839-42d6-91d4-08dc17b5e7ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CLdmhlSm6fWzt/yNd1JKJU6oIFOnYWLr1AsTRGUnekJePGNXhyDoxaLAXxntzzbqwwFpb2KpQ2qY+fUWZUdyXWfGq4EtDpvSitrzXaxljFRboxHGzeLj8ZOJnAHPIt7ru0jZnHUFrRXMN/HyTuUTWQMlirMkiEtXjAYOqhUC0HVQtYCR+Ey+ygNDQMdg7Plf4a05oAwGRiPHMud5RvAXVe7Sjhtr8ktj5JrhO/fJtYIcWfsdtWBMigwHjryfqSkmiA46aTE4PnkdzMEAs7jM0qpStq8mpD32YV2sxBsTpgau1O4nH/KzsSda/9+kY0MQ19P0h6D2XmNbbh8hwEz3wz5bjmiMdMqzYmql/WtyV2nc7B0eqYb5QYWL7Fs8MH8CH5aAHMHKOaBLH7W3izSu12Pg1OOeAiAOv9tSXDM+jVmrseQpvQX6ZNloGPcTaZ4W01+5DILYBb29mVDKcMlMbmK62rEsD0afksxFly0UzIyJvnlobqgj2tx98vUyQQ5gzIJKPpWyUBXIE1abyU1dJURJ+ZFzwd052qhw9wkcW5fZ+r3sMKAGAGGsSMYB6+3z
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(376002)(39860400002)(366004)(346002)(136003)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(26005)(83380400001)(9686003)(6512007)(38100700002)(5660300002)(8676002)(6862004)(4326008)(4744005)(316002)(41300700001)(2906002)(8936002)(6486002)(478600001)(66476007)(33716001)(6636002)(66556008)(66946007)(86362001)(82960400001)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HviU9M1/JSVHYTUzoRUBpMsXuOGOxGfeGTaAcwBgHrIfRr4n5HELlbHEzVAK?=
 =?us-ascii?Q?7jJxuXaNKrjBh4+fUEnMMUMUZuxXpUNZ+cdK6hvyX6j4c58wfmpf50qyy3zu?=
 =?us-ascii?Q?ElhnMvNMBSWHsTS7SKJ/59gPR8Kl2Vs0Xq+WjWNW+lo2xQSYhcYTGyNExr5c?=
 =?us-ascii?Q?EnVQex553iMTF5iq9dnqTkFACwFoxs2spW2jhueuUa9QpYHFn0oRhrl29J2Y?=
 =?us-ascii?Q?xC5dTN4QyKC66nSrvqNWqVYv6xubQgd2CmC9EfknHWzGMEy4ilbEtRpxURqU?=
 =?us-ascii?Q?msTb0SqLpj7Zhme+vFrGk7Mg7SUqLnlwMQMsju/MSLpV+aWesZvj/2VVdMcj?=
 =?us-ascii?Q?XJte41/fiHVaXLOkyHd+blmqagtOvNqBeJm2DuDzTo7bNQVZVH/8Xso0oAok?=
 =?us-ascii?Q?4S8QFEoOA7n8x0wFllrCUIdQiSVnxHduK7Gk7rZrz/4LOTRMP+CJEFIMNpbo?=
 =?us-ascii?Q?rJlaSuC3HdPqo3DlYxFV3pJWjsOSo2JbkDuZY1vWqo1OsqGA+yihjvR8hn2L?=
 =?us-ascii?Q?83mzrUEt1+BkWTeIqa5AJaLomkjAv5FJJwqpjTu0Xg9QRyP8EmjXbT5b+NbI?=
 =?us-ascii?Q?FcjIac/yPAfvBo4U7O40N2HYDlXxZAVVk0SCoDYHFb3nrgAjG5HXh+zxyIqv?=
 =?us-ascii?Q?6W4O8TCZl14wAYMSra1/AhM58dM9O7nmgNKbp4TCVqPm0tSxt5VN9uBPxOys?=
 =?us-ascii?Q?YpYorBd6jS29Sdo2/uITpPyHzBR+wrLAt5PooNGy5wac0ZhiSsGOlMddBCB9?=
 =?us-ascii?Q?nJRX2lDEPW9ohEqUeoUjaOTH9ZB87V3iap9Cm94Bf+gIF8gwhNMvi3cK+rDb?=
 =?us-ascii?Q?mSffz38SzRiDwdHJ7hCp7Lh30IdOhpdsXGQODOuL1AsXO8mpbPTejCUHjhjh?=
 =?us-ascii?Q?s4Jt4aYai8yYYP6R/VrVCRjPE7+3C/NNbcmgbGd0h6AZVstTbXGRKk+NwWpn?=
 =?us-ascii?Q?3f1z97Asx0D4z0fvUrqZH+JwL1iNP+gdKf+VK9VRd0yEOA4DV4e0GEBkakW5?=
 =?us-ascii?Q?VRcQ/n72yyXBTGcIKXk6YDCjxGxsrLb0qAbwbhC0BiPkySPjQn2MLvAibme4?=
 =?us-ascii?Q?q4HkrHAzBYvUuKvBpJIWACH+LO8yqw4HND+864MNzHS06xj53+2riR1gqewL?=
 =?us-ascii?Q?m6kr7iyy6fkCXQM8a592BgOfvw2xHLDev1D0SQt6m+YMR4ZOjJ6w1IC9M872?=
 =?us-ascii?Q?X5m4JrWSNXIjWMB42Y0otECvT+TTuEmkvs2ON2HFklAtETmycb4RvuVsS0Bs?=
 =?us-ascii?Q?D6DuffIVHwk81sbH4dVz5SNXajW5B+em98q8/LgnKuuia/wMAxzLZrNjavrf?=
 =?us-ascii?Q?XrRZzQWRKBFGdRUN0EDK/vFTgfECIUaTYo+ks2Hf7N/DXfsQeYmhiDvMc9hI?=
 =?us-ascii?Q?WzYsY3VBwNSqY3jY+yU6EWKJGfl7aPny8qt+y4zjqFGj/G055ChjgPEh/uw9?=
 =?us-ascii?Q?v0660mgNLxYB+SHokVmUkLHWC7QUX+CKtfM2+qxE5Pc1VjfqrgHjpuaa2Tsx?=
 =?us-ascii?Q?EH6uDpEXSUu4D/jgv8MkhnQzk/Z9iENn0cV842GUp7mMBLX/fm2gvEE+9gcU?=
 =?us-ascii?Q?81Kh33QLpebtdCaXN05840rxCqijg2stJ3z9zRvNGMoxkaJ9qXW5SK3CKg0/?=
 =?us-ascii?Q?zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02d26fc6-9839-42d6-91d4-08dc17b5e7ce
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2024 23:42:02.7294 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gEStKdYZ2z/6BDytcv33Bria8+JyUNLOkmH824lOV8wiPvuvEgK3W0XY/vhEcdFVg7XJwSrmOraCKSu6aIUi+xuu3MMVFuASFBiQTuY9nYo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7814
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

On Wed, Jan 17, 2024 at 03:40:59PM -0500, Rodrigo Vivi wrote:
>This information is already present at
>/sys/kernel/debug/dri/0/gt0/uc/guc_log if needed.

but is it persisted if we couldn't load guc?

>
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>---
> drivers/gpu/drm/xe/xe_guc.c | 1 -
> 1 file changed, 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>index 235d27b17ff99..2a71348c5deda 100644
>--- a/drivers/gpu/drm/xe/xe_guc.c
>+++ b/drivers/gpu/drm/xe/xe_guc.c
>@@ -466,7 +466,6 @@ static int guc_wait_ucode(struct xe_guc *guc)
> 			ret = -ENXIO;
> 		}
>

trailing newline above

Lucas De Marchi

>-		xe_guc_log_print(&guc->log, &p);
> 	} else {
> 		drm_dbg(&xe->drm, "GuC successfully loaded");
> 	}
>-- 
>2.43.0
>
