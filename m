Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D8FCA600B
	for <intel-xe@archiver.kernel.org>; Thu,  8 Oct 2026 13:25:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0417C10E0B5;
	Thu,  8 Oct 2026 13:25:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NawTi7ce";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8358F10E892
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Oct 2026 13:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791465951; x=1823001951;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ZZZVp2rn83i7ktaX3YkUBqtLxBEnRDCZeb/6q4mwd4U=;
 b=NawTi7ceSTJhnz2CS+zV0usQvqW6BjAUIzxfKCcumAduSopQ2PDjr3/V
 5UZLrKfSjDCgtwhHq8NZQXLZ38p09pnSTy5B8YrDJ3yYfUnmgHxezntSK
 +iXDBNgF8A6acarAckEZuuwtTr4c5vz2cKT24zkoQdyTBF4eGANWqeR9j
 VJckCy6FcRTuoFvIwA8o8QVSUt6yLT8MTtxqwP51G33qniXmx1hkgThET
 eIes8vR2CZqqj77Xlyoa1ojyADBkh2jVL3k/i7IYj/q9T1hgSrx+MCps3
 lxV6LloSEiEmGgxBopnWQqbfnMKUFhMc1v3zyMd1x9fKqVp9wtQAq30q7 Q==;
X-CSE-ConnectionGUID: NYPyGhncQOywsFOds7fFQw==
X-CSE-MsgGUID: MvILnBsbRFa7DgVi8mSd5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="246163"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="246163"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 06:25:51 -0700
X-CSE-ConnectionGUID: 6QciZXG9RCq63H+TYfXfbw==
X-CSE-MsgGUID: IqL6/aPfRa+TpBi3PheZzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="162181"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 06:25:51 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 06:25:50 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 06:25:50 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.71) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 06:25:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WBb5MHm3og11Yugf++VfU/AFzoxb4v9X+Pa6FfIA+TH/OhUB4zWh+oWk6ecozLjpYV+cItTL3m3dODVaeJfESdkd3h0FY5PcYLj7ofrRUqXUGHFTDrLZ9x99PVc7U7oWDBhP5dFVxbbXNEKJnhpcklagv6dnIOaQbVQe2qvajApE6x5tUApxV3Fgdy6MWdNZNYI8wE++T0SCZEnPDPQXC7cGdBsdoOs8DMWyGcFsKKqJ0FOMzvAfjSoc0jJ3QZ5H5IcA+ZRkUk2aDLrDQTJ5cpLIYE32+T/kLAGkFfTGmx0zdmXidbC72zhlWz/17tn/SRl5RwX9JZIzdHCTkPhvPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4S45JucpsGfvBo7sGw3zmxNHKEUBX067P11zz8cqU8w=;
 b=xOd70xnlHv0A65ESgmvhk2fC7iEFDtDuh7aQDhAY7u+NdsWBt6TypEqohDLVopSjgkdCm5hZPrXnwtcOY2NX7HoXT3YEX2PG2+aCLumJPCatVeEA1xVNaAzRA8y6WIPn6B1b0pz9tFa+OxFoBpsGZbPOE/TqkDRv2kb7dszKKY67gLMPk3i19amjcwY1gL/PS+TpQk5QXsPd9Zl++KrkKyRGtIXhVkUGagTSqa2QKd5yuxhENPjX2doLcCEtIIYGTKFc9w5ZDc5qU/0Cxj4dNRogwscLbfq2qe/h6I5i8il4G9BqdNKyEIYY9rYmcsPXQhabvwvy0epL83yz6FADXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by DM4PR11MB6384.namprd11.prod.outlook.com (2603:10b6:8:8a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 13:25:43 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0472.016; Thu, 8 Oct 2026
 13:25:43 +0000
Message-ID: <95a4d919-85da-44f8-b3e5-cd8add83ac19@intel.com>
Date: Thu, 8 Oct 2026 18:55:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/12] drm/xe/vram: Report tile vs device VRAM
 visibility errors
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20261007211417.2093611-1-dnyaneshwar.bhadane@intel.com>
 <20261007211417.2093611-12-dnyaneshwar.bhadane@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20261007211417.2093611-12-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0084.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::15) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|DM4PR11MB6384:EE_
