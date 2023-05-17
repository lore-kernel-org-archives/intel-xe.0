Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 750B1C77B7A
	for <intel-xe@archiver.kernel.org>; Wed, 17 May 2023 12:21:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D52410E40A;
	Wed, 17 May 2023 12:21:00 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9172210E40A
 for <intel-xe@lists.freedesktop.org>; Wed, 17 May 2023 12:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684326059; x=1715862059;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=o2hGzJONHYwFMSf3rGcV/W6YwGS5T7ZaWgrkDrLHi/k=;
 b=NIFrlmj4r7+NXKA8qK9Aq6zsFFyBRbBX4AijfqIKWiAXbpejrO6bQMuj
 4H41BZmuXwlBET77cFl+d1lFAC1YpziZg087ad/RacM0WuIiMvaOWJRd6
 55KpuxS4Av8WPp/kXBTSY8LULChuC3TZuoQqgx7gJGUjPN5l/qQ3Apgq7
 t/ne+dN+pw1UEARYU6eNTjFbt4qbsOW7RNcvCjKpI0TekZ4vkbjd5L3nk
 PKn+vsfYeacMLrHS4pbQeWDR8/Qf/tBI5J58glTMXIJb07a+FB9r7gFcU
 xi4Ztfhxsn6ikDRIaunmNqlhEh0t1XpQvHVWnEA+3rMQFHZdHMEDqGNqa w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="354913105"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; d="scan'208";a="354913105"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 05:20:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="695843653"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; d="scan'208";a="695843653"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 17 May 2023 05:20:56 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 17 May 2023 05:20:56 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 17 May 2023 05:20:56 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 17 May 2023 05:20:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AWSuVaQKZ+wx8YXepEAew5CnUIXYKLRcLaeDmPPG5SDXgwGNUspXo8+R+824ivKjbxxoRgbIg/rvPP6pUq/LYln8p5BnULgaTvHPHEuHc0yioQc2wjXmWPdS+zhH9XR+yn3XVs7cawnoGCJDXPx/im0xakxzBsPxPmdRIVvE8sQkWimxrA5ZslPp53hiZSRevf+99YynnjRMgGciTU93XJG6WkpmuGi7xfIVWeH1kOX0wgVDanujUj6/afUcZvsdeL8dyixpbg36FHBNaoct0I2kZDqFR3ZEEsNCqsmiIYgsEjA4nYc40ZMqvRQo4VXVZK0GbWpGRAGA0T/jUSd6Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HDFFQqClESs5Z0buom4yz0KnS4bBI+1DOzvaUNVhmrc=;
 b=jP7ke5AGv3wDb7c7u1MfhP3l1CBxcU7qjRAk62/Q/jApAY7BaHVRlnW3mhmxYAS0NuGr0ToG55rUMGGGk2hNg4ZsV97L7fZcnrOi1kfYCrlhpk6VX89mSIy75ldX9hBXMgI5zDf3v3EYYOeTSa6rcJoj54YLo6bEpnUQ5wyJxO3CMgMYAYjxSOOYd4BwKvsn0UXxBwjSi0TG7wv9bbuATlKlKwqEh3kV42lF0t/G8XKwQOLrrylo1SSTsAcYwSoycHBfwJazJxKZquEoXLV+9XgEkI8pSc8Ztsa9BOCJytjnNkWneKi+NSjDvkvkYZyTRVPt0NWyXBXsNamG6RsjIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH0PR11MB5673.namprd11.prod.outlook.com (2603:10b6:510:d6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Wed, 17 May
 2023 12:20:54 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::2e91:4229:bc5c:cb31]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::2e91:4229:bc5c:cb31%6]) with mapi id 15.20.6387.033; Wed, 17 May 2023
 12:20:53 +0000
