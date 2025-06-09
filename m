Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38035C5B552
	for <intel-xe@archiver.kernel.org>; Mon,  9 Jun 2025 15:05:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE86510E02C;
	Mon,  9 Jun 2025 15:05:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KVbtay4m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 252BC10E02C
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Jun 2025 15:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749481547; x=1781017547;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hLxkIhVUCkb0+oUC93gK0C5RH6Xo06/PUcMimu3auqQ=;
 b=KVbtay4mmewlnljRGU4iVzeL0yZHEiKgJuQ1tGyKG/FJQ4xzk4Tf4dSg
 dfSd/fSiQS//0ujF82HydW0AfHu4fVvcc8oanyRCjlYyMlWjv++gIzq4U
 Lv69+/qi2xEJJPz7o4ZlKd1U3wfFDIje0LEcZ5Jt796O7ynReMAuyqmtX
 FYPmjHAcrO+Uf/j14J6pXEsTT6jzVtySyt2xgg+Uvv7zn+LyqX0dv8hmp
 bKNiO15m3SY3i8d7LC7HCpWKun/zA4homRwBnOZ+UWiX/zFHC1Cys5pCh
 IeVONv9xA844OM9Aah0tAn7CDuEN7xQOrioSvHdpzlN/4M+P4Wp3kAtQl A==;
X-CSE-ConnectionGUID: oVgmHJOmRR2HeJdNf4tqPg==
X-CSE-MsgGUID: BKk1ZB7BQfaSYbBB+z3rnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="50787697"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="50787697"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 08:05:47 -0700
X-CSE-ConnectionGUID: qQ4O14i+R6eTThX+L3fSZQ==
X-CSE-MsgGUID: Qv9OtimnQcmojgjJnghnVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="169712366"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 08:05:47 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 08:05:46 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 08:05:46 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.86) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 08:05:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mI8JhREKbvARCc9anX2S8gnDen8MvljBpoxmw2lYQRu0uOYCVXoGpKEbmgkAK+3Sbn6v4AJlVReXIqbNKro8djtAGNkl5vwLF4hiDwo6XqAcsA3ymhA13IB3BZvEPQ2r1UykhZncbEqQkec95eVQM3W5mqprJOH5c19JvZOSqetGjnPSzEy+QanKds2lm/oqI0jZgNugrsNJ6/DhTgCDto1+r4hx0tG8plbZRoIq8otYBQxCMPCrf9l5TvNEXd9Xi8SgiTZuCpqM9bWX0Ucq2rV6BKrCY94Qmb/aUhOnnRuyHk+ReR468asKv3BzppUULgkGz1PN23KGCYBM47N2LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4qFD46FH3XJv3+jA9HyMEgTZb3u9oU0nEDldG7csqaU=;
 b=b07jO6uZuTsiiCb8IZr1leiHG+kxZdjIaBEscLWwtNU0OoJ/of/yLyptBNtm0AIpAZxopY0LOpPpzHpPYvL02Jw0oapg36ZhaVIIr/I3PQpIGRdrM6Th6mUo6LZWZzmgPRzAXdbqEI5m6NiQ9rNFqR+iKXW3ptLOEJTXW922/xmRo2P/1DFl8RtqgLqZvQJK02ZttWUnp2JnfY0L/0lM/mYERpGfMKXih8eLmgdrt8Wb7+EbkZcWtQF/LRvjWSkSc4jU/jauskBnFcP3AfydaE3oG5kWfUW8p4ojtGsJ+bzdDcwb95Yllo9tFS2Psmw9Cx/gWVzUsWdkEvNuxctsOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH0PR11MB5951.namprd11.prod.outlook.com (2603:10b6:510:145::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Mon, 9 Jun
 2025 15:05:30 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 15:05:29 +0000
Date: Mon, 9 Jun 2025 08:05:27 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 8/9] drm/i915/wcl: C10 phy connected to port A and B
Message-ID: <20250609150527.GL6239@mdroper-desk1.amr.corp.intel.com>
References: <20250606195104.1771715-1-dnyaneshwar.bhadane@intel.com>
 <20250606195104.1771715-9-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250606195104.1771715-9-dnyaneshwar.bhadane@intel.com>