X-MS-Office365-Filtering-Correlation-Id: 1de7d11c-e697-4e30-182d-08df253fa767
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|10067099003|4143699003|11063799006|56012099006|5023799004;
X-Microsoft-Antispam-Message-Info: /CWKqQMkDfr3qftvaM/V79mIGNY+0dvs88Fpnc2fdegB5VBonIPpDICP0zYLssGkkXcCpjlHdS8KMB2c17O1YrRtUu4ua35wU1LWcEvaXj9XFKcQErEcQm+C624AsLf2WneAtjYFhnH4f3TvqAvSKbGfi4PrxFXbrdQUpwk8MxFDSyp3DIeN3ovqCFhVRWHIFdfEJR1HbonmF7zMixovs5OL4jefRT0BWSLR6JSCGYRpUHUt4YuqCMGHglN3Kfrh//XlL/EuVm+fIFPfpx7KLFLizAbQc8vuGYHy34zdL8SPI+IYtC9KASP3KzcToFY0q2IMb5d75gFjK1RPDis/C1SkpPK6QZSArceev5+TZm3dveLO37IHjSDWQ8THeaOPiI8RHOq7AdjI0TKXMWzqiYwULI5ZhfNXgVGoVMhzhKTp/P954UoTjHlo0FqLPMA6FWyNAbUK3KipOFQlBVEfx7Clv44c2pIQCHfzRoznzvr/IWvR+rNP360lTGochqlz+u964aBMghGIw5MX+zcBoV/h0kwzho0p3dpMyN/fJ2/50IkeRLjBJCxP0X0CNI2dSHdEvvsnDdDdnnh4Rrbok+/GNf2FKkCjnigrk940SkxEhGKJ4T5HO6ydrZXENRXk3EnyOgeIMGarlDAYpYDiWW0BqCJ6serPno6tVFn9dY4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(10067099003)(4143699003)(11063799006)(56012099006)(5023799004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXUvT0E1bnNLejltZUtCT0xDT1ROOFRHRG0rc04vaFFzVmVwR3h0bnlMV2Vw?=
 =?utf-8?B?d2FhaFFQcGEyOTczSFVRTG04b3h0VkMwZmRocUtOSGlQdEtQUFZuT09ZazNG?=
 =?utf-8?B?L2pkSmhhTXFDNThOeXNma05OZVpPcnc1eDlHOEVZcWdmSU1xOHpieUhPVno1?=
 =?utf-8?B?ZUhPK3hDNXdIZG4rT1lSN29yQW1QMlBDd1ZpQXB1TDBFRm5mYWlCd3RTZ29S?=
 =?utf-8?B?ait5ckllN2xRS1RaWDhwdUZQVDBpVGVOdnU4MVJQQzkzTmliaEFpNHIzWmVq?=
 =?utf-8?B?TTRDa0RCY2FRK2NWOFV0dDJzWTFqOUd3NmozMUxIM1VNMHBaZjJBaVI5c3Mw?=
 =?utf-8?B?bE12d1Iza0JqdlVpYUdGRG5CbDd1TVllWWNLb2RiNmljOXRIRGZjQ2hsTlRY?=
 =?utf-8?B?NWpmQ1dPdVMxWHRKbGo1T2VweTNvMlJlcm4vVVVxOEV6MGtiaGtzc1BWQ1N4?=
 =?utf-8?B?M1RXT2tzQWtQRXJHOHhaM2YyY3RFR2NDMzZoRlYzNVJkR04zTTRJN0FqYjZK?=
 =?utf-8?B?b09LV3NmZXZXRys4T01iZkgxQjRmdEZjME5tcWR3dFc0OURhU0d2VkRjLy9N?=
 =?utf-8?B?eHdtS0NTUzVBT3BhN1dPTXJiOVBOWXdja3VUb2Eva2RROFdzR2VOV2ZWb2NI?=
 =?utf-8?B?MVRPSDl1VjdWMzhzcm1Qdlhxby9mNHVDaTNaU3JiTG9wcVROS2xvdVdtdHVM?=
 =?utf-8?B?NEE5YW00UjJtT1dTdVNXS2R6dlNPU1RJTE9lS0ViYVczcXgyUzFBT0loT1l5?=
 =?utf-8?B?RW1hK055cnJkZUZZUHVWZy8yUHR4UlRUMHhoYTB0ekQzb1FtYXRwbGtyYWRF?=
 =?utf-8?B?dVVxUjFEZG8wSjFUQmFNSGpZeHR6TkF3dm0vYjEraGx5dDFWdTM4bkhWZHpK?=
 =?utf-8?B?bWF3TWFjU1pCa1AycDNMVktlM3E2THNiL2pkZHhvVnhjSndXNkwrWkhncFhO?=
 =?utf-8?B?MjM0VjU5UTY5a0lET0hTUHBva1lSQ1gxWDVIQ090b21PMGVya0IrRVFXWHlE?=
 =?utf-8?B?ODRrQWNyWFpGWTI4aHZ2R1VzYXVRRzJ6YTF3cFV5dVpWRG82SDFIN3BMQlBN?=
 =?utf-8?B?MENYd2ZEMy83cUs1MnJHRXJDQUV3NmRVd2p5endtSm83R0RNUDNOT09ZNkFQ?=
 =?utf-8?B?YmlzWjkwMFMwYmFZMmxhdjl2dEd1NkFuR0ZNeVNZa1djbjNjVVF0VUJRRENG?=
 =?utf-8?B?b0VaWmd4QmtqclY3NHdFRGh0NkV2R1huQ3k4d1dFc2lHcGMzYjFhaGp5S0Fa?=
 =?utf-8?B?blRhMDljakxyYzZxZmlYdTRXUlRjNHM1UFVhbUsxQVBvTEwybGd3a1NDSGs5?=
 =?utf-8?B?Y0lPTTB5Z1MwUEpBNjNPbXpwRHMxWVlNQ2oyTFg3dnZxVmRpWVNNVHFJN0p4?=
 =?utf-8?B?L1RDVGpBYzNQWFc1MGthZGFmMSt0cTBmcjlJUjN0UHlNci92ODQyeEQxc3ZV?=
 =?utf-8?B?Si9BQVhDYUZHdFgrSndvRGhZcGZhRW14b3NUMGpRUHEvbWlFc1NZaG9hYk5U?=
 =?utf-8?B?OHQxQXlNOUVRUHR3K0ExZ2lEQkxlN2V0MXZOVWhHZUxIblQydmxjYmxWRkRr?=
 =?utf-8?B?QnpSUlo2QWtkZUFTM2dYS2QyYTJiZkFWNldicmtzdksraXJ6MnNlY3hET21W?=
 =?utf-8?B?L3NBUWJ6Y3BkKzlHZXBPa0NmWnovOUhYYTUxSU9ZNGMwR1RPTUUxMkx3VXU4?=
 =?utf-8?B?WlJmbnBZK3VMY2ovTzhtVjJQSTdIZmJiUTRrdnZLR3p0WCtnUGVEMFlMcTdB?=
 =?utf-8?B?QzRqVEZIb1NHcDNqSXJwTGwvUTdoS1NuWFpCT2ZKandaekFrRGtOTE9LUGs4?=
 =?utf-8?B?dlFSUFZUWDFUN1ZrU3dKQlFFRlVXRm5vNzFJejdSNm83TU5XQzNRTVVKb3Rm?=
 =?utf-8?B?WEdNZnhvZitHQjd3WXNWK3UxOWwzb1B2VGcwbzBmMDNnaStMUHJka2k4c3pM?=
 =?utf-8?B?U1VzNVgydzE5V2RKOHptRGtjNGFPV3Nuc1RJYjQ1M0dGNTlEdFl5VC9INXlV?=
 =?utf-8?B?enFYK3BWTW5YdTlkZ3FiTDdraG5WUWg1amhHTGpwbkZSMnZYT0tpT1lQamY5?=
 =?utf-8?B?UnV2UzMzb1NEZmp0Ny8xclV3RUlWanpYc1BuZURzcSs4bTJ4ZFRHT1BRRGc0?=
 =?utf-8?B?NjQwemtPdTRGYzZ3YlE5MFBHaGUxNHF6S3dBLzNsYWl2T1JtTkpDUCthN0xj?=
 =?utf-8?B?Zlhsd0Q5OUhPYWplaDZnbWhOQWZFTStndmhHMTlNZ1ROWUJ3MGNiMnoxRjJY?=
 =?utf-8?B?QlR2L2NFa2oza3NRc0QyYk1vZCtuNi9XdjhWYmR3aTdLUDBpR3RVZTJZOHRE?=
 =?utf-8?B?Ly9QMCtBR3c1TGtUaSszd0hod3J2YUF5VXFsanhJWEYwTEh3NUJuNG9wUFd1?=
 =?utf-8?Q?QZMXfDVlceMOmT0U=3D?=
