Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4920CC4167B
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 14:23:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDDD910E137;
	Thu, 14 Dec 2023 14:23:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85D4D10E92C
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 14:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702563826; x=1734099826;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=Z3Ps5bgKncU22BUbFvc1fgqKk7XBl/E20TfN4toDmoI=;
 b=V/a+flYxxM+8jv6usYVGMA0bI0aXccP6Mz4qtav8B9rNx+WjqULJFxFq
 CsPCFb+2pz1+vNlhfjAXgO+sQEpKI28/FrhYiSBJEDdsAfkU5k9kS5Lvo
 Fs7N0HA3aIaQySns0jm1Qgc30zdojPj6e6SQkEOjtYw06HuzTHucc2Xoq
 obBu9netKmpa1psm34ZdR/86eh18DnMu5MJ1SVf0oWehNff8mlA1r8U3c
 tsjq52+m7RGwdosDTGU4WlH6T3v97b4IPy5Ljrof5DTQqwBthk8J/GOOQ
 YRnk9+WGInieIQpPxB6vi4b69dzjjHG6QO4atV7Dc0pjq655ECe6Bl4p/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="398962027"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
 d="scan'208,217";a="398962027"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 06:23:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="844724007"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
 d="scan'208,217";a="844724007"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Dec 2023 06:23:45 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Dec 2023 06:23:45 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Dec 2023 06:23:45 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Dec 2023 06:23:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A3m+oDyr2zQ/x15vNSswKOHT9VvlwEErn6xNBYdHpsC/uMyvxRj+1mFhxn8HqnO07PBG21EXW13+z9XPsq/XgYCwCm/aEU/MiwE7TM1FbdxK02TKrbrKMTY5Ka8fHc62ia5+bngBTcQximFyiqJzAj04UTphsmXpP7yB3FdikK3s83ag5rd/CanZyDHTnKDbtwUX8YCH3sjux0Ns1hbgC88r5W4HOcHnVLHa+u4PkT64cXgbLRTQQ2yRUHTF3psCPTwP4NSCn6XvE3jPshn8eLf8fmmVSfoancE0p4BnrIKDx8ccglEoptquisSLz+n/wDq6seo4+/L378sqAWhKSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DlaNQ1rieAUyRip6Xo8E0jqSGJ44Ii9oD78xxQ2idmw=;
 b=S62Z7e11TFgw05+kUuVrxCS5e7N09Ae4VpJQn74o3fZAgbJaQs04qZoN4eZNpC4HijtOBZeZjQ0AQL9N61GSGz2XcWn57Iv0ZC4cT5zddTeA+CDNt8kjqjBdxu74Homa/V4ZySIX+X4O5UiPDm4RBWPRrzer5IdqtcTsFoIVjNJZE1vImX5T24QmEKjOtA185Iiz+GSuLxDDpzt3a6tdqBsghVT9nrqz6KINn6YfXpP0/3Nr+/Q8WYG0t+pJvyBYbI461uDYKrLLrYOPNG22a5imbYAPkxSf7LKunV0LKuP5avfjxbSA53vNOvKfV4zJej9sV7Ovyiz2HL9SLWLRmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 PH0PR11MB5927.namprd11.prod.outlook.com (2603:10b6:510:14e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 14:23:42 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52%4]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 14:23:41 +0000
Content-Type: multipart/alternative;
 boundary="------------Z1afTNedV3nE0WT0bDjEFb1v"
Message-ID: <31b197cf-8d06-4783-9ddb-c3bdc6bcab03@intel.com>
Date: Thu, 14 Dec 2023 19:53:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v4] drm/xe: Add vram frequency sysfs attributes
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20231214111159.149984-1-sujaritha.sundaresan@intel.com>
 <ZXsF5POCTNwVoO7K@intel.com>
