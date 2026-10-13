Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C74A6CA9ED0
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 04:49:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 809E110E733;
	Tue, 13 Oct 2026 04:49:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7585110E733
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 04:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791866980; x=1823402980;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OpLV0K1eAsY21fe7xEVYcy8DCqIHqwWmDP+TYaIRTUc=;
 b=Ow5YzfBUNTUgBCVqMHzCgsliKFc0ZZQCheQP/uVgMY6XZi63u9rvHg3J
 HGeg+caN+vKbGZVOLkY+/Y/7U2gpRNL3Lejwkxvmikau0bAN6bV165mC8
 SPFWSFo7byG4hbCMbyfrMd5l32hs0AP8jXLqF0Bbdye5HK+xPgOpKqFzo
 32IbTvYn5YqeJ0cJea3eb0j4VArLRTNEX778RVMVYqwZF+4mG08iNN8DA
 hcDtw0BnRO/KJdMRITrSJqx8cExl3TyU3+85lgSZQq0eTimrNbgtEUjoh
 gmVn85rmP3cqyVgR5siii2lO2ehV2Wgf/K7Ids8NUGrO+jDsUxdBv8u4y A==;
X-CSE-ConnectionGUID: GPhY5v9pTfu57u5nWMmA6w==
X-CSE-MsgGUID: JEoynWJqRm27r3kyMfoEdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="587653"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="587653"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 21:49:39 -0700
X-CSE-ConnectionGUID: 6oRxKru5QdeFBSQvafV6tg==
X-CSE-MsgGUID: kWH4NYaYScW4b7YFNARTIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1393114"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 21:49:40 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 21:49:38 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 21:49:38 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.22) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 21:49:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i9TkghRysBcDTRuZH2SUva6Ly88W1L6V5rTbTknRugKtZZwx9vPGYdqR+t5ovhKtQ94+cq0vHa53V5+UEyeDK8+2KTXdrcfISjkqqCV5gdM4fNxgkieJVGZ1vkVXDPHDReAS6pM097x9Vmi35CiRHL24QR0tqhETB9C4eX46xwRSFqgjlJf3aBTx8nZlw55mxpDizKlot/6dII9Paqx814J5wbEFWiehY5BoYg/S+aRFIHOBYLOMmfZTIe8zp9giuRzx1Tjed1bKh1rfl/heaKuaJ42kgXZsf/Lff/T0JKOOEMM/S8uCAsxFuWiP+UnMq3R26csLTdMJKXG0vLh+yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9evedAuEsoJp32kqbQWC8VWq3ClMQCT8NBlNtjD6M8I=;
 b=D2GKujoW6DRuATpGnTN6VBWWptBfaoF/qEHga09wtBn8kpmq4AXpe37K0T3hvBRSLV+9WA5ESNKtVGMXmO8QZuqwVbBd4QlMnfxz9GCkkyfYrWOdxq+JkzF3Un+zETxG+PbhFNOSuxda4x3IU+xoGSy0RvMZ73yo6lRDt5Gsr4sx6so4fqh1hjr+fIq6UZK8GfrbVnsfAz8FDRVEeEc2VrsiyeUhnnIAM+tugxFoOjyamh8gGHi+vkQrwdDmJRpnwMw2+IxxrEmFepHi55fE0B5GMgSORMRByNSqcApvXDAfcwl6gsEoV/raE08epH2xSlFJOv1j2K0Ro1wwPh/7KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS6PR11MB9895.namprd11.prod.outlook.com (2603:10b6:8:460::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.23; Tue, 13 Oct 2026 04:49:36 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%5]) with mapi id 15.21.0472.016; Tue, 13 Oct 2026
 04:49:36 +0000
