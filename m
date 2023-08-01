Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F07EB64DD
	for <intel-xe@archiver.kernel.org>; Tue,  1 Aug 2023 06:02:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 509EC10E30E;
	Tue,  1 Aug 2023 06:02:32 +0000 (UTC)
Received: from mgamail.intel.com (unknown [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A753510E30F
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Aug 2023 06:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690869750; x=1722405750;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QWkhGcSsuWZuXImCRH6kaHkF/3bgqM1mvcgSamuS8Os=;
 b=DvIcrHKWSpuilbZAiAebFXihzQDsrU7W06ExGcIFpihXoAAYBXdsYu37
 hxf2OR75zaCKLI5WGIsQocWXfsuqpdpvNB+6D82PZvWQ4OJZl9AeFM1ai
 ZzN2dOAyDzihdnfRho/CC+dQ+6vH6gVTheNs7EYrWGpbHZG7UYgIdA6de
 q9u6QJVBSKW/TILiQgwVfAdlTo7L1RRnI88Nc9Tl3j5zfdvEGfHhlRw9T
 Qp/2xFGLD2CnnoII8i8f94/HjFloi8IM37V/zesumu1y0HsKtvepIxmkd
 /v9fuRVGVDTSe9GMnNkZWI5iKeoBtHGWmGfY3bIrccUqFWTUk98GgfRQS Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="359250737"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="359250737"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 23:02:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="842590179"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="842590179"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 31 Jul 2023 23:02:29 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 31 Jul 2023 23:02:29 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 31 Jul 2023 23:02:29 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 31 Jul 2023 23:02:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hFzNXXdEX5jaj/byVUoNIBtlycRAaP09DYjRXhsviyOf82Ot5zkiuHRaqMnq7rvpKohhdIa7R46aoGs8grt0ctl3uiLOzw6XYo2eP5w8ix0FlbGBriK/ca4hG0RyUaonzZNRn8lj3fFpZFvFSOM22scPdUIyzO64CYb1OVbdpEwBGY8aBWsAeWjJnK3pKEaGTaLauTPYkOXtt3IaB7XfDYiDfngjFaoDTax+lh8q6oCuai3Pe0YO3hZ0PcQVRQ8O6vwIdLsFZryQOg+QVTFmCf00KFMH9uwFwaoECmw5ApO+lwNcwVlWQufh0lqD4j2o7j+Txg1HJOHteyG7qIfN5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ycRdPJQSZCxcGUHVOUfKUvZsXQl/bnbiQm2Ek5KoG3s=;
 b=SsmDFEvMo8BBb+db5/682X3h+KO3AcyeU9ZEposROkVUp/1sHqKqmqWlh9zAyFOphcS7Q/Xqv99YcATDY8aVb3H2dFc7lB2M6L6Mh/1w8O3MTQOv2NBClQJZouw5TJfstD/KmElkVeAA/NLUjIf+krttStGuri9SRUbHvr7jo18+Snz4hZSdmVSQogo72cGw5r8wsjKECwDB2DkxKR/kH4tJ+3oKimMk4TjYyLm1nFaRh2UjDhDxT2OSHP3S/mLb9RILaFQkW+JW5592Lh9eWKBuX6vLr0cZN+Y6TFNCIs/FC8V7CxGRlB+Bs/gd+o/ILqUliW7ilBsUxMclOACIsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by MW4PR11MB6838.namprd11.prod.outlook.com (2603:10b6:303:213::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Tue, 1 Aug
 2023 06:02:27 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::864b:5f88:8b9d:517f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::864b:5f88:8b9d:517f%4]) with mapi id 15.20.6631.043; Tue, 1 Aug 2023
 06:02:27 +0000
Date: Tue, 1 Aug 2023 11:32:16 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Message-ID: <ZMif6Huf+E95GL3J@bvivekan-mobl>
References: <20230726232650.3873897-1-himal.prasad.ghimiray@intel.com>
 <20230726232650.3873897-4-himal.prasad.ghimiray@intel.com>
 <ZMfFaXW7607Cy45j@bvivekan-mobl>
 <MW4PR11MB7056657DF4820D71CBB0DBE5B305A@MW4PR11MB7056.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <MW4PR11MB7056657DF4820D71CBB0DBE5B305A@MW4PR11MB7056.namprd11.prod.outlook.com>
X-ClientProxiedBy: MA0PR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::12) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|MW4PR11MB6838:EE_
X-MS-Office365-Filtering-Correlation-Id: 7be5f3df-7d11-4685-c822-08db9254e209
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rTUxjMXfbACrmu77NtoZE9QIuk5mjsx6OrXigr4g+McVrlF3XtOeVaLC5uG8jApuukE3b6YbvsJ5g0E4rszFkZEJTnn980SyKKJKH8QFv+eokmnQUmBUc4aykGNgAv4spPwqfIBnGPfuOMMW+zP0gzdJrQvCpSD9Ybb9PVu0yYw73vJtIUPeTIQ9wFISSbFGKi3ppwudRlQJOgxhspS6Gv9HOZ/adl0g5fLiw/Hpk8w+eS9wGmNQLH4Gta8wI1fynZLAI8+sTZbppedtQxUTZPaPQwD+cs8Mm/Qw+irRteoqwgWsnhL9255Tw+NX9zuwO5ScnfSq3Vnp8iCycV4/pPPTh3lRkHKEK82CXikT2sp+b55OKK5Nk+w5/qg6BZsfAIlPvQpN3VnCRjVbSNoqekg9AVeJ6+JnaxV12vg+PK2R+2RNN+9UA3/07pyEPcD9Hkym4u17hA5HlAs4wDXR1I+iIWLVDanqssloeH02QHesxccNN4rDp5pTRJ+lkOtEkAyZddsw66he1Cpu4Xjqrj1s1hBoj1c8mjaAdwb1ah5bcdLJU1esrbLZw5sJGjWY3kynAwVUjlHZnv/pWfIEMGbo81HJavea4/D7Jl8d52o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(396003)(376002)(136003)(366004)(346002)(451199021)(5660300002)(44832011)(478600001)(6666004)(110136005)(54906003)(38100700002)(82960400001)(41300700001)(9686003)(6512007)(8676002)(8936002)(53546011)(107886003)(6506007)(2906002)(6486002)(4326008)(66556008)(66946007)(66476007)(316002)(86362001)(186003)(33716001)(83380400001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmwrQ0pJWTI0MWM3ejlhanN6K2tiSUFkZW9SR3V3dnhxdWM0aE9XQktLUWFa?=
 =?utf-8?B?Uno1SWRteFprdTk4Sy9yOGFlbVFpb3M3YXluc1pja3V2dGlGQ2MwWk81K1F6?=
 =?utf-8?B?cmxGZmphRzNZZkgwODIrRFVmeFNXTktNdHBJaE05c1FLKzJla1BuL0ZFb3Ay?=
 =?utf-8?B?UERHZUU0SHgwMGVJOWI2Y0Y4SHVjbE9BVHR3OHFOSmZmc0lvelpvVzNvem0v?=
 =?utf-8?B?L2w5N2hkTGtRSVpRc3cvc2JGVllnVmwyQkdJNFRsUDNTNExsT2RIYjQ1ajI5?=
 =?utf-8?B?cWlYclFGTGoyd3o4NlcwZlBTNXRkSE9pZndtYlZ4VzVNSGdiZ0dnbWFGV0Nj?=
 =?utf-8?B?YUNhcmhlM2RyekJvMmN3QTdkQ0QvVzcyQzJzSk1FV3ZCRGNCNHVuZWlYQTY3?=
 =?utf-8?B?UHFNcTdGODRIRWZtUkdSVWdmdmlFODlkYnVuZlorZzU5UTd1ZWtYNG52RVBU?=
 =?utf-8?B?dWN6eDk3NEgrZG9QZFVUNk5XalhFVW10bTRsa1NleUtBNmR1aUdneXE4KzZz?=
 =?utf-8?B?SHphU0hWeWRqY05mOXE4UGo2UWkxOHhkSTZMNzNuOThVK3NONnBEVHNEYmxn?=
 =?utf-8?B?ckxybjdBMVVsVExTdVRCcGxKTjFXMnMzRy9mVWRPQ3ZvdlN0b2dWcUhaVERY?=
 =?utf-8?B?MjR2OG85di96K0lLbFN5cUgzVW5RbTk2VHVnU2x4QnV0cWQ3ZXNBemdsM1Az?=
 =?utf-8?B?SmxSRmVhTTloYkhuMG1GT1lLeHpSOHFhS3RCdlNNVjJubno2dTJSb0JDQ2t5?=
 =?utf-8?B?WEx3bkFzSnRVOXpVOFdOMnJOMXVLdjdCZE45dnpqVDFscFB1YnU0WkhhTzRE?=
 =?utf-8?B?SEdEV3pLa1hxZzhRVmo2ZlhOR3dhRWt4OEoyZWNGbTNFbnNlbFhURGJYVlgz?=
 =?utf-8?B?R3lBQm5LNFRIT2JLdVpQeTJoem1rZ3RYY3huZ3Q4WXVXajV0VGV5dXlab2la?=
 =?utf-8?B?dm0ybTZvOGEzdVE3RE9KTW1EZTdIVGpxU2Z2WHdkV2VIUlViVVZxM0F5Vlc5?=
 =?utf-8?B?d0JwNkh4cm5EVFlWbG5Sb2Z2VDZ1M1AvU0tpRzNNV3dNdDZBNE5MUkMwUjU5?=
 =?utf-8?B?V0hVMGJSWUJwdTBOcG9DeVRWOFEyV3k2QXE4THU5dkR1enY4bENsbmhxekhy?=
 =?utf-8?B?UjR5Ky90SDV4T3BlNkRZaE1BTmNOYUlYc0ZOc3ExMzFDUXdTck9UM2pkZ2Ra?=
 =?utf-8?B?WGVoRUR6aStzOGF1a0hsZzZHZ0tKM0s5MlJmRU11d0ZpY2tGWmppQVFZOG15?=
 =?utf-8?B?akNnc1pCSy80Q1J1SHExeXlINnVYcG4vU3JnTTNrV1NxQ1JqeEM1MThtdFRp?=
 =?utf-8?B?ZVlNMU1EYXpNWXVIVTZIVmhHb1hYckdET1hpWE5YTjVpelJIeEowK1dSbXBG?=
 =?utf-8?B?RUg5U3FwU2trYTJZNnd4a01PeXljSEgrNU5ZaVFRRlVkZmQ0YnhubHV5bm1u?=
 =?utf-8?B?R3F0MnpHU3BUbThiTy9SMDF4c292YlZlZlVnZ0dCZ1pFQVZhampxeHVVRUZB?=
 =?utf-8?B?eFRqcEhlM085UCtKMU8zOHNIbzJ1c0ppengxWVJYbms5NzNVNWtrN0YwYUpJ?=
 =?utf-8?B?UjkxT1Vla3diZ3NibXQvdkh1MmEycUpzckswckthSk45UWEwVUo1VkNORmpU?=
 =?utf-8?B?dk5kQTRYbC9wanFGZ1JvYWwxQkVMV2tzazhVOGFjTFA2RXRPUmZlQlJIaDJl?=
 =?utf-8?B?aThFK1BmdlVOZ21mUjhxN2pzTWxZVVM3bjdRSTV1VDBBMUxvbWxXRlhOdGFt?=
 =?utf-8?B?SmZrYys5MjQydU4vRlBHTWlnVFZHSkJPeVVaeE5yWVIrWjZ4ejJUSWR2VWw1?=
 =?utf-8?B?Zy9kL0JaajhYZXNkaHlyU0pIU2ZoM2YvZmo1TlhaT2hLMVhqR2oxdDEraWFm?=
 =?utf-8?B?QTRKN01HTm1mVms2WTBrbmp1Y2xoWXBKZHJFM3Z5UDBwbUNBOUtGczhPb2Nn?=
 =?utf-8?B?dDRLbndDRVhMUmpybERrMWxPS1ZTeVRmL294NWpUNXdoeGwyRU13QWhWZWYr?=
 =?utf-8?B?M0lFQjJyR0xzcEpRNWIxZWJIeXZEYjdJRmlGMDA4UFB5dlhTTkZ6MDJzZWFV?=
 =?utf-8?B?K3FLNEVadFNMc3hScTBpYjk4akdmZ1hjVEZmc21rVWVtN1FSRFU4SnpRQzZr?=
 =?utf-8?B?OU84TWxpWFJ0eWpWa1dlV3lWNG9KVnNFd1NiVWVCdmt1cHVGV3VRM3hNcThW?=
 =?utf-8?B?aHBlT1ZhcDJLakJObE45NzgwZERER0xQSk5ZclEwaForVmNXYVJYTkpuczRn?=
 =?utf-8?Q?Sm4BseZ1F0XSSAbMv/ylIl88RbSOGLP8mbLkTYc/iE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7be5f3df-7d11-4685-c822-08db9254e209
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 06:02:27.1762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I3o7z/FAk+jQzSH7fPIAYw26T0Ti9cpH5V4GVSs1azXsBnLFTdMKJbBeK7MgTrF1XxopR67OPNVsjLIADbiarSRB0C8t1cpVbRhlbNxaGxqK6WDXAYco2F/TrvlXunGO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6838
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v9 3/3] drm/xe: Introduce fault injection for
 gt reset
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 31.07.2023 20:54, Ghimiray, Himal Prasad wrote:
> Hi Bala,
> 
> > -----Original Message-----
> > From: Vivekanandan, Balasubramani
> > <balasubramani.vivekanandan@intel.com>
> > Sent: 31 July 2023 20:00
> > To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; intel-
> > xe@lists.freedesktop.org
> > Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; Vivi, Rodrigo
> > <rodrigo.vivi@intel.com>
> > Subject: Re: [Intel-xe] [PATCH v9 3/3] drm/xe: Introduce fault injection for gt
> > reset
> > 
> > On 27.07.2023 04:56, Himal Prasad Ghimiray wrote:
> > > To trigger gt reset failure:
> > >  echo 100 >  /sys/kernel/debug/dri/<cardX>/fail_gt_reset/probability
> > >  echo 2 >  /sys/kernel/debug/dri/<cardX>/fail_gt_reset/times
> > >
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > >
> > > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_debugfs.c | 10 ++++++++++
> > >  drivers/gpu/drm/xe/xe_gt.c      |  8 +++++++-
> > >  drivers/gpu/drm/xe/xe_gt.h      | 14 ++++++++++++++
> > >  3 files changed, 31 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_debugfs.c
> > > b/drivers/gpu/drm/xe/xe_debugfs.c index 047341d5689a..1fd016e6f7a0
> > > 100644
> > > --- a/drivers/gpu/drm/xe/xe_debugfs.c
> > > +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> > > @@ -5,6 +5,7 @@
> > >
> > >  #include "xe_debugfs.h"
> > >
> > > +#include <linux/fault-inject.h>
> > >  #include <linux/string_helpers.h>
> > >
> > >  #include <drm/drm_debugfs.h>
> > > @@ -20,6 +21,10 @@
> > >  #include "xe_vm.h"
> > >  #endif
> > >
> > > +#ifdef CONFIG_FAULT_INJECTION
> > > +DECLARE_FAULT_ATTR(gt_reset_failure);
> > > +#endif
> > > +
> > >  static struct xe_device *node_to_xe(struct drm_info_node *node)  {
> > >  	return to_xe_device(node->minor->dev); @@ -135,4 +140,9 @@
> > void
> > > xe_debugfs_register(struct xe_device *xe)
> > >
> > >  	for_each_gt(gt, xe, id)
> > >  		xe_gt_debugfs_register(gt);
> > > +
> > > +#ifdef CONFIG_FAULT_INJECTION
> > > +	fault_create_debugfs_attr("fail_gt_reset", root, &gt_reset_failure);
> > > +#endif
> > > +
> > >  }
> > > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > > index 5e70e486b27c..691e3baf97c9 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > @@ -525,6 +525,11 @@ static int gt_reset(struct xe_gt *gt)
> > >
> > >  	xe_gt_info(gt, "reset started\n");
> > >
> > > +	if (xe_fault_inject_gt_reset()) {
> > > +		err = -ECANCELED;
> > > +		goto err_fail;
> > > +	}
> > > +
> > >  	xe_gt_sanitize(gt);
> > >
> > >  	xe_device_mem_access_get(gt_to_xe(gt));
> > > @@ -563,6 +568,7 @@ static int gt_reset(struct xe_gt *gt)
> > >  err_msg:
> > >  	XE_WARN_ON(xe_uc_start(&gt->uc));
> > >  	xe_device_mem_access_put(gt_to_xe(gt));
> > > +err_fail:
> > >  	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
> > >
> > >  	/* Notify userspace about gt reset failure */ @@ -584,7 +590,7 @@
> > > void xe_gt_reset_async(struct xe_gt *gt)
> > >  	xe_gt_info(gt, "trying reset\n");
> > >
> > >  	/* Don't do a reset while one is already in flight */
> > > -	if (xe_uc_reset_prepare(&gt->uc))
> > > +	if (!xe_fault_inject_gt_reset() && xe_uc_reset_prepare(&gt->uc))
> > 
> > When `fail_gt_reset/probability` is set to a less than 100 value, then
> > xe_fault_inject_gt_reset() will not always return true. So if the
> > xe_fault_inject_gt_reset() returns differenet values when invoked from
> > xe_gt_reset_async() and gt_reset(), we will have unexpected behaviour.
> > 
> > We should avoid calling xe_fault_inject_gt_reset() more than once in a single
> > reset cycle.
> > We could exit immediately in xe_gt_reset_async() if fault injection is enabled.
> Intention here is to cause next reset fail. Unless you make the probability 100 that is not guaranteed. 
> And no.of times more than 1 are perfectly fine as long as probability is 100. 
> Even in commit message it is mentioned clearly to use probability as 100.

