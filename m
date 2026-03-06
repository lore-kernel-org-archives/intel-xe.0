Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12CF0FCC05D
	for <intel-xe@archiver.kernel.org>; Fri,  6 Mar 2026 19:09:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 943D810EDA6;
	Fri,  6 Mar 2026 19:09:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FWXdgF38";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69C0B10EDA6
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Mar 2026 19:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772824159; x=1804360159;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PGAT6naALxi5GZMy3kLqSJCKKwTDocee33I5FxMPdkE=;
 b=FWXdgF38L5KlN52wjtQLJxHLpT2S4QC0h5MRhNotgaMz34DabhyO7dvU
 hFKTaSkG8kRs0V8RJdFgTD6g0wt+r+qx9Fpp2H8S/LPJnUo34yaxW4Y/O
 zadm0B9DR+Tjfo/05XpUxDT8bo3/APmDBxQYIwF0GzHEruvSpytfoW27S
 mrhTsyE0WGCsPRvOoV00z4bJGVaLwb+PDEbMe+td1h75onXvzlIdNOhmq
 e4yZH6b6uKTc6ZE9qkocjdBgafQZ9ZZMg9uNeZ12S9VmhRUzRbFoOSQgO
 MI59YPMGbrJxICO8VAporfEhKnsspNTN7x8HQ3o8qwCcOpybUgWrYlJUn g==;
X-CSE-ConnectionGUID: twnWxU46SeOwtUroROuT6w==
X-CSE-MsgGUID: TvEBnvPWTnWVwMY6eljlPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="73639503"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; d="scan'208";a="73639503"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 11:09:18 -0800
X-CSE-ConnectionGUID: zQe3o6r+TPe6XMAR+BVRZg==
X-CSE-MsgGUID: 1+IlXaTRQT6CVSImfyY8LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; d="scan'208";a="223214710"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 11:09:18 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 6 Mar 2026 11:09:17 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 6 Mar 2026 11:09:17 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.7) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 6 Mar 2026 11:09:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tLoxxwINCKncgnpe4XR4RPu8pr/Xi44xiIjg3xzZnwYVkqV/9L1uIC4EhyOcoNrXISwHRyDjwMiDz6amyOxjyrAONPAl+PLbXHTWZ9n21WcDfH7lQOHqaa6oYEnXR89ovWy+Mipg2OZ/NWFKquAZ5qfkAeRB7vI5B8IF1Bbiaj/RQB9RUlzJDf8tLoJVMH8ZEWJzZ3IJXd6FbW8jvk9/0lJIY6yWo4GCyXLR9F2Yi6M7mKYEbpvMIY6zw93Oxpe401YS8a9ghoHVruqbRkwWSYSxLnkviPrWKM3YCYkQAt4IuH7r2FE2l3+xmmTowkcR3tI+DPT1OXUuGStYAEbPog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W9z+5BmjHHu4y+Yaja1RN7ZKfBXEyuDNrZlrKGaKZU0=;
 b=HAcb63WSCZ+6rmF9hrbqwvqrd0QDjW83Jy7up10kon8c2osGnh5v0rLEgkiDmGOsFSmbjTM1TUCACV4LgdEURloI5xj2C/6RihG2iPgWgCknaJ7OVgkWgL6or9MvD7Db5s90K1NfEX2ytDJKtnTInxdcmetzAvasNYdZRvBc4B/Y0v2jO1Dwp5y8LQNda0sw9IzpiKyNh7U+BwUuLAkc4W9yKGsi52LdIUQsXxmTg1Sxe8ygp1XyZqEaVzfjzE2kA/LJlSVfsaaNHCEI/o9GXv6tVyzBS8oo7MsKQx4uo3JPCWnRQ/chG4Pt0xrw9SwNXdhDfIpAQQfyP8FfOKKnUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ5PPF0D019E8BF.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::809) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 19:09:12 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 19:09:12 +0000
Date: Fri, 6 Mar 2026 11:09:10 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 5/7] drm/xe/nvlp: Implement Wa_14026539277
Message-ID: <20260306190910.GZ52346@mdroper-desk1.amr.corp.intel.com>
References: <20260306-extra-nvl-p-enabling-patches-v2-0-53dcfa6b44e4@intel.com>
 <20260306-extra-nvl-p-enabling-patches-v2-5-53dcfa6b44e4@intel.com>
 <20260306183953.GY52346@mdroper-desk1.amr.corp.intel.com>
 <87y0k4wzny.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87y0k4wzny.fsf@intel.com>