Message-ID: <ad1c34ce-7481-4ba9-9cb7-662caed35528@intel.com>
Date: Tue, 13 Oct 2026 10:19:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/cri: Implement workaround Wa_15020021844
To: Matt Roper <matthew.d.roper@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
References: <20261012233035.1277288-2-matthew.d.roper@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20261012233035.1277288-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0019.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::16) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS6PR11MB9895:EE_
X-MS-Office365-Filtering-Correlation-Id: e831a363-1b16-4bc2-c9f7-08df28e56166
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|11063799006|56012099006|18002099003|22082099003|6133799003|260925021911599003|260925021311599003|260925022911599003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info: inUWAA+oz+9xWjVgXARaeuGVWgoeBX99cKPZ6wUUxDIoIcLEc7xQDlD6ikBizsauuIHhuvGvf4/9FQMGassZenrITOrxUjnYbt315vjNpGjUDhIMRdqMYq+5vwi7Oig2jEZOw/BgQnTU5eXXTl0ZqJizQI9HaOohA4tPRH759aMBrATx/iVLc5ACK0slmWB1KWCfySEvedjUPCebm1Kd50DSKo45moriYI/p1O7Zk1O1EysHtJKVRQMrYHKmK4e6C1Ylcr/K+NtOytUiDjTcctx0pKSzb9aAjOiuGpE8tcarWPX2jNtcJvWpfk2iQiRRAW2c5CLrnVcTsJTHk8c/JXYCFYAPlR1USZgwtqLruYVQcBuQU+ILwtIL5xzdrH7B+tcpxU4uHOWY5+Y0ui6QOqZlMfojL+J/VQw2fkmW56Kqliz4LgFkmG2XQ11zNqtTiXw9D+xPAJYp31EDTG5onmuFQOILWIQ7WidD+GMkJDUp8npD8qeIKLeZr2zHaEyfx0rL8f6htiXutS6i5FL+HRrpKgwSdQ52k7w2un5T/OQkiiw8aeJFlIV+cZPGdISjF8oTGJzgFz0e84pK0jSDYeCrB3DSYXfHeY36Pu3KHPVdZa+7twppPl90QE/mAxx4Su+rmhnH8KV6VlZN1GX6E+RhionshAUWy7x6//xp8dg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(11063799006)(56012099006)(18002099003)(22082099003)(6133799003)(260925021911599003)(260925021311599003)(260925022911599003)(261009223027099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHJwUUg2TEFZYlZFTUkvVTdoT3RhVWtIZzJ6MUxJWG5MOHRzV1NROUFrTGgw?=
 =?utf-8?B?SzVneUhZNERZb3R6TEd2bG9zUDhiN3k5RndZVXpLajVlRGdzVzhxQ0JreDND?=
 =?utf-8?B?YXh1TVU1Vmo5SUpkOXdwMXRrcUE3OENESFN0KzR5STk4akg4Z1lqdmhZc0wz?=
 =?utf-8?B?VUs4QWNlVXFYb05WNUFJTHFOeVdVZTF3eTBYaWtITldFR0VLNnRqQ2c3RHJB?=
 =?utf-8?B?cmFzcmc5YXB6aC96b0xTcHZEQUxqZDFXQ1RHOU9JL2pWWTU1YmFEd20wZFk1?=
 =?utf-8?B?WUdPSzVrUFpjNnJtMFNSTjd2bTBpeit6LzVOM1FYWDZOLytzYjRYSzllbTdT?=
 =?utf-8?B?T2pMNThBcE03ZnlUWnBuRW9LSG5mdmFTV1B4VytoTjhVcFZCdi9NRUFRbEdr?=
 =?utf-8?B?NjBLZE1CcTU3dlZWQ0cxR3p0cndsZU5rQktMWkQ1cUN3eVVIa29rUFBWQ3BL?=
 =?utf-8?B?d2ZjQVluR0ZDVkpKOUR1cjA3UThTTVU5SE95VzF2NFZQTGFFbGxiLzVnTWZz?=
 =?utf-8?B?NEhsa09LSlBmZ2RXOE5PWFhnaDdTTHhKdjBrWXFnSGdSUVBWdW03WWpNRjY5?=
 =?utf-8?B?Rm9HdmM5TkduQjVtSGV2Q25lOFVqdE0rN2JySUFxWWxzWlhiUHRabTNMMmhV?=
 =?utf-8?B?TzY1c294U0NvdTVGVjRySTNubU1KSFdDL1gxVzh4OHpqTVR4MXZKYjk3c2Nm?=
 =?utf-8?B?Y3d2WW5JOEhhTDdMb3VnWUhDT1U1WlJTNW50NjFrYXFDUXRFcHVBK3dlSEhZ?=
 =?utf-8?B?cG1FR2dhWGVudC82a1hZMDh5VGVMck4yNWh4Zmp5SVpSNFVHQk40bjlMRTZU?=
 =?utf-8?B?cHRxSFNISVBncm81MUlndFRuVmVxWWp0LytFZTVOV1lGOGhxa2tlSVZlRldD?=
 =?utf-8?B?MDNpeWkzTHIrNnUzTGJWUXZ1N25nS0didGRwOEhvQm9yNS9NUkIyTDc0RUdx?=
 =?utf-8?B?K2xzaXpyQ0greHhyTURYUE9pM3RUUXByNnQ0S3NaWml2YzBwV0pqZjFqQVl1?=
 =?utf-8?B?K0ZpallUZXhsNlk3TGpXZEU1Yzc1ZlhpNXFiK1ZpNnVjTzFMRE04ODRkNTll?=
 =?utf-8?B?eVd6ZFFtOUpzbHRZTjJCY21wSXBERG81V2FJQnFQb0E5L2tMSE5vQnp6Nitu?=
 =?utf-8?B?WjJ4ZWdWMXplMkx5RnlyNmpxMER0VG1ydGYvWUJhcDhlcmd3ZnNXVkhlQndG?=
 =?utf-8?B?aXZOZW5HNG9PQm1yWU1lUmVDUFBOV1d3ZTRVY2hZU2lYNEpjd2VOSXFXYmRw?=
 =?utf-8?B?c201akRPMjRQTDd4ekNlUSs4T3FkbUZvUFlTNGtFY1FCWXdZWlpyajlyZTk3?=
 =?utf-8?B?OENsdkZCY0QrZ2NtOVhJYkVSZDAyQnZ2dCtIVHlQU0FFU0NDU2pxbk5tRUlB?=
 =?utf-8?B?VDY0c0VIaWpKdHZheWNibTJGaXBCb2RXNUxiMTRKSStxZ2UxU0RpMVNTM3Ew?=
 =?utf-8?B?OHRlTG5wSmE3ZUh3VTNuZXlaZjJiSkZQc2JXRnVLZk5SdmM0UVRKQ25Zd0dz?=
 =?utf-8?B?ZHFVY0U3V2FRTmZwdlZjM0JMVEdaUXowa3dpYVdFTHA5SVg4M00vK00wVWlx?=
 =?utf-8?B?ak5JTXJnTDhUR3R0eTdYM2V3OG45VXh6Mm5Ka1kwa0locXp0RFpqMStpR2Nk?=
 =?utf-8?B?UU9yU3JlY0pUekxxWUM4bmtMRnZCNWFBdVhMRjJmOW9HSGhKVFJVZGNWakpq?=
 =?utf-8?B?Uk5yRjhYeFBidlF4Ui9Pd2RZKy9ZUXE2RnF6cHJNRmNhZjAvbkhtdnBmSVR5?=
 =?utf-8?B?V3cySmtjajE4VSt4MGd3eitvbkxEM1drZjRKelJobjdqQzFZOGF2MXpSd2tn?=
 =?utf-8?B?YVZ3Ly9IeWx2YXZsU1NTYTlsTWtad2VjSFloMHRJTE5VWmVKendQTUdnZEhI?=
 =?utf-8?B?MFVyT1BmY0VNRldZaHRYNnBSRzkvcHVPUUxiVVBZSjBrZnM4Mk9IWFJtVUpS?=
 =?utf-8?B?YTRPYjUzTWlHclZLNnJ3S0owRVVlVWg4MDZnKzdyM2JXM01SYVJ0UDk3SmVu?=
 =?utf-8?B?WjIrcGl4bFJGNU82akI5anBzNnNYODh2bENqNGQzSDIwMTU0eFo0M0didXhB?=
 =?utf-8?B?ZXU2dEJYN1dpeG82WTdjMjJaYkhjcFpNNjVwcnhhVG9ycndWcVU1VmhBZlhU?=
 =?utf-8?B?ZjNGVW56SDFwbGg0TkNvTlFYcFZKVlhFOFozTjMwblpZTkR3QjEwaEw3R0Qx?=
 =?utf-8?B?cjZLemZqZG1uOG1SZWNGK2NiQWE5ZmdHUmVyKy9xcEhib3BYVE9mWG5oaGUw?=
 =?utf-8?B?TVJldkZ6bzQvWWlyN0JVMDZzdVlmTE1CYStZZEltNzhGT21GV1JQdE44TWt4?=
 =?utf-8?B?TGg3Ry93SDcrZkUxNkE1UzNvaTNpckhYaDIyam9QRU8xb0VLWXF0UT09?=
