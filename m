Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37863C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 06:38:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDDE710E6CF;
	Thu,  7 Dec 2023 06:38:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 635DF10E6CF
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 06:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701931123; x=1733467123;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ioBweuAIrnnpkxAVJw7E0Rx9/AMwHKyX3rezNA4p5nw=;
 b=S9l3pOxZLeSJki6tZpwsSpzC+MMADOAUzigBbcgQ7gf7w5vJ467o3Dg1
 PMovMEeNTVrK/3mKamljnjKAA9cq8WTr3QGgIbJfqIXWatIgkDHkv4znw
 fhghfpZqlLbWl+6/Ss6aZUlnkLXEmyKWJBNAZGXHMxw11JIkJLrL21oQD
 N3faipNPOaeW/1afwsKWWU/AW9tsbWdL6mwpJasSCVjdmQmPmvME+OzPV
 VN9yliG9bFqqcrftVKWZsyGkK4rMbQfX0v62oJ+pdItsR5NYGl4XrNQDk
 pcoEmyNhgeWr7mh4kJOpW2Z8k2at4MeoVhKCiMla6CSuOJnanB23htt9g Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="7493905"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="7493905"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 22:38:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1103100810"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="1103100810"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 22:38:42 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 22:38:42 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 22:38:41 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 22:38:41 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 22:38:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OIODXmwsFfImUa/5wP7y96vof3VWICNb2FKgXx8BeZ/vr1mNLRF34qGQqE0ARDAfnoSPAdbTAdyaqQESgX3E4N4BKdQql2vEjzPNttGyfxFcr1qPK/KyGsv3eCMc49wzVDjQFziwlk3ojd2LHYM420StW8QmKP/k/PZUWomljyACGs4oleDb90E5vhxGwpnVpq7Fgy5DgocRnRjSYBMj5r816X4cGgcObHPkz+WDlVhhoBUAK2f6+VC1exWEKMXs1L1Mpw+A6qr5JKkHKgH8I1NABe1s4NrCUzxVbuE+M//av1OL/5MVl+LeA3ZZi4/0KV6eBzEiYxQgkBW0Dl1s2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hBbdvCLpNYAYC/cZXqDOGgERDeyJfbwz2FHH5bbcqDM=;
 b=m1F8AmQwM6NFX2vWSpA6WjWVAMZWBuOSa2AVghefdTPLU7gyMjr7X1G3mxZljuN6kYz7K+uCUb8U49paEDJvzrIVffGBVekkcv1qvcI2fW9z5xjH8dHxXvdT6aW9Axnlf4ZvHtB0NIHUrtcIWpLPvhBcv3xWW9+2TRcYS2KLRVyE5nloEqBzQT7onaRy3uNPWux3mUm8CZYgXIE9Es6IA9wnY/pCSIvJ6rMC68JGPzDIbeRrsafgQ4JzJbita1VyV4o7dcMr9Nq/loT53HXgHx4BbIOrMhHD+Mq0RWDH7IbjvtMAPB6GUf4xEjIFQqGBdfYDKEVJJDKDVokV92K7/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 PH0PR11MB4806.namprd11.prod.outlook.com (2603:10b6:510:31::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.27; Thu, 7 Dec 2023 06:38:39 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52%4]) with mapi id 15.20.7068.025; Thu, 7 Dec 2023
 06:38:39 +0000