X-ClientProxiedBy: SJ0PR03CA0228.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::23) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ5PPF0D019E8BF:EE_
X-MS-Office365-Filtering-Correlation-Id: cf539014-5168-47ea-d587-08de7bb3da22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: sBZ1hlnl9YKP06dOVjNgHi6VDdLzylVVLwykUecwvdVG1hBkpoxVYit9epMIkZzbX2yJtQcZ59/L25V5eESHBR8BcaHfj621hwC3DhS6gY05omfduSr21rrpubk5eJ9oFzN3t+IT1BEBHDfpzFqjDyW29JtQ8sqB1KvvNbDrPpk8HV7bSeTqI0Hwq3aQYXwrPj/iAmK8VM+ax1OMLARlyZtDdJyDHuAOoapWY2azP9rovl9om19iWfW4UroyfC57ByYik4OAy8GGMsNf2Ji9KG1y0W8XLSLUd8qCDE2aeXIoOVZGtiYzgijHa+UU+szt93JB3MIBaAQdpx9xKESSBflnHvAMJoyZ/wtM3azlqclHUmtIhj6aJZsA1bWN1ArvqfqrIWuX3G2bqeYxHw77Cxqi3WfnaFgY6owG/ypetSsWcZtc9vLl869zW0F9W0jfa/9+3NztNG7OsQEKagJau/16+gup4XDUVqBWza4arj6Kiu9QFc9BozTixVmkQOXBcuQFBKNsgGogzeXWZ8tWW0aY1M/WlZeYHC4twtWXEAHEIeB59Oe9gbA6w4WqJxVD2dMtMVu1/66St1lIJLZD4g4Xx+cTsLu2RamdNwEvwaQrtyrD8J3FK2SCpY7Eme4EaQ4MrLtyk/neoPna++paPmoHQJXnZ21zm+xUw3x3/Ykzn6ZfT59tHKW65zSPoikva0y3zU+T5+cYUYR0+4ytBi3kd0Tk4YOnVGU1wLtDxq8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HHT+mxTv6PcyT+2G/wiVR5zExjW7c2CtK/DuOpJal1l98l3n8Wa5T7u2LpyG?=
 =?us-ascii?Q?OXH5VMWQ9tncgvF0qNOP776IUTwddxKUDY6OLW/Z77o7Z8mpWNn3E8WGqKCg?=
 =?us-ascii?Q?F1C4zbbcy5SpqJnJlNgzJ97eGdLvu3L5Pdxn2kFeS1xpU6NAZso7DKLMBbng?=
 =?us-ascii?Q?1UkkEVT+94zPHv0aYnG2Tx7rWDWT5VrkJASjDvCgmqivhxkVE5LdtNaRmYTT?=
 =?us-ascii?Q?IxtyycIizD/VJ9CTt5itdTeEwWiKS/1L39EpfIiM2Tkx7qqNgaFINvhBnu2T?=
 =?us-ascii?Q?fEXhVdz+J+cO2rE6Nty+CKjb2Gn/CK4oHsIt5qdVLZcqBa6d7kb0jZB1+eph?=
 =?us-ascii?Q?cmv2L6KlNZ+fgoqo1itoMb76qJhgiZ2y1/ozh1MdusOOMtSyn2Q9Bq1efwDM?=
 =?us-ascii?Q?Cxt8a1/HRHbrg7ExyjyzrfiH1tlpeuHZZ3ZgKPScQyFgC3bxHZQt/29dIHet?=
 =?us-ascii?Q?zmrR6xq9GWPXwlJNFohNshGgslMgGBKMICJkWva6XkfRkGOTr6NLRlTuziFL?=
 =?us-ascii?Q?v4thRrU/cw+bqlGguVG5DTWSCli1zgpScqjzGsn1I5krAziEhwk7KJ40A7Nh?=
 =?us-ascii?Q?FtYjOeB4StSLJ7oa0S3StqoM9W8mLNstZY8SzPsPseypmUrU756CE68QTxNq?=
 =?us-ascii?Q?u3gmwjcDGwaZO+Z1NN/5/umc9F1KTgk0VG1gMQxTEXqK6+7qy9hja5ozKDQF?=
 =?us-ascii?Q?a3BG9M0iUuHpR11g8E4r+cIYsH9MwVbVrfIsCfk65bcfFB7Y1T0WHwXpqJXo?=
 =?us-ascii?Q?KzDPi4/WUb4o7X0d67Utv6bpPKBxXHyeRXtgWydeRG8yz1ptrIfpmUSoEbWO?=
 =?us-ascii?Q?CJlohpDLNPqxbatp7vop2aCezXovq2c4gNBTZP+3Ltnz7kOfvtdWXQTY6218?=
 =?us-ascii?Q?dOhvRGtor2xZJiuZe3dtWVy4zXHrZsaT5gQgLWFVZTbCTy+foiFbKbuTF3ly?=
 =?us-ascii?Q?bep0rXwP+tf7zmJ5GLDYLlbcOMHYr6LkJk+c5UQVYwOZxX2Q13CstDxafhqh?=
 =?us-ascii?Q?OTMIuyKVc0EM0a+VB8OsVgcqAFonRe/KiJ88y74rV9nwxxYmd1cgdOseez6c?=
 =?us-ascii?Q?bBgzg4SZIJAX3nGG8ilFp6VUKylAC9130ALJjumuj4DR+YZziN+F+AeBoHi9?=
 =?us-ascii?Q?RDd/qKmkbbcH6Vywa0k4xN2UO715R8S4kG2TPD/lFgw3/QZ2A5hfeaIUGYRj?=
 =?us-ascii?Q?mj/Wj9zn4FaprMZqatwWpyzdcHu9JwLAO5bpqWwiUPTo/q2HmEzDVi4gsn7Q?=
 =?us-ascii?Q?RerxjthqcJSAER9xa5hJbS86iHG2zdnIdgvxsdje1ywamVWbjZz4CyAHf0xN?=
 =?us-ascii?Q?Z2rU4IC0AP71yLn9PQy2mev6n79CwfHFaqxTi1O/y7LvyfUN4CUu15YBiXzK?=
 =?us-ascii?Q?jLaqvIKz+2SA1757yPDJkQM+PQ/1G4akKflUPFWDc5RvIWEPHdxlj5Y/XzvX?=
 =?us-ascii?Q?R7qktNUPGHUitcmN7iFaJr8ftbzjlnXuwTWHpS2z3HFTyJMv6ZXb3PlmYWF5?=
 =?us-ascii?Q?eoqAOfFmDw2GZFbF5SI/oGaZDrmj129x92TuTdhHqP5oRbAqmxvfY/nDWV2+?=
 =?us-ascii?Q?86KR3EM2jI3kr07+iF4Heiamus7YrG4kHTSm32rLYqkQE7sNmBnX/wHIYT9x?=
 =?us-ascii?Q?GGKprgUCZynOueyRmby5gqOoM4TzFDn4sOVpzK/LnNXoheU0zvqpAbC53KEf?=
 =?us-ascii?Q?59l6ARhMZpcUb2n/bf3TGac9oukYQeGi0dCNXd/EKWbONmHJG5I8xOOpLpxc?=
 =?us-ascii?Q?WrpRFx1aUhiprA4DurivQ6T7T02tvO8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf539014-5168-47ea-d587-08de7bb3da22
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 19:09:12.4287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4VkPRKj21D7vZqTJCJ4yW8VDVps5vl9QGGT66/8oP8J4q+A5Qdrdpc+kzAb1MthX2lZJo7lduGXrKLhy9dY0AuQSo6XMP0KSG9gCeLW9dhE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0D019E8BF
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