X-Exchange-RoutingPolicyChecked: szNQa0Dg3U+CHqIqdcU5LDYp5NV3Lf2f9WxlrEl/EKlC6iLYqlvsnTOTQgUgjHIVFVyYiJ955rwHct2q3Q7HQ9mH2usQD3c+v7okSOcXVZ2wIngE1UyhRBjAh//FOINy4QIWsashr67cNjFp0YygvOYdl9nGnWhx1pf5v02jdOVUp96bKTSD2KIGOJDkJYroKXSpR+rCksN9423SMotffy0wa1ibv4qkZv4c4gQgcYWzbEisgVVdN1sO96tTc/Hih4erTaiMJ5JGUgQL3cWZK/jbdmyGonrfVVN4hFeuuBEXex3G4S5QIpm4OuoOYp+Al1ma+ueQGumfBZXdagAisA==
X-MS-Exchange-CrossTenant-Network-Message-Id: e831a363-1b16-4bc2-c9f7-08df28e56166
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 04:49:36.0101 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oy9E3iuUzYALuhBpF7S6NyfUduBgCERRp5L2Utj6DW7pG0tNIt/gCYYLA2gJVG+nbbr2Ak3ILFvtn0k4BiO6kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB9895
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


On 13-10-2026 05:00, Matt Roper wrote:
> On Crescent Island platforms, the pcode is signaling "ready" to the
> driver prematurely since one last sysctrl firmware initialization step
> is still underway and not fully complete.  Since the driver's
> initialization is racing with the end of the firmware's init, this can
> lead to error messages like:
>
>     xe 0000:be:00.0: [drm] *ERROR* sysctrl: Firmware error: 0x06
>     xe 0000:be:00.0: [drm] *ERROR* sysctrl: Mailbox command failed: -EIO