Message-ID: <d6d0fd1e-3c13-4992-8969-ea6533b7128a@intel.com>
Date: Thu, 7 Dec 2023 12:08:31 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Riana Tauro <riana.tauro@intel.com>, "Upadhyay, Tejas"
 <tejas.upadhyay@intel.com>, "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20231206044735.966213-1-sujaritha.sundaresan@intel.com>
 <20231206044735.966213-2-sujaritha.sundaresan@intel.com>
 <CY5PR11MB62113FC5A386520506F9912C9584A@CY5PR11MB6211.namprd11.prod.outlook.com>
 <d9e06457-ec98-46b4-9235-8e9b3b71ffa0@intel.com>
 <7b70c647-6fb6-46ed-98e0-8e898625b5a3@intel.com>
 <SJ1PR11MB62049D5B2C629111948A668E818BA@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <65cbe85b-30a2-470c-974f-ba811ec38b52@intel.com>
 <a4be4be8-700e-44b4-b0af-1d847774054a@intel.com>
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <a4be4be8-700e-44b4-b0af-1d847774054a@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BMXP287CA0021.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::25) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|PH0PR11MB4806:EE_
X-MS-Office365-Filtering-Correlation-Id: c017ac9b-587a-4cf2-d02a-08dbf6ef2553
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B4z9suXrpK0t4wemfsLc5Mp83j3e0dStkOqg+IpD4nSWpwxTU0GdZiM0Rec+vcv+eBZTs8hMhgPeZlgk+i4R7kqajghPmQs0+3ku2U3hJhlTAYrPh51/YBTQ037qPxtXitxkK4WGOknf4mhH28+gr3QLROUKmKo3vZKEaodfO7NdLH9kr18qzp5XPZHnhJk+nHRfWbXv68+VentNavYR04ZbCsUgGbjgt/xsnq17lqtePwOjozKQ5OD6Be/ZEvB4PBJO1dJbAcUWanB10IdyM5T9QYrZAnk+8OfYc1nsdcmWb9ZBCDHkb4Cn/Lm1w1JxLq39tV+HdyonKxt8UUGU16zVIY3jAo4kHqsOIZv8cIeSuJ34NY9cHT0znyFWfcOpJu8wGymHkMl0QqoFL463Al4pKekz9P8H5wCzKuAR2D0s1/Yy4gq2pxw/Ot8qIpDrVwwc4EXC/Ydag3IvIMl9VAO3gb9spNYP5S9hnjEZ3Afly06TWpKelxolwVkIESw5y/ae4nTRks93S45D/ZTkY0kbuzs/9j3NW/oYU43wLKYPbVo+bqRg+oY2z+SAIJP73//3+b+o7tZkhhBZlmDPDBFDtzdEhJq7q4MCaq4FPr7cDvIelA0YGqMftC6mHHWEZZlAle171+z/WVBRIlpX1g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(346002)(366004)(376002)(39860400002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(5660300002)(2906002)(41300700001)(38100700002)(66556008)(82960400001)(66476007)(31696002)(86362001)(66946007)(107886003)(110136005)(478600001)(26005)(2616005)(53546011)(6506007)(6512007)(6666004)(6486002)(83380400001)(8936002)(8676002)(4326008)(316002)(36756003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1RvNjVIK1JxVUFSMVNhazJrTEFtS2s4aGI5cEMvak9EMDZ3TGVDYTlmbVNw?=
 =?utf-8?B?VlBSSjhNSENIcWdnRXhoSXJ4dHRUUkhwNC9IYm9GbzNKRENEb3M4bTA1eGZT?=
 =?utf-8?B?cCtRRlpxV01QREJPNFppaHRGSmFPNGtGUmZJOE84QTBDaElJS0NCOHVobXpx?=
 =?utf-8?B?NXFZb1hld2szUkFTNkNjc3FmREVaeXRRVWVBMXEycWtNb2tVeVpxeW1jNk10?=
 =?utf-8?B?UE1VR0R0cTBHR1Jyb01lOHFVWTVUbnd1dGhJcHlwRUhlakFyZm9CYk03WG9R?=
 =?utf-8?B?S3ExTm80YklLVnhQQkMxT2t5b2UwNGlNcXJ6a2Fhb2N1RnY5c2ZacVoyemFs?=
 =?utf-8?B?TlRTR3ZKU2ZxdTBDeTNtSVdGRTRmNTZGM1BOV3BNT2xUdkNHbDJpb1duUVEw?=
 =?utf-8?B?c21DQmxJRjh4bzdFTjltMmsyWEhwc0cza3djQ25HcG1sMzU3UllZcEtrYUJQ?=
 =?utf-8?B?NTdPYkYxZDczYzVXeTdKUGFzTGpFKzFIUE1nSmlkZ2ptWmJVTTFOaGJEZ2dD?=
 =?utf-8?B?bFkrd0w3bkV0ZlU0MkdSbUVMbGFNVWMwbmdhU2RRNDJ3RlZjUWhlVytDb1VJ?=
 =?utf-8?B?N2p5LzQzMnhNYkJpNU5xSXpheVNteWlyUHBmRjF4bDVuaTF0OXBjb0Q5bjB3?=
 =?utf-8?B?TWY4L1NyalBHMHlzazRHdXkwN2pRZktpK3h2MkpCb1NzNnlpTUdvb0sxQmsw?=
 =?utf-8?B?UVB6Qms0WU12SmF6eFBOTHJUZFpuREFkRUVwcmM5MmkyUHV2OEQwYy9mcVZ6?=
 =?utf-8?B?TlVaUGozZ3NiSVhzalVRa1dpZzlZLzVkSXFQOEh4RjBjWjU5WVhaVUY2cVpu?=
 =?utf-8?B?TGFyY25HSTk1YWVJeEtLRnBIaDZMakQ2N0hTUFAwc21BV2E2dDBOUTRvR3JR?=
 =?utf-8?B?T2pjbm84VzlBUURLYnZpUENYTTZDT2FRS0dVeTZMQW05SjNLaGRkSlNNNFlU?=
 =?utf-8?B?NnlzRzZJbXhOR3B5aHRySmhESVIrODhVN3pKQ2NBZ09odVlCdjB6OEY1bUNw?=
 =?utf-8?B?RW02UDlabFR5VFFDeFNLdTdpTGJ2QlJYdzIvQ2o1VjhyMWZKaDV4eXY1SVIz?=
 =?utf-8?B?TGt2cXpnV0UwOUdxSy8zUGdqTU1TcDFxTVdhZmpUZjlwNncyWE15LzRlQlVP?=
 =?utf-8?B?MnVPWFlKTnpmNnlNYml0eDBtaWJWRlBCTERlYUZVVCtRNFplakpHd1RLVjNP?=
 =?utf-8?B?NnoyR0xXdWlzRk9tTnNyanpmUXA2eGZKNWdLS3FzOUN3bXFqbmE2YkJJS0Mr?=
 =?utf-8?B?cEV4QVNhbU9UT2NYdVpFcWs0UGF2UlRFOVpubHJ0d3FyR1dHajRqNzg4ZTdl?=
 =?utf-8?B?WlN2WkdFcTN5NUxreEhMUi9lYURsMlA3MzBjRzJnV001VlZ1clRXaG9HVW1U?=
 =?utf-8?B?VEtPUUVqcHJYekVRbkw2eW9RemM4T0pORm8vREkyOHdwSXZaMWFvUzh2cDNZ?=
 =?utf-8?B?cG12R21tN1NzUjhucXpZWEhLbUdxK0V4NmdkK1lPcmd3bUYzTVF0aFhVR1hz?=
 =?utf-8?B?QVUzYjkrc0d4QVRxSFNDUGdMSWpheDdrbWh1VWg2L1kwTEk0SXZiZkdBUkZv?=
 =?utf-8?B?OE5HZWg0cjhBaHQvaXhNUVAycVhyVk85Z2Y4ZTNWVHBoVi8wb041NlIwZzFN?=
 =?utf-8?B?c0JMK0FReTA2RUwrTXAwSFEyU21oRzdJbWlubGJwSUlNOFdIQVM2Umg5cEJv?=
 =?utf-8?B?RXJWelZpL1dIMUs0dmZ4d1ZMS0FWc2cxdGRBa2l2ckVRYzdWSkJGWlZuTnN6?=
 =?utf-8?B?TFhoY2NaYm4rZHZqdk1kUGZabnYwcmhKU1FiYnpTaGtZZkNyaHBCZTZwOGlx?=
 =?utf-8?B?R3l0dFhicUx0T0daRHJNU0UzS2UzbVFCMzQ1M1ZNcUpOdGJLWlhZakZjTE9q?=
 =?utf-8?B?aDdpb0JXV3QrYytUcmxnOEpnRTZRZWphQTVNNVVhcDBHclJYQU9yL1d0ek5Y?=
 =?utf-8?B?SnVUYXN1d1lrMndKb2hPS1IzZkdFSXYydGdwMVdGM3EyNysxa0FYYTg3V3FO?=
 =?utf-8?B?ZnJYay9ObHJWb3BmUEhzbWhNV1FGbjk4bFZsSkRaUnk1UE5BMWY2Q1ZRdkpD?=
 =?utf-8?B?TWpNa3FtZ1V2SUJQY2RUU3FIYkdyZWxpR2ZBZ0d4VU4ySWorQVh4YThQQUs4?=
 =?utf-8?B?S0t6ZGhzRlJubW5DL3JjaHJsU2g5NjQ3c1FHTnJLQ3RZVXM0T0hxa3B6enh6?=
 =?utf-8?B?OWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c017ac9b-587a-4cf2-d02a-08dbf6ef2553
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 06:38:39.0550 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WFIT8VkDXdMaO1ljvyFRhmcX6/IKMOCR/QXUOHOljheDu/7KlIe/Rn4VB7r6kfZrMWmYeybOHbh66Yn8kSBBHrKEC1M/ljIIPs2kMbEZ5jQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4806
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [v2 1/2] drm/xe: Add a new memory directory under
 tile
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
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 12/7/2023 11:36 AM, Riana Tauro wrote:
>
>
> On 12/7/2023 10:51 AM, Sundaresan, Sujaritha wrote:
>>
>> On 12/7/2023 10:42 AM, Upadhyay, Tejas wrote:
>>>
>>>> -----Original Message-----
>>>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
>>>> Sundaresan, Sujaritha
>>>> Sent: Wednesday, December 6, 2023 5:44 PM
>>>> To: Gupta, Anshuman <anshuman.gupta@intel.com>; intel-
>>>> xe@lists.freedesktop.org
>>>> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>
>>>> Subject: Re: [Intel-xe] [v2 1/2] drm/xe: Add a new memory directory 
>>>> under
>>>> tile
>>>>
>>>>
>>>> On 12/6/2023 5:38 PM, Sundaresan, Sujaritha wrote:
>>>>> On 12/6/2023 5:23 PM, Gupta, Anshuman wrote:
>>>>>>> -----Original Message-----
>>>>>>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On 
>>>>>>> Behalf Of
>>>>>>> Sujaritha Sundaresan
>>>>>>> Sent: Wednesday, December 6, 2023 10:18 AM
>>>>>>> To: intel-xe@lists.freedesktop.org
>>>>>>> Cc: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>; Vivi,
>>>>>>> Rodrigo <rodrigo.vivi@intel.com>
>>>>>>> Subject: [Intel-xe] [v2 1/2] drm/xe: Add a new memory directory
>>>>>>> under tile
>>>>>>>
>>>>>>> Add a new memory directory under /device/tile<n> and move
>>>>>>> physical_vram_size attribute to the new directory.
>>>>>>>
>>>>>>> New hierarchy:
>>>>>>>
>>>>>>> /device/tile<n>/memory/physical_vram_size_bytes
>>>>>>>
>>>>>>> v2: Fix heading typo (Riana)
>>>>>>>       Fix cleanup error on unload/reload cycle
>>>>>>>
>>>>>>> Signed-off-by: Sujaritha Sundaresan 
>>>>>>> <sujaritha.sundaresan@intel.com>
>>>>>>> ---
>>>>>>>    drivers/gpu/drm/xe/xe_tile_sysfs.c | 15 ++++++++++++---
>>>>>>>    1 file changed, 12 insertions(+), 3 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>>>>> b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>>>>> index 16376607c68f..e8ce4d9270e6 100644
>>>>>>> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>>>>> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>>>>> @@ -24,7 +24,8 @@ static ssize_t
>>>>>>>    physical_vram_size_bytes_show(struct device *kdev, struct
>>>>>>> device_attribute *attr,
>>>>>>>                      char *buf)
>>>>>>>    {
>>>>>>> -    struct xe_tile *tile = kobj_to_tile(&kdev->kobj);
>>>>>>> +    struct kobject *kobj = &kdev->kobj;
>>>>>>> +    struct xe_tile *tile = kobj_to_tile(kobj->parent);
>>>>>>>
>>>>>>>        return sysfs_emit(buf, "%llu\n",
>>>>>>> tile->mem.vram.actual_physical_size);
>>>>>>>    }
>>>>>>> @@ -38,7 +39,7 @@ static void tile_sysfs_fini(struct drm_device
>>>>>>> *drm, void
>>>>>>> *arg)  {
>>>>>>>        struct xe_tile *tile = arg;
>>>>>>>
>>>>>>> -    kobject_put(tile->sysfs);
>>>>>>> +    kobject_del(tile->sysfs);
>>>>>> Why kobekct_del instead of kobject_put?
>>>>>> Thanks,
>>>>>> Anshuman Gupta.
>>>>> Hi Anshuman,
>>>>>
>>>>> Basically when sanity checking, after reload we see that we are not
>>>>> doing a proper cleanup.
>>>>>
>>>>> kobject_put will only decrement the ref count and possibly free the
>>>>> kobject.
>>>>>
>>>>> But that is not happening in this case. There is a duplicate 
>>>>> remaining
>>>>> of the tile directory.
>>>>>
>>>>> This required a clean unregister of the parent from sysfs hence the
>>>>> use of kobject_del.
>>>>>
>>>>> Thanks,
>>>>>
>>>>> Suja
>>>> As a continuation of the above response;
>>>>
>>>> I can probably add a kobject_put call as well to ensure that we are 
>>>> cleaning
>>>> up the memory side of
>>>>
>>>> things as well. Will add.
>>>>
>>>> Thanks,
>>>>
>>>> Suja
>>>>
>>>>>>>    }
>>>>>>>
>>>>>>>    void xe_tile_sysfs_init(struct xe_tile *tile) @@ -46,6 +47,7 @@
>>>>>>> void xe_tile_sysfs_init(struct xe_tile *tile)
>>>>>>>        struct xe_device *xe = tile_to_xe(tile);
>>>>>>>        struct device *dev = xe->drm.dev;
>>>>>>>        struct kobj_tile *kt;
>>>>>>> +    struct kobject *kobj;
>>>>>>>        int err;
>>>>>>>
>>>>>>>        kt = kzalloc(sizeof(*kt), GFP_KERNEL); @@ -64,8 +66,15 @@ 
>>>>>>> void
>>>>>>> xe_tile_sysfs_init(struct xe_tile *tile)
>>>>>>>
>>>>>>>        tile->sysfs = &kt->base;
>>>>>>>
>>>>>>> +    kobj = kobject_create_and_add("memory", tile->sysfs);
>>>>>>> +    if (!kobj) {
>>>>>>> +        kobject_put(kobj);
>>> Do you mean to put kobject_put(tile->sysfs) instead of 
>>> kobject_put(kobj) ? as there was no Kobj created by the time you 
>>> reached here!
>>>
>>> Tejas
>>
>> Yup this should be fixed.
> Hi Suja
>
> Removing tile won't be right, as there are other directories (gt#) 
> dependent on it. Simple return should be good with a warn?
>
> Thanks
> Riana
Sure. We can probably have the original cleanup in fini.
>>
>> Thanks.
>>
>> Suja
>>
>>>
>>>>>>> + drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -
>>>>>>> ENOMEM);
>>>>>>> +        return;
>>>>>>> +    }
>>>>>>> +
>>>>>>>        if (IS_DGFX(xe) && xe->info.platform != XE_DG1 &&
>>>>>>> -        sysfs_create_file(tile->sysfs, physical_memsize_attr))
>>>>>>> +        sysfs_create_file(kobj, physical_memsize_attr))
>>>>>>>            drm_warn(&xe->drm,
>>>>>>>                 "Sysfs creation to read addr_range per tile
>>>>>>> failed\n");
>>>>>>>
>>>>>>> -- 
>>>>>>> 2.25.1