Content-Language: en-US
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <ZXsF5POCTNwVoO7K@intel.com>
X-ClientProxiedBy: PN2PR01CA0106.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::21) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|PH0PR11MB5927:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d9b537e-16f5-4306-aea6-08dbfcb045a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m/rVM3conl0/s9UnQBXgOnMdZlPchMIYjJoykS/GqIarFAF4czWLTy1xXkXKolr5JccIgb39EZr0EebuRynurrTum0jO0nKIXcyZINMl2mTMHXydliWyVkcCG85sk93ia7itLuwY0CG6AlMzqp+G4Uf1mb2Cs5IXpQjkxSxP2CXZnvcW/8vjHAeKPL/NjkhW77vNGbxkon2M9JBHzY4kSbrL9RbuAHQt3imeXdxuu653Uo1HES9j86gPta8PGOYzrIOGLtJo3AittWjdfvu2HbbZQdmqn/2n63eLcrnKm2h3WteV3RU0Wxfpo6K3srXqQrc+vhg1OYBT3aQHtlulEJCcjkMp7Ed+7Dqzqj11CStdyDypzz2a2eB3yM93+oNpUPKPVkL6NrJX92kklCT/gFHQ4YnDAI1Ns2/7xc8wPZGBU0WeegzXYFxlu6pmY+wkdn03K99DbexXRIq62aPan6GYhWKnhZiNBGXMpPGmuY6/t2Xy5jnTyuO6QvgNKJu2xOQHV/ab0X4w03OkdvcisTCxXNJS+PaY6IaDLFRr+/FbFOfbGz1fCPwdagY5ExDHnJ+tOJaVT3XJewdxkujuCnuKF3FpZtWxWnpsmao75s5I4ZBH1H58MZM6zVNTe8EBZ6aeCJ0R3JKdOZ1/3c8YQw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(346002)(396003)(136003)(376002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(31686004)(26005)(6506007)(2616005)(33964004)(82960400001)(86362001)(31696002)(36756003)(38100700002)(83380400001)(6862004)(5660300002)(4326008)(6512007)(53546011)(66946007)(316002)(6636002)(8676002)(6486002)(8936002)(66556008)(66476007)(37006003)(30864003)(2906002)(41300700001)(478600001)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1grWHYvZjlwbGx4dzRJZlEzUGJIbFN1QUl0SzNaS1ozRW4rZjhvL2QvM1o4?=
 =?utf-8?B?ZlpHQXNmNm9kWDJQN1JiTURvQzFPVG9waHNUZGVRczRqbFB0eVVVeXVLdDRM?=
 =?utf-8?B?bGRoMUFuVzJtWE9ZVEg3d3V5RFVoa0hlTG9Tc1FUbjRXZ2p1Q0V1YzVFcWlv?=
 =?utf-8?B?R3lwWXNKVDZPUGx5YWhFZWVKOEx4dDJIRXNHdlQzRndwM0wraVQzVWxYdkMy?=
 =?utf-8?B?bElOWXpQODFBUUZqNFprbFQ3TW5nMElncUhjQ0pxWitYT05oVlAvbHNuTktt?=
 =?utf-8?B?S2RDNExZSWdMemdOWnVjZVpBQVhwVXZTNlNxaHovSElFSU1OTkpoayt2QnVk?=
 =?utf-8?B?d2xkWTRMbC9CazJkR3ZyUCtITWhuTTQ2bThpa1BuRG1NS05LSlpPbEVHalBB?=
 =?utf-8?B?cTFjMVRWdDY3LzRWVkx2TmEwRWZHejl4N3V1RUNGZmN6L2tyTC8vSUt6WWpk?=
 =?utf-8?B?L0lUVTVTYmtzM1h5SytJL3dBWjY3SmdONzAxZm9jRmdyZElJUU1qMFhzRkRv?=
 =?utf-8?B?cm95c0RYTEtRaVJqRmtqVERVWXFyVVVIR0x2NHJDQkpIOTZxRkk4RHBMZTZV?=
 =?utf-8?B?NmZOb1FEZk1zUkoyY3JnZnptdjBXMXd3cVltTHVBMUdETHg3SzVQQ2hVVTc5?=
 =?utf-8?B?MEtOdXY1aVdHbTIxay9mMnUyeTBkT3dQYkUvRlROdVR5Rk1jNkJwWUpUdUky?=
 =?utf-8?B?K2U3aGRtbVZtRXg5T0NCTnFWb2lNaFJLdzdnQ0M1ZEh4ajRSMFovTy95eDJj?=
 =?utf-8?B?VlE3SVJGbUN2UjY5L21Wejg5QjdwTjhMcFdlTy9ad3JraktLcGg0MFNTUTgv?=
 =?utf-8?B?WnZxcW9kejNmcDNiVFpQYXB2clE4WWI4WUp2ajEwcFFUNkZXMDJYa3dPL3R2?=
 =?utf-8?B?dS9uNTRXUzdiVElpcnhRZHh0azNJeHRDZzlkclQ4bWZkTFliK3lDYjcxUDdu?=
 =?utf-8?B?MDF0Y0o2NWZ6YlUvZzh5d0JBOVNOZkZDQTBNQjJwMS91K1AvRlJLY2ZyMjNO?=
 =?utf-8?B?UHlPL1h0TFAzNk92V1JoMmhaSTZabkJ0ZE1COHpqdEI5eVFITzhJRjJJdXJo?=
 =?utf-8?B?ZkR6QmgyNWc1T0RGRTh2UVFVakhCVjRkRUdIQVp2dmNCMGFUZUZMMjk0V2c5?=
 =?utf-8?B?T04wNkVkY2pVRHVuUWVmWTBvVFlOTC9HN3cxZ3RRd3ZrVlo3ZWwxeFAzbzRW?=
 =?utf-8?B?YTU3U2lsdDJDTW5aSXF1Q3RHN2Uyd2dEZW9nYTlQeEtCNnBhZ0o1RG5mcmpR?=
 =?utf-8?B?Mkg0SjFHMVlqeldZMlZ0Tmp5dXp1MDZyM21JTWkxZ05SUUUyTTI1Q2Nnbk5R?=
 =?utf-8?B?a091T21OaW10UzZuYlNFSkNPMnJaanFOOWk1bHJsRVdHU3BKQnFseEc2QlZK?=
 =?utf-8?B?bVFFb1hTakwwYlE0clF2a2ZWcmVNUWUwQ1VXZk1DcnJmODlsM1RyQjM4VFVj?=
 =?utf-8?B?ZVNoYkZaTnVyL2ZCYmtKRTIrV01RYWY0djlkNWIxc08yQ2hpdGRjN2lCWkc1?=
 =?utf-8?B?NTRiQk1DNW1jeWFFZHJBWFhraysva1Bxa2plZXRJWVM5ZTcwWHd2UVdrZEQy?=
 =?utf-8?B?WjRBcEdZbzZmOFlNQUZJTDh2bTV2QUMxUkpaSGZzQSs3bmkwZC9VOTdmLzZI?=
 =?utf-8?B?SzZFM3NNdTN4VW1jSzJiM0ZQSHhBZ0JITDl1NlVCanpJOFF2UEtkM3VMcVBG?=
 =?utf-8?B?NzV1K21vbG4xd0dmN2RaWm0rdk9XZkVVbjg1STNrdWVyWDg0ZmpDbUdOR2h0?=
 =?utf-8?B?RVJwaVVtbFlqWVZYYU05NXFPQVg1VTdXcERTekdLdTgvUytCMjlSelJOR1N0?=
 =?utf-8?B?WFlwbjBpVnFVMEJQYy9Ec01XS3pCWFJhVTVvcVVCUUpMTkpyMkpCK1JLTzhi?=
 =?utf-8?B?VDRCNDRqVWQyaXV4dVRENTdJZElFVHg3OGY4dzZ5L3MxK3B5bHYvdnpJcld1?=
 =?utf-8?B?R1I3dnEzZjdDY1o5cUtCd3VSTDBJRE5xaXpHbEJObjFSdm9BTFpFdlpySy8r?=
 =?utf-8?B?MmxmTWdQTndmVmZHVWRIMlNLZXJaSk92NHJDUHlQRnJQWE94Z3g1aVlGSVUx?=
 =?utf-8?B?b1h1bk83ODNsamxhWEJZWmxrSnJ3N21MMmE1cFRLc2lQajR6SWNPT1NUdWV3?=
 =?utf-8?B?dmIwUW0vTVR0K2wvV1I4QnUyZGVvbHZDQlluRGt6WmpjWjQ3cXBuSUJ3blpT?=
 =?utf-8?Q?1u2w8hlN8wk7A4CzZfqQPYk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d9b537e-16f5-4306-aea6-08dbfcb045a1
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 14:23:41.9231 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Z+LSAIyZ+/I1tgwbP9/t2EgX2dYRckodSuhOVBwJ4qmTz9f27kr2RbSHCuWx4vS1FfNmmpTwFF2yfPq1Na1PuUwjKEhVIFzI+x6upam7Bs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5927
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

--------------Z1afTNedV3nE0WT0bDjEFb1v
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 12/14/2023 7:10 PM, Rodrigo Vivi wrote:
> On Thu, Dec 14, 2023 at 04:41:59PM +0530, Sujaritha Sundaresan wrote:
>> Add vram frequency sysfs attributes under the below hierarchy;
>>
>> /device/tile#/freq0
>> 		|-rp0_freq
>> 		|-rpn_freq
> hmm...
> you have a good point of not leaving an empty memory dir on platforms
> where we don't have the freq interfaces.
> But then we should only create the mem dir when we are going to create
> the freq.
>
> In the way this patch is proposing it looks like the frequency is about
> the tile. like a tile basedie frequency or something like that.
>
> So, we do need the memory or vram dir to make it really clear that
> the freq is about the memory.
>> v2: Drop "vram" from attribute names (Rodrigo)
>>
>> v3: Add documentation for new sysfs (Riana)
>>      Drop prefix from XEHP_PCODE_FREQUENCY_CONFIG (Riana)
>>
>> v4: Create sysfs under tile#/freq0 after removal of
>>      physical_memsize attrbute
>>
>> Signed-off-by: Sujaritha Sundaresan<sujaritha.sundaresan@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pcode_api.h  |  8 +++
>>   drivers/gpu/drm/xe/xe_tile_sysfs.c | 80 ++++++++++++++++++++++++++++++
>>   2 files changed, 88 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
>> index 5935cfe30204..26ceb8c0c010 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>> @@ -42,6 +42,14 @@
>>   #define	    POWER_SETUP_I1_SHIFT		6	/* 10.6 fixed point format */
>>   #define	    POWER_SETUP_I1_DATA_MASK		REG_GENMASK(15, 0)
>>   
>> + #define   PCODE_FREQUENCY_CONFIG		0x6e
>> +/* PCODE_FREQUENCY_CONFIG sub-commands (param1) */
>> +#define     PCODE_MBOX_FC_SC_READ_FUSED_P0	0x0
>> +#define     PCODE_MBOX_FC_SC_READ_FUSED_PN	0x1
>> +/* PCODE_MBOX_DOMAIN_* - mailbox domain IDs */
>> +/* PCODE_FREQUENCY_CONFIG param2 */
>> +#define     PCODE_MBOX_DOMAIN_HBM		0x2
>> +
>>   struct pcode_err_decode {
>>   	int errno;
>>   	const char *str;
>> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> index 0f8d3e7fce46..45518442ed15 100644
>> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> @@ -7,9 +7,23 @@
>>   #include <linux/sysfs.h>
>>   #include <drm/drm_managed.h>
>>   
>> +#include "xe_gt_types.h"
>> +#include "xe_pcode.h"
>> +#include "xe_pcode_api.h"
>>   #include "xe_tile.h"
>>   #include "xe_tile_sysfs.h"
>>   
>> +#define GT_FREQUENCY_MULTIPLIER	50
> hmmm... it is kind of strange to define a frequency multiplier in
> the tile_sysfs component.
>
> This is probably an indication that we need a specific component for
> this memory freq?
>
> perhaps xe_vram_freq?

I would prefer not to over complicate for the sake of two attributes 
that appear only on PVC.

I can revert the path to /tile#/memory/freq0 and have all of it appear 
only for PVC.

Thoughts ?

>
>> +
>> +/**
>> + * DOC: Xe Tile sysfs
>> + *
>> + * Provides sysfs entries for memory related frequency in tile
>> + *
>> + * device/tile#/freq0/rp0_freq - The Render Performance 0 level, which is the maximum one.
>> + * device/tile#/freq0/rpn_freq - The Render Performance N level, which is the minimal one.
>> + */
>> +
>>   static void xe_tile_sysfs_kobj_release(struct kobject *kobj)
>>   {
>>   	kfree(kobj);
>> @@ -20,10 +34,68 @@ static const struct kobj_type xe_tile_sysfs_kobj_type = {
>>   	.sysfs_ops = &kobj_sysfs_ops,
>>   };
>>   
>> +static ssize_t rp0_freq_show(struct device *kdev, struct device_attribute *attr,
>> +			     char *buf)
>> +{
>> +	struct xe_tile *tile = kobj_to_tile(&kdev->kobj);
>> +	struct xe_gt *gt = tile->primary_gt;
>> +	u32 val, mbox;
>> +	int err;
>> +
>> +	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, PCODE_FREQUENCY_CONFIG)
>> +		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_FC_SC_READ_FUSED_P0)
>> +		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_HBM);
>> +
>> +	err = xe_pcode_read(gt, mbox, &val, NULL);
>> +	if (err)
>> +		return err;
>> +
>> +	/* data_out - Fused P0 for domain ID in units of 50 MHz */
>> +	val *= GT_FREQUENCY_MULTIPLIER;
>> +
>> +	return sysfs_emit(buf, "%u\n", val);
>> +}
>> +static DEVICE_ATTR_RO(rp0_freq);
>> +
>> +static ssize_t rpn_freq_show(struct device *kdev, struct device_attribute *attr,
>> +			     char *buf)
>> +{
>> +	struct xe_tile *tile = kobj_to_tile(&kdev->kobj);
>> +	struct xe_gt *gt = tile->primary_gt;
>> +	u32 val, mbox;
>> +	int err;
>> +
>> +	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, PCODE_FREQUENCY_CONFIG)
>> +		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_FC_SC_READ_FUSED_PN)
>> +		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_HBM);
>> +
>> +	err = xe_pcode_read(gt, mbox, &val, NULL);
>> +	if (err)
>> +		return err;
>> +
>> +	/* data_out - Fused Pn for domain ID in units of 50 MHz */
>> +	val *= GT_FREQUENCY_MULTIPLIER;
>> +
>> +	return sysfs_emit(buf, "%u\n", val);
>> +}
>> +static DEVICE_ATTR_RO(rpn_freq);
>> +
>> +static struct attribute *freq_attrs[] = {
>> +	&dev_attr_rp0_freq.attr,
>> +	&dev_attr_rpn_freq.attr,
>> +	NULL
>> +};
>> +
>> +static const struct attribute_group freq_group_attrs = {
>> +	.name = "freq0",
>> +	.attrs = freq_attrs,
>> +};
>> +
>>   static void tile_sysfs_fini(struct drm_device *drm, void *arg)
>>   {
>>   	struct xe_tile *tile = arg;
>>   
>> +	sysfs_remove_group(tile->sysfs, &freq_group_attrs);
> if you didn't create the group you shouldn't remove it, so same
> conditions for create should apply here.
>
>>   	kobject_put(tile->sysfs);
>>   }
>>   
>> @@ -50,6 +122,14 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>>   
>>   	tile->sysfs = &kt->base;
>>   
>> +	if (xe->info.platform == XE_PVC) {
>> +		err = sysfs_create_group(tile->sysfs, &freq_group_attrs);
>> +		if (err) {
>> +			drm_warn(&xe->drm, "failed to register vram freq sysfs, err: %d\n", err);
>> +			return;
>> +		}
>> +	}
>> +
>>   	err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
>>   	if (err)
>>   		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
>> -- 
>> 2.25.1
>>
--------------Z1afTNedV3nE0WT0bDjEFb1v
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 12/14/2023 7:10 PM, Rodrigo Vivi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:ZXsF5POCTNwVoO7K@intel.com">
      <pre class="moz-quote-pre" wrap="">On Thu, Dec 14, 2023 at 04:41:59PM +0530, Sujaritha Sundaresan wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Add vram frequency sysfs attributes under the below hierarchy;