X-Exchange-RoutingPolicyChecked: W+MLgHVtu6Cj4KmkILwq6JH9hthNyDsmI7gymz9PKV8v8GPhq7+JvZyernGldXatk44MIzyPahSTXgjYNMQta6a9tN5U0bv3XSb4E21DeIHV9K3nWGUO4ANrbtI779Zmo/OrkjVYjqrsHHVrsOgFfxeLPZHiLhnVpH5kTZEXFt7Eo3xHr/PZ7GcPwQBtJTmd0umCG2GpNZmKPxQ135HBgpXW0vqTTPbcoRr83D1+LbFURfEO3gkHfHK3/Ble6Sph5hJor2vcYQo8Mo/Y4UzW7pYqgHKbg8DlQYtmSVJwInofYba+jUaGGcW4mmnkiwBnNaMJYyQGVxR3o74mKxDxeg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1de7d11c-e697-4e30-182d-08df253fa767
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 13:25:43.5635 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7oGnuq9a9BjhixMRcQbAnThePtzfr/j+cSSbxrHBGewaYkiast8TML9VeGO1x/QzJ6aTFoyhSsVJUQ2oYK5wSk80zJCFEaQOfaImgPU8XWs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6384
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


On 08-10-2026 02:44 am, Dnyaneshwar Bhadane wrote:
> Derive the owning tile of a struct xe_vram_region inside
> vram_region_init() from vram->id, so the "no CPU visible VRAM"
> error can distinguish a per-tile region from the device-wide
> region without changing the function's signature.
>
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_vram.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> index dcedd8cfd731..2441ffe77edb 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c
> @@ -244,6 +244,7 @@ static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
>   			    struct xe_vram_region *lmem_bar, u64 offset, u64 usable_size,
>   			    u64 region_size, resource_size_t remain_io_size)
>   {
> +	struct xe_tile *tile = vram != xe->mem.vram ? &xe->tiles[vram->id] : NULL;

hmm, we are not using tile pointer right?

IMO, we can make it bool.

bool is_tile = vram != xe->mem.vram;

>   	/* Check if VRAM region is already initialized */
>   	if (vram->mapping)
>   		return 0;
> @@ -253,7 +254,8 @@ static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
>   	vram->io_size = min_t(u64, usable_size, remain_io_size);
>   
>   	if (!vram->io_size) {
> -		drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
> +		drm_err(&xe->drm, "%s without any CPU visible VRAM. Aborting.\n",
> +			tile ? "Tile" : "Device");
>   		return -ENODEV;
>   	}
>   
