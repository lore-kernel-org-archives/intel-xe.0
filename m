Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E27C27C53
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jun 2024 02:00:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 433DC10E02E;
	Thu, 20 Jun 2024 02:00:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kikpy/Jk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FFF410E02E
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jun 2024 02:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718848815; x=1750384815;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zL1JITnbbo41fL9KhhXJipqB3RQ3L18kJ3rBvEGid44=;
 b=kikpy/JkcnXIJztBcHL734HWXALo66LR6ZS/fKKSCcRKSozmT7utN4ds
 PofKeiSSORHAPD1VtlMBtSixEpBeHzt8Xv4QizeMAm+1N4tDgZ/iTAZ/F
 O+w343Sj0dhRGIoQrKKPSgQ5LnN+1CDUXmtknZFy5T4fKFlS0Kwl/91vt
 xaf0B0aZxQwrxYCh6U0xd+zv2R+x7Buajn15c9fYNQFQNEWe8wzz9RK3w
 QTcUhGw1ZFrdrMymdfCbP0wr47h4qcWEuhjbFn9fFFs8CXG0t3TsCFibv
 LEdhjHdvmVDRitsP7VBaFhnaI+zlyCIvSgdkeLPGUYrHNgo3Zg5w/b9EP w==;
X-CSE-ConnectionGUID: wP+tzOroTsSrmnI8NyVRyw==
X-CSE-MsgGUID: pjL5SPNeRYqL3DQP4y2KEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="38318616"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="38318616"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 19:00:15 -0700
X-CSE-ConnectionGUID: 7lih6nT7QS2gi5JL45sCqw==
X-CSE-MsgGUID: P+7YcHdaRVWs8F+JSfKbxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="42203144"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jun 2024 19:00:14 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 19 Jun 2024 19:00:14 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 19 Jun 2024 19:00:13 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 19 Jun 2024 19:00:13 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 19 Jun 2024 19:00:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SKKH2EqS0y9muHM+m7j77GdpABpXXxb0jTA8mKVo0a4Wj9SJqnkaC1ZRZJH/YSM19eYTq/9LfsW6i2rlq8p/QJoncq4JVMiFna7LIypTdX+Z2raEUPr+JSjcX8ioW8dtaLS0xotH4QGj4zDvtmVZusay/ToVIEUho167wt1ysodYiVtzd6rxfKcdoga9Dq4dnRF3WdsaTmJO8H5v7JHuFt5O0H6T6XFTD04/fdJqkGQ5N/yTkRwOkGdjvtKRUFGkyKO29mRelQlQgX4gdAAYHHYVR9i4p5qdlWT3G0TkXwtO526B2DA9iihyB2jRqZl0agGwlyktu7GSqNcwUM57Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aDF1DVLFdfs0/vIGWMIhYt1T99stzvHnb8ExGpkOz1Y=;
 b=ND2kWm8qvcPwYLctkhVV5K3AdM4RRI4fS5WDm4CHQe5zsFPGUc4Et7+zFxdVKhcF+MQMDV4IRjFgbYz/0TzFsIuyffWO59LyLusjetbM+4t0KOxLc6ZUtDnO8bhNBGbuL0NeowLvUre+nEKk/umSkl+SQph/MfPv7b+9i4kwVORL8egCnLeWROy7bTpNcDbtLW6zc7ZXtOdH1OgCb7cj+vfaNCwxcSmBESjfMbVxi0a579jEX4kfckJ3e7O/80DTBZE27MThjdtjsOA6PECmBxZqCanQogZahfmDzlOjTUvHa6q07+LHW2P1zDYk56dAuYsg5X1+bmC0sR0MyAP0sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL3PR11MB6337.namprd11.prod.outlook.com (2603:10b6:208:3b1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.28; Thu, 20 Jun
 2024 02:00:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7677.027; Thu, 20 Jun 2024
 02:00:05 +0000
Date: Thu, 20 Jun 2024 01:59:32 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 9/9] drm/xe/vf: Custom HuC initialization if VF
Message-ID: <ZnONBAraFktx/OCe@DUT025-TGLU.fm.intel.com>
References: <20240619214557.905-1-michal.wajdeczko@intel.com>
 <20240619214557.905-10-michal.wajdeczko@intel.com>
 <ZnNloxEj2yHTYahZ@DUT025-TGLU.fm.intel.com>
 <fff7c121-5b1c-4433-bfe8-403f685a889a@intel.com>
 <ZnNofcyDFwoy7MDi@DUT025-TGLU.fm.intel.com>
 <0e854a3e-b552-474e-8080-1e139e466509@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0e854a3e-b552-474e-8080-1e139e466509@intel.com>