/device/tile#/freq0
		|-rp0_freq
		|-rpn_freq
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
hmm...
you have a good point of not leaving an empty memory dir on platforms
where we don't have the freq interfaces.
But then we should only create the mem dir when we are going to create
the freq.

In the way this patch is proposing it looks like the frequency is about
the tile. like a tile basedie frequency or something like that.

So, we do need the memory or vram dir to make it really clear that
the freq is about the memory.
<span style="white-space: pre-wrap">
</span></pre>
    </blockquote>
    <blockquote type="cite" cite="mid:ZXsF5POCTNwVoO7K@intel.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
v2: Drop &quot;vram&quot; from attribute names (Rodrigo)

v3: Add documentation for new sysfs (Riana)
    Drop prefix from XEHP_PCODE_FREQUENCY_CONFIG (Riana)

v4: Create sysfs under tile#/freq0 after removal of
    physical_memsize attrbute

Signed-off-by: Sujaritha Sundaresan <a class="moz-txt-link-rfc2396E" href="mailto:sujaritha.sundaresan@intel.com">&lt;sujaritha.sundaresan@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_pcode_api.h  |  8 +++
 drivers/gpu/drm/xe/xe_tile_sysfs.c | 80 ++++++++++++++++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index 5935cfe30204..26ceb8c0c010 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -42,6 +42,14 @@
 #define	    POWER_SETUP_I1_SHIFT		6	/* 10.6 fixed point format */
 #define	    POWER_SETUP_I1_DATA_MASK		REG_GENMASK(15, 0)
 