On Fri, Mar 06, 2026 at 04:01:05PM -0300, Gustavo Sousa wrote:
> Matt Roper <matthew.d.roper@intel.com> writes:
> 
> > On Fri, Mar 06, 2026 at 02:28:25PM -0300, Gustavo Sousa wrote:
> >> Implement the KMD part of Wa_14026539277, which applies to NVL-P A0.
> >> The KMD implementation is just one component of the workaround, which
> >> also depends on Pcode to implement its part in order to be complete.
> >> 
> >> v2:
> >>   - Add FUNC(xe_rtp_match_not_sriov_vf) to skip applying the workaround
> >>     to SRIOV VFs. (Matt)
> >> 
> >> Cc: Matt Roper <matthew.d.roper@intel.com>
> >> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  4 ++++
> >>  drivers/gpu/drm/xe/xe_gt.c           | 27 +++++++++++++++++++++++++++
> >>  drivers/gpu/drm/xe/xe_wa_oob.rules   |  2 ++
> >>  3 files changed, 33 insertions(+)
> >> 
> >> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> >> index 66ddad767ad4..a83cafbe03fd 100644
> >> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> >> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> >> @@ -452,6 +452,10 @@
> >>  
> >>  #define XEHPC_L3CLOS_MASK(i)			XE_REG_MCR(0xb194 + (i) * 8)
> >>  
> >> +#define L2COMPUTESIDECTRL			XE_REG_MCR(0xb1c0)
> >> +#define   CECTRL				REG_GENMASK(2, 1)
> >> +#define   CECTRL_CENODATA_ALWAYS		REG_FIELD_PREP(CECTRL, 0x0)
> >> +
> >>  #define XE2_GLOBAL_INVAL			XE_REG(0xb404)
> >>  
> >>  #define XE2LPM_L3SQCREG2			XE_REG_MCR(0xb604)
> >> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> >> index b455af1e6072..3c8692f9b8cf 100644
> >> --- a/drivers/gpu/drm/xe/xe_gt.c
> >> +++ b/drivers/gpu/drm/xe/xe_gt.c
> >> @@ -450,6 +450,25 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
> >>  	return err;
> >>  }
> >>  
> >> +static void xe_gt_wa_14026539277(struct xe_gt *gt)
> >> +{
> >> +	u32 val;
> >> +
> >> +	if (!XE_GT_WA(gt, 14026539277))
> >> +		return;
> >> +
> >> +	/*
> >> +	 * L2COMPUTESIDECTRL has a specific offset for media and the GSI offset
> >> +	 * does not apply.
> >> +	 */
> >> +	xe_gt_assert(gt, xe_gt_is_main_type(gt));
> >> +
> >> +	val = xe_gt_mcr_unicast_read_any(gt, L2COMPUTESIDECTRL);
> >> +	val &= ~CECTRL;
> >> +	val |= CECTRL_CENODATA_ALWAYS;
> >> +	xe_gt_mcr_multicast_write(gt, L2COMPUTESIDECTRL, val);
> >> +}
> >> +
> >>  int xe_gt_init_early(struct xe_gt *gt)
> >>  {
> >>  	int err;
> >> @@ -575,6 +594,14 @@ static int gt_init_with_gt_forcewake(struct xe_gt *gt)
> >>  	 */
> >>  	gt->info.gmdid = xe_mmio_read32(&gt->mmio, GMD_ID);
> >>  
> >> +	/*
> >> +	 * Wa_14026539277 can't be implemented as a regular GT workaround (i.e.
> >> +	 * as an entry in gt_was[]) because we would get the hardware already in
> >> +	 * a bad state by the time it would be applied.  Hence, we implement it
> >> +	 * as an OOB workaround and apply it early to prevent that.
> >> +	 */
> >> +	xe_gt_wa_14026539277(gt);
> >> +
> >>  	return 0;
> >>  }
> >>  
> >> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> >> index 80b54b195f20..03a0bf0aeb6e 100644
> >> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> >> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> >> @@ -58,3 +58,5 @@
> >>  
> >>  14025883347	MEDIA_VERSION_RANGE(1301, 3503)
> >>  		GRAPHICS_VERSION_RANGE(2004, 3005)
> >> +
> >> +14026539277	PLATFORM(NOVALAKE_P), PLATFORM_STEP(A0, B0), GRAPHICS_VERSION(3510), FUNC(xe_rtp_match_not_sriov_vf)
> >
> > I don't think it's right that we have both platform matches and IP
> > matches here; that's not something that should usually happen because
> > the workaround is either tied to the platform (NVL) or tied to the IP
> > (Xe3p_LPG).  For device workarounds, the handling in our graphics
> > workaround database can be a bit confusing since what we're looking at
> > is really just a proxy/placeholder ticket for something that was filed
> > in a different database originally.  Due to how the databases work, they
> > have to slap some IP release on the proxy ticket, but in this case we
> > don't need to add a match for those to our driver rules; just the
> > platform information is sufficient.
> >
> > That would also mean that this should probably be an XE_DEVICE_WA()
> > rather than an XE_GT_WA() and the workaround function we're adding here
> > should be renamed.
> 
> Hm... But are we meant to apply the programming to the media GT as well?
> I thought the issue for this workaround was observed only on the primary
> GT.
> 

Device workarounds operate on the xe_device rather than on any xe_gt.
So if a device workaround asks you to do something with with GTs, you
need to extract the relevant GTs from the device.  Novalake is
single-tile, so in this case we'd do something like

     struct xe_gt *gt = xe_device_get_root_tile(xe)->primary_gt;

to grab the primary GT if that's what we're supposed to be working with.

> So, should we make this a device workaround and add then make sure that
> we apply it only on the primary GT in the function that implements it?
> 
> We will probably need to rework device OOB workarounds in
> order to make this change, because stepping information is not ready by
> the time device OOB workarounds are matched (i.e. when
> xe_wa_process_device_oob() is called before we read the stepping
> information into the device info).

I guess we should just move the device stepping determination earlier.
Figuring out the platform stepping only requires information from the
PCI config space so it should be possible to do before anything else in
the driver (i.e., we don't even need the MMIO BARs mapped yet to be able
to determine the platform stepping --- and in theory there could be
device workarounds that need to be taken into account during the very
earliest parts of driver initialization).


Matt

> 
> --
> Gustavo Sousa
> 
> >
> >
> > Matt
> >
> >> 
> >> -- 
> >> 2.52.0
> >> 
> >
> > -- 
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