X-ClientProxiedBy: SJ0PR13CA0134.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL3PR11MB6337:EE_
X-MS-Office365-Filtering-Correlation-Id: e4cf8721-130b-45bb-836c-08dc90ccb479
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|376011|366013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zs+GDrsaXjIQX9Uha/+i3RpnCtomByY7jorNm+huas9rlUfifhvtkVsem03u?=
 =?us-ascii?Q?+2CKbBv4Gos9rGGVDVd8BGLEK+SCHWqdPZ0sEsKaZTf1jHMcJo+c3n+qFFeO?=
 =?us-ascii?Q?3nuJdB3W5v5gyYV3WxZ/Z8+PBEozFOcCyN36QKnu85GuxLEC8E/WMbk6OaBf?=
 =?us-ascii?Q?YZxf8u80Yltz9xz+0XEMvOvnO2nhPYkyKRBuiDRXOtsB13LoHUD6UcW/gWha?=
 =?us-ascii?Q?5HqtvlGIS+9YEVAuw+PMskt49ltvSnHv1qhSEqRS8yuPUoWciLWUXIiRT4+j?=
 =?us-ascii?Q?6KOxs0XqevBzeOcVknE7bhZVaFJi7VrZPkoo5pJ4Z7nu2C2yhb7rLbLHr9tw?=
 =?us-ascii?Q?aIz/R7ztkAC4IRDXBtx4eORaV1N3RTEDecFP5wxu2iLPVhRzRLF+75kJrbO/?=
 =?us-ascii?Q?FVKAHpdDUmpCXKD4+EsHqsvvA/nfgUZ84NbcBA6Oy/LgWxN2cZx2iPZ6SBat?=
 =?us-ascii?Q?McTu0prSGHwmy9sl7JPuo/S4E8ZnqxJqAx9nVg83QNP4woiSScxf49y+07RA?=
 =?us-ascii?Q?wbtbUhl7CGE+fbOom0y58iOPRME55EutWwCCNonCGabhOz4TnlAFVi3dfQ7k?=
 =?us-ascii?Q?KGXfTqTzi4gDysZARdbrB2yIutZQIHiY45nBFHNrwPw9pUUgdhCT1r+yik66?=
 =?us-ascii?Q?HB6l16kD9VlVy6YKkHCTgNe+aHqNs7KVy9kSGM1NPTLXHwEggWxSLckV/ghB?=
 =?us-ascii?Q?0lT8hjcnP9EkWKmxQy6vbc7ETnbHr5fIh/n87LhXO/3d/dkdvXRuWy7XwgEa?=
 =?us-ascii?Q?kFbVZdpoSA3z3oAaTCKXUA2Vv/De3X309y7ko+/TKEua14fY7orY+GKlp15k?=
 =?us-ascii?Q?UTDlHXwu2WJ7SrdXavS4njr8FWtM/Y3S0UQVEgTKsDAN5/+EgtJ1Ncarmz8A?=
 =?us-ascii?Q?4oHUT6j3/bAlLB9j1qshY2R2o6NWqLSkEDEna/91Co9GuyGeQkokmA3XLL+Q?=
 =?us-ascii?Q?owzm6d0RiclDVAtFQklFduDk9io2KqZkpKuWL1Bmw1w8sCsXi18zbxxV6a1r?=
 =?us-ascii?Q?Ip4CyVjGEjZidn+tMvaEIR8uYk1YyrRl12cqLlqoAapFltDETeubOoqQo8RH?=
 =?us-ascii?Q?DZXtxYYvHGGpPTlBBscT44P7XsJuUL5ICGb6Cjv3PO99KtMhYQ2tp5tn9zAo?=
 =?us-ascii?Q?dRBdGEaw57jKN+huf0ZkSMcCmivADXmbvuJbEwqhpflSvTO4cKKseQFi+Bh2?=
 =?us-ascii?Q?of5QRTs69KV3WDPubaGTYLxfjiNXex3KDbag5OBSAQce0TrDDnCzjO/mX3FN?=
 =?us-ascii?Q?A1h0Pj51lM8uIGxNf2v+P3PGqNht58KdkPYCtd6aW3gzpKzZPgjm2tMdWjRI?=
 =?us-ascii?Q?5yw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(376011)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?77st6SH3TvT4CHvBqIHQCcD8e3i7KwxpVevpuQcS8BxRBNHRdBE5AqyfG28X?=
 =?us-ascii?Q?Bs9oe0rlQCih3Kw7p20msH6vGmCdNSGcgIaHHj7ysEV7rBU26Hya0e7tDXjb?=
 =?us-ascii?Q?gcW/ABY8SnlhDRjTuA3bxPxVH1ri6UXwkezGHNZCjAIWq5wVKps4ahCQyrt+?=
 =?us-ascii?Q?nFA0pD+UgjZldTsVdKzsF6QiLDucmuMrf+tiIQQwl5PRurY7mSxBVoVcS9xt?=
 =?us-ascii?Q?vTr0rlUDVFY7FFPKV2a80hUqFgHW+j3PB+UEVKn5dIjqwgra26Ib0wQwKZ+G?=
 =?us-ascii?Q?YUu2hjQ2NNJXydBakQ1vei5b8DLmVX02UuZTCVMbC+4edBhbFW2VutweZbM2?=
 =?us-ascii?Q?/I8RoPgJ/b5RGEhXdndWcxgDOmB4ruW9fDtunIPddHlPeDz5iYZ/Hk+17zsk?=
 =?us-ascii?Q?sJtwdhkdAnP+P4eX8hFSCMog0rhu7aPImohrPyKfWTgiOZDzppx9vN/gcQ6D?=
 =?us-ascii?Q?gGg6D1PJ+SA0PTQj2S7kwRl7hSzMLd3yhTlonAZeeoStCnrk+xrukSmgKEq6?=
 =?us-ascii?Q?MqRa2wwkgVNuIhQRFBswDf1v9pQvaT2hPn2TeIco26WTVmHnAYaSJ4MpC8Ny?=
 =?us-ascii?Q?95vRGKyGjgHQxfLm8pdZjmkRZV64cLe64+gZA7WM3bzNC8v7JfhfdD/SOGIJ?=
 =?us-ascii?Q?a3Lbo5e7ofjdzQGvrUxMifwfHXpfdSN003TNf1ZH8cLK47OggtKpMf+3g+mw?=
 =?us-ascii?Q?hInTEyXkRsvhvXFr8T5XVLdesOtT1V5nBAAFeqLSne2QsKtIE8Www3ST4DjO?=
 =?us-ascii?Q?Zo84v5lcBK4VxGWECS8K7lhNvkui5AAKJV4WdpKZTFG+oILHUU4N1grYQ7sY?=
 =?us-ascii?Q?1pix7YtA67L4l7epa+nb6ENH3dNvwtV0XEv14fPKBX3ntshPaWb3E+QjZoJd?=
 =?us-ascii?Q?w9OXN/R8TbbnnakOsCdSSgNUaBLP+kg+TfHHPtINfwj/8trI2mFAhBKY3Zok?=
 =?us-ascii?Q?A+AypRq+DGbLd3ZJ7Bpigubt9W16vW8LTgl+VE8qEXrKRvEZWmg8CIb9YRNQ?=
 =?us-ascii?Q?9j/U07TSo1uJL27NUC27YXNmW/n4o6P7cTF/gRWB2SuCPM3MBC/IfwgEP67w?=
 =?us-ascii?Q?3rh/usFR/q3nK7261COtfEImz8HjC7WsHMf0DWV8GsVQMAZ4zUpsUTOkuACq?=
 =?us-ascii?Q?KWTdoky2cXXcHs2HPKMPCBPyE3gQxdVn9gDNveSGmCgLa58sS7rrvYp0F3Yk?=
 =?us-ascii?Q?mY9bxnMVt4JaaKH5ZAo/EUIGa9jhqwP6UuExfmNojrgvsdGXD4rNsHdPlM0U?=
 =?us-ascii?Q?bmyDiUYqNM8TNu09OR8C//aIZgymgwVl8TU1H9N4jWG85NC+bnZ7L82h4ZD0?=
 =?us-ascii?Q?Qj1sDO2GEKqxhRCrLLk14VECxu+bXMpV2qgJztUzVXCuQGl7+UjxdRvXCb1c?=
 =?us-ascii?Q?nmkOGU3UDKjEUC0tVv19cwGFTjibuXW4+MutKAjcPB7JadcXxdYhYF1OvbvO?=
 =?us-ascii?Q?MfpHcUVl85cVMOh9Az5UpVaH6elDULSTNc5GvS3ojZdKq8dhTh6JMqDMfVf1?=
 =?us-ascii?Q?ZQqGf/30zN5Q9UegE2/AMa3G+ohh5B2ScvnutsdN6Iunl+LEYefKBRAPjKPU?=
 =?us-ascii?Q?1GV47PVImP9BKkLkPXBGK21e+QyhezIc4nUPOVg8WHaH3ft253dcNLbdlbny?=
 =?us-ascii?Q?YQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e4cf8721-130b-45bb-836c-08dc90ccb479
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 02:00:05.6922 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eQZfrtv1zH6gbZ3ijxVj/RmDfjMPZxR8Gpz6jq3gn+Jk5gGCiKAqf6i3e0hUiu6yGLdOXUeWLv8LgiIcUfB8cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6337
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