i see boot survivability having failure codes for sysctrl. Shouldn't 
pcode ready be indicated
only after the firmware is ready?

Thanks
Riana

>
> The current recommenedation to work around this is for the driver to
> wait an additional 0.5 seconds after getting the "ready" response,
> before moving on with other initialization tasks.
>
> Note that the official definition of this workaround is still being
> finalized, so "Wa_15020021844" is a bit of a placeholder/guess.  It's
> possible that the actual number could still change, although the request
> to wait the additional half second is pretty well set at this point.
>
> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device_wa_oob.rules | 1 +
>   drivers/gpu/drm/xe/xe_pcode.c             | 5 +++++
>   2 files changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
> index d8dc41851425c..0488a20461d81 100644
> --- a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
> @@ -7,3 +7,4 @@
>   14026633728	PLATFORM(CRESCENTISLAND)
>   14026746987	PLATFORM(CRESCENTISLAND)
>   14026779378	PLATFORM(CRESCENTISLAND)
> +15020021844	PLATFORM(CRESCENTISLAND)
> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> index 266deecbb100a..897d44ecae42b 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> @@ -11,6 +11,7 @@
>   
>   #include <drm/drm_managed.h>
>   
> +#include "generated/xe_device_wa_oob.h"
>   #include "regs/xe_pmt.h"
>   #include "xe_assert.h"
>   #include "xe_device.h"
> @@ -20,6 +21,7 @@
>   #include "xe_pm.h"
>   #include "xe_printk.h"
>   #include "xe_vsec.h"
> +#include "xe_wa.h"
>   
>   /**
>    * DOC: PCODE
> @@ -320,6 +322,9 @@ int xe_pcode_ready(struct xe_device *xe, bool locked)
>   		xe_log_err(tile, PCODE, ret, "initialization timedout after %ld seconds\n",
>   			   timeout_us / USEC_PER_SEC);
>   
> +	if (!ret && XE_DEVICE_WA(xe, 15020021844))
> +		msleep(500);
> +
>   	return ret;
>   }
>   