X-ClientProxiedBy: SJ0PR05CA0027.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::32) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH0PR11MB5951:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fafb899-9576-4fa9-f43b-08dda76712b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ToCVY2iBqk/MiqO6yQmI7AMr+RngZtOS4gxFm1D3b6CUwUxaiHcOuT/xjUNw?=
 =?us-ascii?Q?/ygzidE02fPf2iX6uJbwuDobjkwtbbZ30iqroM7THWeukZCfP9u8dAnzgFI2?=
 =?us-ascii?Q?b5+zznfw1HABpGj8mBiZR+vA0ctYLn34qLlZVlfyEIC4NNCEawd6d90kL5LF?=
 =?us-ascii?Q?cgf+KhG7dN7TcT4BltrU4sXyV2pBd0hImrBUhtiu+GB+l+A5t5HiU9HQzQPc?=
 =?us-ascii?Q?0+Cn3l5J3whj1ypE51DJA21FFv+w35ZQ8C8KYlwicxPx7Kds8LfiRtY7ua9I?=
 =?us-ascii?Q?Dt/t0+toVVUC8r7XLbra6oHCAcToVqXHjEEceYrMvNOKsFjv7u0OuX8igOBX?=
 =?us-ascii?Q?tJf9wTXGnNFSIVL8Dc7XEBot7dP7gpeP3HE2vhJFlUT3a5JyAVJtyEga4Zuu?=
 =?us-ascii?Q?dIfx4o+iaXBDrsPzQVfaS/q2O653hCMu6/Eul0hBflKaPXDZKZQvPl2OVOwV?=
 =?us-ascii?Q?p+IvagJp2dPmG4+uw893K6LF5/LySTt9IBhC5lu5bzH/iDJMDO9tS+KWsW2r?=
 =?us-ascii?Q?IdCLMUeh+6umvCzZfpInf/OI7YNtJ/tCYen6OOidujQQD6h4hwtrVNLqP7mA?=
 =?us-ascii?Q?Zg1eyptxFtumqni5QwWpX2H8YncqNrrw3EzaQ8zAy5GQst163/o+RbrdplBm?=
 =?us-ascii?Q?Pkb0XPU8hqIXNXQwOHzrYyOOMO6riDQaxG4e0AEyB+trZJ7KOPP9xpVKawTC?=
 =?us-ascii?Q?DKWN2wVr0x5+Jyh9olP/vcvDyhr46uJU6175V6LqN7Q/AsKvifxqNVfX1MhI?=
 =?us-ascii?Q?tYx88oQKIf0GSwp2Nveomyk+GBkGcCvA4tvdZ6TabPd9DDyOlAmAB2UpG0Nn?=
 =?us-ascii?Q?m9vecuMz8mlWE1AhoG7BS7uVe6UOGjREtMNcM1nN+It/qgBLHRrLxYCKI1qU?=
 =?us-ascii?Q?lUX4N9+QKEgqeYja8VQTZ+erP2Z19D4zad+JuT930WgfZ+piHvxLCMNRbukC?=
 =?us-ascii?Q?IXmSd655dE6lQBzrAaliOyzkXOLZnceFRup4hdHfqciaDqfrskGizyZP1Kq5?=
 =?us-ascii?Q?ZIFy5b25SJWrJ+pacgfYi8NZ7qI9q8deHBxav6GU1fl2ZEtutj9jDFth+hgY?=
 =?us-ascii?Q?zTzjCIcoFrLANFMPlyflJqxw8+NAoCQUD6EIxTC84RB1O52dMrkDSSolh3H7?=
 =?us-ascii?Q?BgvktJVd2ihySBk3htaKsodX7xBZhLtpeHiPiF0qPFSa5dkj0pzmTXC2weUT?=
 =?us-ascii?Q?ccd8EHcdeSg8DEm17eGm1L1h/E/VvoDOqPIrUfCp8PeaQD7qIJW+GtB6qK+E?=
 =?us-ascii?Q?e2tm+cH1De0gwHc0S4d3obQ9VAV/6N/Z7zinC7n1o6aJFtHAsPjIv7Q4CHTG?=
 =?us-ascii?Q?dGKIOrNZuBrbfPNFjKcYHJn+ipl6B8UpQfEDgvxSynDNLbfwSNXri1ySGioI?=
 =?us-ascii?Q?zmMr2Hd30IycdxhLleHsrqzpdtrmIUlvjS9fuBjAlFShR0KlGDaqWUxrAt35?=
 =?us-ascii?Q?71Y0gYfxecU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k2BMa4ZQGQQWjsYNUZFjcXL9vS6gfXV6dKmmQp+oRt+97EOPNiJrQPpQHskL?=
 =?us-ascii?Q?tdm+DVahHBw5PydFz7yKFM+JywFeo2HUlLJuC8Z9ur/7PH6tpk5aGaqfxvO5?=
 =?us-ascii?Q?43B7z+MJV9QUplGBgRQoengOVA6zK21ZD1TcO29ETCvXSeq88usgpbRnQctP?=
 =?us-ascii?Q?lTljtOaiFE6/BIF9CNSzKzrpsRbHME5OvGAoCdmX2W0mXHPxQ5BL44gOHLzW?=
 =?us-ascii?Q?SPZSXzM//XdNkV5qXELrY6gdl32x7yKXU0T6e/81i8dDpN0ZrMSTKQshRy9u?=
 =?us-ascii?Q?z+oP1GPe2JedIFmuWYz3eNGGTRjlEcal+dIICAF4tKz92Rm7FpSdmu8cCTO1?=
 =?us-ascii?Q?Wapvv5Swx2QmjP6WP5L2mJhYDDYxWLCQTxXkxq5s05emuxPUp6BPi94EHJUb?=
 =?us-ascii?Q?6tMDHTHVce8i7C1aKK//n+q6YZv6cipylKNmXhZFSD9Q17aTleIDzX8a7agE?=
 =?us-ascii?Q?HKWPnaA0H6XwVd81xPQ288432djPwTLkVwYhPe75L8hX/2H1eMc+PVz7z79p?=
 =?us-ascii?Q?UZJNDed8whlLtx+Rrexj5exILyzr9nayv4rYrxsDImxz8odxTQK4XobweynY?=
 =?us-ascii?Q?d/z1myWciDSBHPjkEeYZ+a45nSBPnbGVb5RIevv/g1oppZhaLUIZ1B/lSbtD?=
 =?us-ascii?Q?BzFEXkkXpdliLGPhBR2MEEHHuO1ZJn497V7gZQysyCHCxYVClcx1mdizhW91?=
 =?us-ascii?Q?iBKbUxhl3KjoB3LIIANra2k+vethIAvIlUMAt6aKoQ9Se3pRjvdey6IeyyzT?=
 =?us-ascii?Q?mqLbqFi9VuOm2KQxCKpCV1VpXvxU0X2l8byLCQ1Ws+Ov5bTGXFMgJQ5lzOes?=
 =?us-ascii?Q?Bn7o4FkDjIKlMAYEEuj0zvXIa0iCqUBrStAq4biJ8tSoRBi1skq8VZAzn2nt?=
 =?us-ascii?Q?U0RZED/xNn/K7zvSoGFLTTPagWX7qCbduNXsp+rPJSlWocRXxzRMzOVuAifm?=
 =?us-ascii?Q?Zi0PcyU89a27U//qEoEfssgoH1B+hHyyoA5P69k39a92bvH0htkSASknu4vD?=
 =?us-ascii?Q?+5fYq4+GRa+zYALBRjxHEM8mAtD/S/8Jgp4y4sQ0aGz/TRhjKW+z0MTucxvJ?=
 =?us-ascii?Q?CqM+uIHXyHxhxjkLC1RwAmin/sVeE9+paKB2VoCCaan2NUOgbHqm5BPa/e8B?=
 =?us-ascii?Q?bz5dQweDJ/0hE3kyLvTf0sjekqmSB4jz18Lr2T/EyNeaMDYfUCggERCxjA/w?=
 =?us-ascii?Q?afDVlGs0pjev1LBzqnJ79dH3Gx8nJA/C4voZ4osPZ7V6Wqar4+JCH3pf7wWY?=
 =?us-ascii?Q?44EufYiyQjDnXOpZP1UcssxK6viNy5JRHd8bwCqtNatTSuRVqvlp/2o2X6HA?=
 =?us-ascii?Q?0PiaTy3RvvJJlNPL7gKc+Guz2n8qYM32559LtsaYuXScygFGMzmg+BpdKD5a?=
 =?us-ascii?Q?pkJg3nx5YXEzeKLy7/5Tm62Yd8WqYMfjJHVlk6aIl/mpHZEcULBL/TWlrEOu?=
 =?us-ascii?Q?KXYMmLq5TxCcmgG4upk4TO19cSWwx2maEyVq3NNwD11Mnpxam3yVLP+BHkVL?=
 =?us-ascii?Q?VrRVgZCq+CzzkKfGhSPaLWdm/2sYfq7Qxi/HEU9lMVm26XeuxhR+GB3Ld6D+?=
 =?us-ascii?Q?i7zUtMbyDvwZewdyGmxxVrnbQ6l61kSXYlAyu1jvz/NFFi5+/InnsIpKN6ZM?=
 =?us-ascii?Q?Tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fafb899-9576-4fa9-f43b-08dda76712b7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 15:05:29.6763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iyVb+ohgLFIPawjyVkktBgeW2IlyI3DxxvxIdxzCTzTW+UE44L9st7SD/UIa+O+w26yiQeRVxFvCvIR86U1gUyYnrGUAiScUTXfjay6h6RU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5951
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

On Sat, Jun 07, 2025 at 01:21:03AM +0530, Dnyaneshwar Bhadane wrote:
> WCL added a c10 phy connected to port B. PTL code is currently
> restricting c10 to phy_a only.

This seems like it's a characteristic of the platform rather than the IP
itself.  We should probably go ahead and break WCL out into its own
display platform that we can match against rather than assuming WCL only
uses display 30.02 and vice-versa.  Or maybe we can just update the
existing PTL condition if this function would never be called on PTL
with a non-existent PHY B?


Matt

> 
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_cx0_phy.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.c b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> index 75caccb65513..59eee0edef79 100644
> --- a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> +++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> @@ -40,6 +40,9 @@ bool intel_encoder_is_c10phy(struct intel_encoder *encoder)
>  	struct intel_display *display = to_intel_display(encoder);
>  	enum phy phy = intel_encoder_to_phy(encoder);
>  
> +	if ((DISPLAY_VERx100(display) == 3002) && phy < PHY_C)
> +		return true;
> +
>  	if (display->platform.pantherlake && phy == PHY_A)
>  		return true;
>  
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