On Thu, Jun 20, 2024 at 01:34:43AM +0200, Michal Wajdeczko wrote:
> 
> 
> On 20.06.2024 01:23, Matthew Brost wrote:
> > On Thu, Jun 20, 2024 at 01:14:29AM +0200, Michal Wajdeczko wrote:
> >>
> >>
> >> On 20.06.2024 01:11, Matthew Brost wrote:
> >>> On Wed, Jun 19, 2024 at 11:45:57PM +0200, Michal Wajdeczko wrote:
> >>>> The HuC firmware is loaded and initialized by the PF driver. Make
> >>>> sure VF driver performs only limited data structure initialization.
> >>>>
> >>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >>>> ---
> >>>>  drivers/gpu/drm/xe/xe_huc.c | 4 ++++
> >>>>  1 file changed, 4 insertions(+)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
> >>>> index 6238fb354914..c88761fe31c9 100644
> >>>> --- a/drivers/gpu/drm/xe/xe_huc.c
> >>>> +++ b/drivers/gpu/drm/xe/xe_huc.c
> >>>> @@ -21,6 +21,7 @@
> >>>>  #include "xe_guc.h"
> >>>>  #include "xe_map.h"
> >>>>  #include "xe_mmio.h"
> >>>> +#include "xe_sriov.h"
> >>>>  #include "xe_uc_fw.h"
> >>>>  
> >>>>  static struct xe_gt *
> >>>> @@ -92,6 +93,9 @@ int xe_huc_init(struct xe_huc *huc)
> >>>>  	if (!xe_uc_fw_is_enabled(&huc->fw))
> >>>>  		return 0;
> >>>>  
> >>>> +	if (IS_SRIOV_VF(xe))
> >>>> +		return 0;
> >>>> +
> >>>
> >>> With this change I assume the main part of xe_huc_auth is never called
> >>> on a VF?
> >>>
> >>> Does xe_uc_fw_is_loadable return false on a VF?
> >>
> >> yes, as on VF it is marked as PRELOADED, so:
> >>
> >> static inline bool xe_uc_fw_is_loadable(struct xe_uc_fw *uc_fw)
> >> {
> >> 	return __xe_uc_fw_status(uc_fw) >= XE_UC_FIRMWARE_LOADABLE &&
> >> 		__xe_uc_fw_status(uc_fw) != XE_UC_FIRMWARE_PRELOADED;
> >> }
> >>
> >> returns false
> >>
> > 
> > To be clear, I'd add asserts to parts of functions which should not be
> > executed on a VF if it is expected to short circuit on another function.
> > 
> > e.g.
> > 
> > xe_huc_auth()
> > 	if (!xe_uc_fw_is_loadable)
> > 		return
> > 
> > 	xe_assert(!VF);
> 
> hmm, but then we might pollute the whole driver with such asserts, as VF
> really can do only limited stuff
> 
> besides, we already track any unwanted access to unavailable registers
> from VFs in xe_mmio_read32()
> 
> 	if (!reg.vf && IS_SRIOV_VF(gt_to_xe(gt)))
> 		val = xe_gt_sriov_vf_read32(gt, reg);
> 
> ...
> 
> xe_gt_WARN(gt, IS_ENABLED(CONFIG_DRM_XE_DEBUG),
> 	   "VF is trying to read an inaccessible register %#x+%#x\n",
> 	   reg.addr, addr - reg.addr);
> 
> and I'm planning to add similar code (or xe_assert) to xe_mmio_write()
> 
> finally, GuC will report errors if VF will try to execute privileged action
> 
> so IMO spreading xe_assert(!VF) all over is not ideal
> 

As long as some warning pops, I agree we are likely fine then.

Matt

> > 
> > This patch LGTM to me though. With that:
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > 
> >>>
> >>> Matt
> >>>
> >>>>  	if (huc->fw.has_gsc_headers) {
> >>>>  		ret = huc_alloc_gsc_pkt(huc);
> >>>>  		if (ret)
> >>>> -- 
> >>>> 2.43.0
> >>>>