Message-ID: <ba998f3a-3a6a-27a8-e6b2-f6056393fc9a@intel.com>
Date: Wed, 17 May 2023 17:50:44 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Anshuman Gupta <anshuman.gupta@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230511094817.2734836-1-anshuman.gupta@intel.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20230511094817.2734836-1-anshuman.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0187.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::14) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH0PR11MB5673:EE_
X-MS-Office365-Filtering-Correlation-Id: 806bc51d-8ce7-426f-700c-08db56d12892
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DKNIwaL/kcX7OYctCoFmuzR+/v6R/rehc+QDCmVaNmMLQLD+EcrXoliaKTBYVYMtMffxPWSIcLB0oQYa1fSdjYa84oGMS+8Azm+tm77KPglyBH+1mpHcGPLLsMbRtl6RIMV2XcMxbAkGxmY9xYMvT5gEDCTNMH+onKOLrrC98HyqELnOEvfkJ292yRGLPETxlAz7/I7M9Ggnu/UGJlXiIfXOw3xhyyR0LVFT+9/Hoi6lz5tok9ydK0hoSCSQzEhMIcAVXWzTOqti0SClgyTernBUDlbf2yqByANCFEDfU7PV2qiaUkTWFLZXotRMCDwAqFLr2ybbzPM7UAxEGRQkElgfqcndg0J3hfQ8Qby2d0FjC3CY/HjWOTEPWbKY2F9xog6Tf4wtG3t/ppiv1IBvTbWaPyKXQXVAZnxI4MFi62jSEhfOmSTMxg+oDxIF9rfoBPiwfkl/07WpXEAChgfkLPxbja6SxbC4TvG198699fQb+airz2KAoB5IVup/H7ADDGdO8nvoRNZ73OGIVt+GyDcstU9ZhEeHrjXmblKEjryghOpxL/a/OsXQEt0ZKjtahJWSgHHYMIuWArHvWauJk9ZgMDEfXoFpLkJodBmdhi+i73VJVdZ/cHkCOakqI+1/8/XEe2AmVpuxSL5+Q4XM+A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(376002)(396003)(136003)(39860400002)(451199021)(5660300002)(8676002)(8936002)(107886003)(31696002)(6512007)(6506007)(26005)(53546011)(82960400001)(2616005)(38100700002)(186003)(6666004)(6486002)(478600001)(41300700001)(86362001)(316002)(66946007)(66556008)(66476007)(36756003)(4326008)(31686004)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODB3R0dYMTRINlRlMG1KRlVPeWNKd2VpSERCcERjLzlySE1PRVNmRmZ2VzFL?=
 =?utf-8?B?ZEZRRk9MR2FoWldhVmZHeVB4bWF4V014ek9tVmNPTzN2SmVQOStuejQrWVBN?=
 =?utf-8?B?VjluMnBnWWJadld2dXpYQXNPWmNsSjNyUEFtKzc1QXN6Vk1HVXN0QzJlcUlk?=
 =?utf-8?B?dFhsdE1Ma1J6a2pGYnFDcG81QllBWjJXQ1g1enNqTlNUR2dNYytNUlYvd1Zp?=
 =?utf-8?B?UlJoMHdyUmd2dUdENEZNcG0wMnJaUXRPSVQwaFdMZzd0azRwRnJ3REQ3QUZC?=
 =?utf-8?B?bXR6SGJ3dXovTFR0N2tZSDlXQmEyL08vRHEyaTIzSUdYTnBrNUVFUW1WVFk1?=
 =?utf-8?B?dFh4VXdNYUxHWndmK1VxRHBlOFg5bnJVL2xFMzA4YUg2ZlNjS2JGekJqUDYy?=
 =?utf-8?B?amx0WjV5OER3V09lOUdBWHFSb1ZZSmw2b0JKalVYcnhidGNIbGs3ZXFvcXU0?=
 =?utf-8?B?aFZleEJvN1lKMnA4UTFRUE01V1Jud0J4RWgxS3lZeTM5eFJLUjBSYmtZWGMy?=
 =?utf-8?B?NmlhbE16TE9mTDN4VWRtSng1bm9GZnZhUkcvSFpnNnlCajdpRklkK0piYkRr?=
 =?utf-8?B?MGhWWWhOSi8wR0l5R09ORzNja0VPQ00vZ3NFNGVpL0IzdW05aTMycENuaytK?=
 =?utf-8?B?QUdFcjRVSXZWVDVmRjFQSXhKemI0Q3Vjb0RucXkxbzhTS1Yrc3p6bG5Vc1lL?=
 =?utf-8?B?dmthRW1tTEY3NmVjNkJ0L3hQS014OHFEVnhKUm54Qk9sTW9nenRvc0YxUnlS?=
 =?utf-8?B?dStGdXZkTXJ1dGFMY095Skdob09ESnRPWVhJRmxocWxiV3FZbkYyRU8wclBi?=
 =?utf-8?B?UWkxeGhmeE1TTkpvV0wwc0VvWGZmblRzUTJjUjUvRFBVSUlseGRlTHRLQlBI?=
 =?utf-8?B?ZHZlQ2hVcmRJS0VFU1Q3QXZlTlY3UnRhK05TejNLUEhFUFhSdzhTYTR3Tng1?=
 =?utf-8?B?WHBPd2JqcVl1TGRBbUtZbXd6amNFcUl1UXFRYzhZSXM0MkpPV25zZzYyTVZQ?=
 =?utf-8?B?bk5QZTYzSlh0Mk92dnE2UndHS2FJMWpjQTl4QlVkV3FUQmU0YjRha3M4UWZJ?=
 =?utf-8?B?czZXaHB0T2F2TS9RUzBNY05xVnF1d1NEZXJGbTZkcldZbFJ5Uk9Qd0x6Z0RM?=
 =?utf-8?B?cHl0elFDaTZNdVhwcjlwcVNrTnZlWTgzcmp1MnViWGZJS2V6MUpmUXVmL1BH?=
 =?utf-8?B?TlJPM01LOXVxNGdrelhZaGxJNlo3eFIrOFh4NFE4bEVhY2N0bWNwVEE0ZW1J?=
 =?utf-8?B?MmdtTDMzZmMwWU4wbWxaSDFLRk5BRHFVVE9NUUJVaTFjWE9UeFE1S25zMXpk?=
 =?utf-8?B?NE9HT0NQUmQvMFl6aGVOUEt2VWpySnBHSWl6ZVNJVUZuaGRpU3A3NGlYUXRn?=
 =?utf-8?B?YUp6L3B5VkY0M3hqZ3kzbk1PQnFDNFdQZnhaeGUvMXlTZ21RMXBaeEZ6VXNj?=
 =?utf-8?B?NDV0bFA1Tk9RblZhK1VvbEVDZDB6d3EweWtuczFnT2Y1UXdGd2s2QVVDVVhI?=
 =?utf-8?B?dE5lLzdyeGtxN3FvWmZpcWZ4SFVNVFI0ZTR6SDFEa0ZQRmxCOERQMGtXZDdx?=
 =?utf-8?B?OEkwTWpqWE1Yam9tVTU0Qy9CaVdjeDZiQThySEtad05HaWRJWFN0Sk9oUDhm?=
 =?utf-8?B?MGJhNndrWEpyS2NiRlhzV3dseTVLVnBGTWRuY1FDNVpKSkdRYUc3YnRNUWM0?=
 =?utf-8?B?VlJWeGFtelUxeGFNN21VTHlrN2VBTUJDVnNvTytUdmFvNE12TERFSm1mZm1M?=
 =?utf-8?B?YVpyV0ExRVY4YitCY0NDMHllNHkvZlk3SytIN3dyVG53Nm9pOHY0QlE1eE1O?=
 =?utf-8?B?a29saFBtTE1GWll4MGVJeDB0eUxSMW80VVFGcFMxRGt5TU5jc3V4cHl6b1RX?=
 =?utf-8?B?aTlPcUxMYjlMRUVuVWNYS3FUSmxGblJwUWNhTElBUmU1eUVnbHI5RDM2QXJt?=
 =?utf-8?B?bkZVaXVReXNsaU53TWgxTXl6TnZLajVvNUJMcUtCWWE3b0JXeEtzR3c2SHdi?=
 =?utf-8?B?ZXFjQUFuanF0UUtvdFduMnNLUjJoM1BzM0QxR1N1VXVRUlRna2pMNG5jTkc3?=
 =?utf-8?B?Z3dXeDhhcW5pMk4zY3IwaHkwUjJIZUxZdE1UcUFvNGRqeUY3NTdFUjA4eERK?=
 =?utf-8?B?OTJVUUQ5TElNeUxXMzd6U045NzlpZEwzYjhTNVNXeE5FSmpZYm5pTTV3V2Ez?=
 =?utf-8?B?R3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 806bc51d-8ce7-426f-700c-08db56d12892
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 12:20:53.5544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 31hW1hgm6pJzTTz/JRJmv9AMdvvKjPJTkXVLWo6hpdlzE+SK2RcP6A76EJ2hyhkdhbFehi+elxSwgFgThCwd8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5673
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe/pm: WARN_ON() on unbounded pcie
 parent bridge device
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
Cc: rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