Through the commit message it is understood that we need to supply 100 and >1
values for probability and no of times debugfs entries. But it doesn't
prevent anyone from trying other values. In such cases, it is fine for
the fault injection to not work, but it should not cause any issues in
the driver.
I think if xe_fault_inject_gt_reset() returns false in
xe_gt_reset_async() and true in gt_reset(), then we will end up in
xe_uc_reset_prepare() invoked but no gt reset completely executed.
Thought I haven't analyzed how it would impact driver, I think the
driver would be left in some unexpected state. We should avoid this.

Wrong values for the debugfs entries should have no impact on the
driver.

Regards,
Bala

> 
> BR
> Himal 
> > 
> > Regards,
> > Bala
> > >  		return;
> > >
> > >  	xe_gt_info(gt, "reset queued\n");
> > > diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> > > index 7298653a73de..caded203a8a0 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt.h
> > > +++ b/drivers/gpu/drm/xe/xe_gt.h
> > > @@ -7,6 +7,7 @@
> > >  #define _XE_GT_H_
> > >
> > >  #include <drm/drm_util.h>
> > > +#include <linux/fault-inject.h>
> > >
> > >  #include "xe_device_types.h"
> > >  #include "xe_hw_engine.h"
> > > @@ -16,6 +17,19 @@
> > >  		for_each_if(((hwe__) = (gt__)->hw_engines + (id__)) && \
> > >  			  xe_hw_engine_is_valid((hwe__)))
> > >
> > > +#ifdef CONFIG_FAULT_INJECTION
> > > +extern struct fault_attr gt_reset_failure; static inline bool
> > > +xe_fault_inject_gt_reset(void) {
> > > +	return should_fail(&gt_reset_failure, 1); } #else static inline bool
> > > +xe_fault_inject_gt_reset(void) {
> > > +	return false;
> > > +}
> > > +#endif
> > > +
> > >  struct xe_gt *xe_gt_alloc(struct xe_tile *tile);  int
> > > xe_gt_init_early(struct xe_gt *gt);  int xe_gt_init(struct xe_gt *gt);
> > > --
> > > 2.25.1
> > >
