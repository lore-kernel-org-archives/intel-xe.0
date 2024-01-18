Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 930DDC47422
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jan 2024 22:52:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C8C10E91C;
	Thu, 18 Jan 2024 22:52:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1184F10E91C
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jan 2024 22:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705618338; x=1737154338;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MDh1MgJ1LwRZy0W/YgD3ulx+KdddFsr2T4b4MK83kjI=;
 b=Mm+TaYR/9ePIp5yKUgNun8lOlWErTdYuBf4iKMTljCvxAO19Wt73X0Iy
 JibYFIzpvJdAnE/zzh/Fxmapyv4Qu08eNIsEOqKBUZC75S0rbCmyzww7S
 /khD98fh8lvVEojBQOOIoqA5YV1CbYW/8YbXYe6/UwyRYiian/pdpxbBp
 edyVMTlcc4/4/YY0dHYaXSoedz1P1qr8JJwQgwhOVnRT8n64shJjsINs4
 bCn31tfxXYJny7PqwGgkQXtb4Ws5XWJS9EZkFJzs0FlyrqTGMV2YvoISQ
 Wpv1NHJ/BGL/AQm9yverNovwuSCYraFj/ihhbwBRNxMOuhf4NGk8Qiz73 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="486753095"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="486753095"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 14:52:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="777841904"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="777841904"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jan 2024 14:52:10 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 14:52:10 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 14:52:09 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Jan 2024 14:52:09 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Jan 2024 14:52:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WtRpIkqTeriGLKoekXnq/xa7fOGRvlVWVwIx4uvaJLEFYKPaPqku3a2m6qtDZXiWOS523Z5VFBpTMrObR6cCD5DIxOP2SnMqolV4HtKLOsulH8GbkOJEXl+jSN5AU4uFLh42uwuXgZu4vSoDkFKs8mGKc+CYURgGerlUvviY4U6w/XPuWA/0InWWO6oDBC4z2OFcCVmzXsgqihLufP8oEpJYPIlbxqwi9PHvQHA4bdIuNnayZqzLdz/vw7SRwasPne4fP6L00OFwo303Zi0rjKmBaXDThpJDIA5O7jp9zQJrn2Y5Q2HZqRx8xxc7Y8mg1sMqGOof0OY8KzXwEum9ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BTKOeRTgPdbrTqxrFKmBLgQjPrA0gSHYZs+cNUuqQSc=;
 b=N1ThhoJgjbTq7jYgTPbyWmb+mIM8PqyQpXU6J2MvLfY49ijqcemlmdbRtQYN6YF0G7SShw2HhWplYc0t4E2ohhU+0LiEfkmiKm0o4ykbuYr9M4V1QUGtbjawhJD+DqmU/1VTgUFH5nIKtL2Srh5RnmXG8eR5plXy8P9VVbfTF8/W9xZywEGAALtRgPLfETxJcrVd8ad1hYt9U21LIDyJL/KnJJg9V53Bki2Wd5Z/mFj+eXZNWtFsp699yWWd5gu5DD/wRYfEQ0+j8KwMVWxiAR1mUHi6WHZ+mkJfKU5S5zAPkyPC7qA5ZrzJn16r/icbnOv0VDksOl76AfV1PRXM1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SN7PR11MB7491.namprd11.prod.outlook.com (2603:10b6:806:349::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Thu, 18 Jan
 2024 22:52:06 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7202.024; Thu, 18 Jan 2024
 22:52:06 +0000
Date: Thu, 18 Jan 2024 14:52:03 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyTIENJLkJBVDogc3VjY2Vz?= =?utf-8?Q?s?= for drm/xe:
 correct the calculation of remaining size
Message-ID: <20240118225203.GU45138@mdroper-desk1.amr.corp.intel.com>
References: <20240116223709.652585-1-fei.yang@intel.com>
 <170551513155.537692.7365813859714464845@5338d5abeb45>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <170551513155.537692.7365813859714464845@5338d5abeb45>
X-ClientProxiedBy: BY5PR16CA0034.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::47) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SN7PR11MB7491:EE_
X-MS-Office365-Filtering-Correlation-Id: 911a807e-b4ff-4c42-5cae-08dc1878188f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3Q1dQq0MMd0ChMxZcZ6Vi5vUQ7BnG0dEWBzMde1sHiczSXtjACuzAT8q4eqa9U/LDFwhD/Z45H6Z6PU3RUO45d7KBYsdZ65HSQ9jg9BGuTTy2GezOFWU214PvPEKK/CTbG71qSjnk+rNwRkuNclDRSsXypFvURRBFwGMcxPXP3xFkrP7wvfPWwC0bHxghZZMzzGywvp47g4x6kXY1G5EhgjzxOkI5gY5TfJO2qp0lTch2w2kQeOhADOookOdvSR9wlNKQmg5lJkZQl33IXNvkKBrhe0ulN09dCLpdAbj7zSF427WsUuWNDgz40AbqzZ1xLVmTeXidDW2rxZ9LY3ppfZyNet6M+0q3G+SJ6MItARPHBbBCzlJojRYjwTanvTtLQAyri48pmmuQVMrcb+e/XM5ckv75G6f5UcJMU7SGtwI9AU4U23vUP2BEZ/E1p24qFlx32NV+6WCFpOVvIrqwQ/NzoDVeg/0+Na+uaUrEXYL1TnB6kPYJpdkIlxnAV3OzSGdxnZqiQEXjW6Pc5hPSE1QUkaHe0F02PsaW28WRS72rmNFcu3RH7wYw/Msy8C15Coi03tmSEvzvwRxSImSAg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(366004)(39860400002)(346002)(136003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(38100700002)(6916009)(33656002)(86362001)(6666004)(2906002)(6512007)(1076003)(6506007)(107886003)(26005)(316002)(8936002)(66556008)(66946007)(66476007)(4326008)(478600001)(5660300002)(966005)(6486002)(41300700001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z+FTf93hPN4rd9UUuLMFaWsVJmQNYo0eLKTRIhNjEo36JYnlsgiVF0+lCtcg?=
 =?us-ascii?Q?f97Dn+2Mp1hzleHvBU2KPSuOwhnYx6wTSr9UbAAWjfzZgN+skeOs32tNFz/U?=
 =?us-ascii?Q?vRufAxQsXFx7Ba3pdA7P7Nts5FlkAQOwnkpkcfasOA8cEyK0Cke02oiTyypg?=
 =?us-ascii?Q?VEtuTXrKGhptWBMTb5qQ9N7hS2o8UHafDGRY7DWlNtF9WXhKKDJyLojA+fcg?=
 =?us-ascii?Q?TNbC1PBg3ESD0yLZ8K6S11D/n+Yb5h2p3owo65k+2aqfafIcQIPiLt3Cux/v?=
 =?us-ascii?Q?qz0S2h4uYef1rdWudEiEq3wrMyvnMOxj0Pu3qf7NG1/X0gyEcuovd3qhqdJy?=
 =?us-ascii?Q?qc0+//5nPPpK3Va02SvDO1cisFc3+wglhq9SpIc03dnErvgOhNRwwImZp/C6?=
 =?us-ascii?Q?DmD4IfMv3MR0UR6g7jWlfagttgDqz9Pqplcz1NEUIMDJcgnLPbWYmKv+UVKY?=
 =?us-ascii?Q?EFgZ1A+VZA8y6mkEVY2BzwH9M5MkPcPIvc4k2FJzUr04qEVAX0zr6jV70cJ5?=
 =?us-ascii?Q?MCaeDf9OVTowRRkb2ECDrxD8fFu3YJPMmgwYJPl7iCwyejSfLc3HBR1An2r6?=
 =?us-ascii?Q?JPsfw9uaoqtWLkyruPJjGG0lqf7O46wqAOrIZZ6lrpsSBWsPgH/K7aWZf7iw?=
 =?us-ascii?Q?jqpgyUMe3fEvSQz04RuXbXG0ATaOizgfdsdD6htL1aGwcf2Ib1tT6I51nCMk?=
 =?us-ascii?Q?nO1OKM+hBJRefwJFz5zMe/+a6tClq1xm5iTUSknzZ9NwCj5/eQQvz9PUmtft?=
 =?us-ascii?Q?8u2/OefBql4hxdyb6bxKZkmV97iuJTHBEtGYfW/z5QSYdmKQTBjgYciTc6rZ?=
 =?us-ascii?Q?71u6J/lA6uMBOTj4VHOofH33iUqkvCMCc5BfgKfXBTZ/SHy0kaAFO0CluvTE?=
 =?us-ascii?Q?DhMJnpz2N9BMd2oiY6+2rJSzje/XAA2iZfxL/z2oqTUdOjS3dsV0fmZFf/vi?=
 =?us-ascii?Q?TnB+/OTiQSHwc5jxCBBTmce6uT4lNTk7oES3SYur57wrOkIKz2tfM5Xxypzu?=
 =?us-ascii?Q?FYTnEsoD9BPs51QbthgujOEK+9raiV5VkOgdhLvUPme0/VGrErb6A/wuRxkc?=
 =?us-ascii?Q?MpL64CuuchNzqEjtfYXapGAN6pdSOugiFPDX/axawU0KAC6u2zb7yvbqq6Yq?=
 =?us-ascii?Q?u4QYWlywqnAYLTg5YvXwqozLnLSfdVroX1SeEfWiepheWsBWbkW3nutnNGOy?=
 =?us-ascii?Q?IMdRtMoRiwRKqo+m98dSBolwsCV1PC4fooY/wFV/MF+/ZgiRztoDiytjIQqH?=
 =?us-ascii?Q?+vqC4lVgXZxj2RvspStHfQYTSoVNbTpW4Rb/esuoNQlltE9xvxUGhOXiqKnL?=
 =?us-ascii?Q?T/W56TJGk/5/f+cHR79E2b97SceALAny7Q8RjrqDnEyKpb6tzRk1Lp5tWcrs?=
 =?us-ascii?Q?D3E1b9gX8YYlvYemOu+0sS9unJiFwgvSGYLjIceFhXYQnHohWTh6nS9erQNR?=
 =?us-ascii?Q?ZZR7vf2YClctFo2VZ241dtMDGF6ES21Z1mpIVxZl3xncg3KwiNtqxLiPBl7q?=
 =?us-ascii?Q?Pm7qmqb4Gubq0ssW1GT5DPcHQrWmVHZUfRcuHrQmZ73oMBpgh7ZIAsHufG3R?=
 =?us-ascii?Q?a5GPpd2dy+ruetuIyvX9aKxN7naX2+CQGoDv83HNJDQ3NPbu5+DbQHjO/sIW?=
 =?us-ascii?Q?IQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 911a807e-b4ff-4c42-5cae-08dc1878188f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 22:52:06.7914 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IicdAs1I9bDUPjwxAjCCOleystZ0flSKUdhJjEDkDWEacu6S81/Qdman6sns615F9Y1Sjbsqbe6xKu4Lswg52z1xhIXz45IPajRkhAgVFt8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7491
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jan 17, 2024 at 06:12:11PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: correct the calculation of remaining size
> URL   : https://patchwork.freedesktop.org/series/128853/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-639-b42f47ca5fff1d04fb8eb02d64520b3f338a495d_BAT -> xe-pw-128853v1_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

Applied to drm-xe-next.  Thanks for the patch.


Matt

> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> 
> Changes
> -------
> 
>   No changes found
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7677 -> IGT_7675
>   * Linux: xe-639-b42f47ca5fff1d04fb8eb02d64520b3f338a495d -> xe-pw-128853v1
> 
>   IGT_7675: ffde49e0583ee5053f25a065356bce6bce91047a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7677: 57ed393a5b5d04e985f9950a7f1546fc95f4001e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-639-b42f47ca5fff1d04fb8eb02d64520b3f338a495d: b42f47ca5fff1d04fb8eb02d64520b3f338a495d
>   xe-pw-128853v1: 128853v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128853v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