LGTM

Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Regards,
Badal

On 11-05-2023 15:18, Anshuman Gupta wrote:
> Intel Discrete GFX cards gfx may have multiple PCIe endpoints,
> they connects to root port via pcie upstream switch port(USP)
> and virtual pcie switch port(VSP), sometimes VSP pcie devices
> doesn't bind to pcieport driver. Without pcieport driver pcie PM
> comes without any warranty and with unbounded VSP gfx card won't
> transition to low power pcie device and link state therefore
> assert dev_warn on unbounded VSP and disable xe driver
> PM support.
> 
> v2:
> - Disable Xe PCI PM support. [Rodrigo]
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pci.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 855cf8557056..ee61a03d1afd 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -579,6 +579,19 @@ static void xe_pci_remove(struct pci_dev *pdev)
>   	pci_set_drvdata(pdev, NULL);
>   }
>   
> +static void xe_pci_unbounded_bridge_disable_pm(struct pci_dev *pdev)
> +{
> +	struct pci_dev *bridge = pci_upstream_bridge(pdev);
> +
> +	if (!bridge)
> +		return;
> +
> +	if (!bridge->driver) {
> +		dev_warn(&pdev->dev, "unbounded parent pci bridge, device won't support any PM support.\n");
> +		pdev->driver->driver.pm = NULL;
> +	}
> +}
> +
>   static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   {
>   	const struct xe_device_desc *desc = (const void *)ent->driver_data;
> @@ -604,6 +617,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   		return -ENODEV;
>   	}
>   
> +	xe_pci_unbounded_bridge_disable_pm(pdev);
>   	xe = xe_device_create(pdev, ent);
>   	if (IS_ERR(xe))
>   		return PTR_ERR(xe);