+ #define   PCODE_FREQUENCY_CONFIG		0x6e
+/* PCODE_FREQUENCY_CONFIG sub-commands (param1) */
+#define     PCODE_MBOX_FC_SC_READ_FUSED_P0	0x0
+#define     PCODE_MBOX_FC_SC_READ_FUSED_PN	0x1
+/* PCODE_MBOX_DOMAIN_* - mailbox domain IDs */
+/* PCODE_FREQUENCY_CONFIG param2 */
+#define     PCODE_MBOX_DOMAIN_HBM		0x2
+
 struct pcode_err_decode {
 	int errno;
 	const char *str;
diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
index 0f8d3e7fce46..45518442ed15 100644
--- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
@@ -7,9 +7,23 @@
 #include &lt;linux/sysfs.h&gt;
 #include &lt;drm/drm_managed.h&gt;
 
+#include &quot;xe_gt_types.h&quot;
+#include &quot;xe_pcode.h&quot;
+#include &quot;xe_pcode_api.h&quot;
 #include &quot;xe_tile.h&quot;
 #include &quot;xe_tile_sysfs.h&quot;
 
+#define GT_FREQUENCY_MULTIPLIER	50
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
hmmm... it is kind of strange to define a frequency multiplier in
the tile_sysfs component.

This is probably an indication that we need a specific component for
this memory freq?

perhaps xe_vram_freq?</pre>
    </blockquote>
    <p>I would prefer not to over complicate for the sake of two
      attributes that appear only on PVC.</p>
    <p>I can revert the path to /tile#/memory/freq0 and have all of it
      appear only for PVC.</p>
    <p>Thoughts ?<br>
    </p>
    <blockquote type="cite" cite="mid:ZXsF5POCTNwVoO7K@intel.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+
+/**
+ * DOC: Xe Tile sysfs
+ *
+ * Provides sysfs entries for memory related frequency in tile
+ *
+ * device/tile#/freq0/rp0_freq - The Render Performance 0 level, which is the maximum one.
+ * device/tile#/freq0/rpn_freq - The Render Performance N level, which is the minimal one.
+ */
+
 static void xe_tile_sysfs_kobj_release(struct kobject *kobj)
 {
 	kfree(kobj);
@@ -20,10 +34,68 @@ static const struct kobj_type xe_tile_sysfs_kobj_type = {
 	.sysfs_ops = &amp;kobj_sysfs_ops,
 };
 
+static ssize_t rp0_freq_show(struct device *kdev, struct device_attribute *attr,
+			     char *buf)
+{
+	struct xe_tile *tile = kobj_to_tile(&amp;kdev-&gt;kobj);
+	struct xe_gt *gt = tile-&gt;primary_gt;
+	u32 val, mbox;
+	int err;
+
+	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, PCODE_FREQUENCY_CONFIG)
+		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_FC_SC_READ_FUSED_P0)
+		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_HBM);
+
+	err = xe_pcode_read(gt, mbox, &amp;val, NULL);
+	if (err)
+		return err;
+
+	/* data_out - Fused P0 for domain ID in units of 50 MHz */
+	val *= GT_FREQUENCY_MULTIPLIER;
+
+	return sysfs_emit(buf, &quot;%u\n&quot;, val);
+}
+static DEVICE_ATTR_RO(rp0_freq);
+
+static ssize_t rpn_freq_show(struct device *kdev, struct device_attribute *attr,
+			     char *buf)
+{
+	struct xe_tile *tile = kobj_to_tile(&amp;kdev-&gt;kobj);
+	struct xe_gt *gt = tile-&gt;primary_gt;
+	u32 val, mbox;
+	int err;
+
+	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, PCODE_FREQUENCY_CONFIG)
+		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_FC_SC_READ_FUSED_PN)
+		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_HBM);
+
+	err = xe_pcode_read(gt, mbox, &amp;val, NULL);
+	if (err)
+		return err;
+
+	/* data_out - Fused Pn for domain ID in units of 50 MHz */
+	val *= GT_FREQUENCY_MULTIPLIER;
+
+	return sysfs_emit(buf, &quot;%u\n&quot;, val);
+}
+static DEVICE_ATTR_RO(rpn_freq);
+
+static struct attribute *freq_attrs[] = {
+	&amp;dev_attr_rp0_freq.attr,
+	&amp;dev_attr_rpn_freq.attr,
+	NULL
+};
+
+static const struct attribute_group freq_group_attrs = {
+	.name = &quot;freq0&quot;,
+	.attrs = freq_attrs,
+};
+
 static void tile_sysfs_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_tile *tile = arg;
 
+	sysfs_remove_group(tile-&gt;sysfs, &amp;freq_group_attrs);
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
if you didn't create the group you shouldn't remove it, so same
conditions for create should apply here.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> 	kobject_put(tile-&gt;sysfs);
 }
 
@@ -50,6 +122,14 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
 
 	tile-&gt;sysfs = &amp;kt-&gt;base;
 
+	if (xe-&gt;info.platform == XE_PVC) {
+		err = sysfs_create_group(tile-&gt;sysfs, &amp;freq_group_attrs);
+		if (err) {
+			drm_warn(&amp;xe-&gt;drm, &quot;failed to register vram freq sysfs, err: %d\n&quot;, err);
+			return;
+		}
+	}
+
 	err = drmm_add_action_or_reset(&amp;xe-&gt;drm, tile_sysfs_fini, tile);
 	if (err)
 		drm_warn(&amp;xe-&gt;drm, &quot;%s: drmm_add_action_or_reset failed, err: %d\n&quot;,
-- 
2.25.1

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------Z1afTNedV3nE0WT0bDjEFb1v--
