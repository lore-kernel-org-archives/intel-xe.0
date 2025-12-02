Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D16A6D12673
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 21:08:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C42D10E6AA;
	Tue,  2 Dec 2025 21:08:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ee2ngFSO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16F5110E6AA
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 21:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764709717; x=1796245717;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ra+Rbwa9YR/v7Jt1sUOMK6V03+cF80zF9Id2J1xq1AQ=;
 b=ee2ngFSO7Xr42Gn1RaWRTr9ac96a5I5NNAqQbElZk+shmoIdoZxSR0zt
 gMiJxPI2PDPWZETdr28zG3x2dGlpXK0Vg+XH4cgyxAcOvEBlVcwYkrAqr
 +iF5294IZn9vHOrx064+TZHlOqhDweRZLkVSa+zsKpQZT57ttjimmj4Sw
 JkstA5zOvyT5Etif9gYpk9G3ZY0bx3yjEhRj9fMOui8WiKH7nBhl5V9ZO
 vt+PISgUaK9U7Am5M3KzWUMNdHl+aYHUlNEsUlvR2UthSfH0Y4fxFPsZz
 bb8pkz5GDUu17wmWWtJnZpO+zF89yfVES/nk7QkS/zeWTN3A4sjVYGJrk A==;
X-CSE-ConnectionGUID: b0WI2sOeRMGlpjLcQKvuUw==
X-CSE-MsgGUID: xwLpw7V/Q2G8C6I7Y2ek/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="54242908"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="54242908"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 13:08:37 -0800
X-CSE-ConnectionGUID: Dn9sC/JtSKuw1zggh0lzMA==
X-CSE-MsgGUID: Ydc0tMu/T2GePphgXFDuTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="199433442"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 13:08:35 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 13:08:35 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 13:08:35 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.14) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 13:08:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UHrGZTIpCr8gtYYjjxgTHA8pPCZAQ/pNlZaDx6kIg1P+NqM0V65JG7MDBUwL6WXtQ6e1dpW/Oy8Nn0AiEFMkGDSYcuDD3cYP3ejV6uFJVnN+kCgHA9qknt5PNTawaprT+DKHS52KONqYezGPDni1DXIoK6lr5Ho92Vkim3a0BIQUz6QgTvbD1LlNzMX29s1LK2ZU2tby+L6B/MQ2XchXCOJ3hV08eEw0kFPNBY2rUo2d7k/a50WV21VnucAPsQa0sihX1oYvT9B9BumxHiLojQ4Yo1NlFkGwhVHCX8LB+DVzt8FEWrWsmyJ0+JFK0XmxZd1u8XNOzvJz0bniCyOKkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mvJdc8ntGLvz62B+Rj6kqpoxIJSAZDEo43CO5PwxvAw=;
 b=QMeivqzf7chsCJGj7qebxTXD3C+v27y4ctDXv7m12AnDY105IMhqwcAjWtlQdermrEC8npLF8mF6e4i376UMJhzpn0zmCAb2HGEQKhvcmNynymPcgmqL1XDc++LXams1fSMd7iKlPb6mOCB7buCoDRNSctBtMhrtOFpFHvt6LTPjFqfewvxqJ7INRci2cXLy3hYldp+j4ZZbrk2NiCvg4EGi1V950S1jzjhoklSDc57aPEOLR0lvAI+JtuuEeRqOfdh/Q8u6ieK8SaMF+PpksXfOsR3BqO3yPWj0mvKuzFYWe3jU8fm0v3tWxI8R+exC3E94+GLXnCkiFEYLw8IU/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MW4PR11MB6668.namprd11.prod.outlook.com (2603:10b6:303:1e9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 21:08:28 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 21:08:28 +0000
Message-ID: <0d646a89-2a40-4785-8206-499a9a32dcec@intel.com>
Date: Tue, 2 Dec 2025 22:08:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] drm/xe/sriov: Initialize scheduler groups
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251127014507.2323746-12-daniele.ceraolospurio@intel.com>
 <20251127014507.2323746-14-daniele.ceraolospurio@intel.com>
 <0254302e-35cf-4721-84d8-d0c95c2e6d62@intel.com>
 <fca9ea53-f64c-43de-8348-a3ba350689c0@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <fca9ea53-f64c-43de-8348-a3ba350689c0@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P189CA0004.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::17) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MW4PR11MB6668:EE_
X-MS-Office365-Filtering-Correlation-Id: ab314a18-7a94-4208-a011-08de31e6f082
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z3grb0Zvd3FmTWV6bGpQcVRSL3NpaDFmdlYyaFpwc0JjK042RHJKQm11SGVN?=
 =?utf-8?B?bVcyK1dRT2N2eXdzUUQ0dENTZnRUUTg0VUc5MUd6alMyS0J6SmF3bVN4WGZZ?=
 =?utf-8?B?RTMxSklmaEw1L0tTQ2xzWmZRVXcxbE8zUU8ycVVmWXpOcit5WmFZTU92c3hm?=
 =?utf-8?B?VEp6SWhuYzZtZ0J5VGV3Z1JxY0IzVWQ3ZUdxV2JvVjZ6TUQwMVlmZHJuQkZO?=
 =?utf-8?B?WHMvWTRRZ1dNNmpQSExhckYzd09tRms2amxDaWhscXduNTVyUzBCWnllcHF4?=
 =?utf-8?B?eW9sY1lZazJUcmhQMWs5b2cvdlppbmE3TGhVNnZxMjNENnhPNXNuUHBIVFFh?=
 =?utf-8?B?a0lJRFpDMDZyZ2UvSkZmVVpGZ05JMWFNNkdqYzl2MERkTWNwQnRja3R1OWN1?=
 =?utf-8?B?TmRodS9DMTVqWFFmMnJVekp1VG5HTkZPWXFaLytlMjRjTzZqQjNuSFJ3MTlY?=
 =?utf-8?B?VTQ5M3N3QzhaZU1TbTVhMU9remFLWG5ac0x6VGhUK1dLVCt1dmNGcjVxKzJu?=
 =?utf-8?B?UG83bXFWRHFHRlJhS1l2WTcrKzBzcy9oOUZaa1hseWtwaHN6c1lxTit3U1Iz?=
 =?utf-8?B?S2lXRHp2NFJBbFZ1QURJZW10UzVMaW5jZ1dNQWxQZC9DcXZoZVhQOEkrc1dF?=
 =?utf-8?B?VDM1NldmNitna2txKzlVSWg3dURIdHJHdVZFcmNGQ2RWeVpoMHk1OFJwVG42?=
 =?utf-8?B?eFBQUGlDSVNHc1phcE51d1krTWN2Vlp6ZWNnTUgyaVZoZ0NEYVE2OXJONFZK?=
 =?utf-8?B?WWpCOXQ3TWJ1ZU5KVkhrVVdvTkNFTFVKcmIyb1lEMjloYU8wWlhJUndoVS9a?=
 =?utf-8?B?NElLenRlYWtyQnhNQld6Q05ldnVXWnZBbWJTREhITWtibmwwODRBYlI2U3dt?=
 =?utf-8?B?RGRlT0Fmd1pGZ0VCTFRSa1h6SytRVlJybytJQWhhRFUzQW1MWDZtV1FRdi9P?=
 =?utf-8?B?V2pjUU1mZWgreFFRMkhnYjFnaHNYQjRkMFRCVjBCcFN2bndoVXdNdlMzSW84?=
 =?utf-8?B?dnVJVUsxajN3RHcxdmxEYzVXcmpZUWV1ZmIwTHpCK1dWQ01KVHZQSERSVHdj?=
 =?utf-8?B?cnhSRWZpUzdQbkZLaVNpaUJ2ekxLdXpybCtRdFVHZFZjeEkrd1JQU0w5SFh3?=
 =?utf-8?B?cnVobWpZYUEwL2JqZ24rSWFtRC85TCtRQWdxKy9NYkdSeE5aZGMzZzBxaUIr?=
 =?utf-8?B?Zld5dUlwRCtZM3l1YWs2ditWYWU5Y0Z5UStEckV4akNvY0hXazR1REYzVWdT?=
 =?utf-8?B?ZHBYb3FQVVRWM0RIa3JyTU9CQ1FxME1uVGNLYWhQL3RKOVp2dldYTGtMcHhs?=
 =?utf-8?B?dDVFS1p6aGttL3dtSDc1T0dFRWkxcTdXT1FiK0taaEUvZC9Zb2EvbmZGTWdr?=
 =?utf-8?B?K0J0RmxFZVpjMlFrcFkrc1dDa2pqQjFNa2hyc3l6VlNwQzNFYUg2Sm01eFU5?=
 =?utf-8?B?RkxFTCtPVUJJbUVhLzBjWUpwSU5ISysxaHZuY0lTTFlRQXhEdFdhOUpqeTdO?=
 =?utf-8?B?Z0dyRU1EU3lKRmgraGkyeThKVTZ5VCtBdnUzL3M0V0ZHOStNa1NxN2pmOUdl?=
 =?utf-8?B?bHlIa3UwTkZMdzNveEpISjNJWVY4eTM1Z25lb2ptcG9qbGNiWjIxTWI0U012?=
 =?utf-8?B?a0h0bHF2c3lwb1EzNkRZTDRzTXE5REk3L0cvRU0reHNPNS9YTUVnQTIwRW9B?=
 =?utf-8?B?OFJBVHZ4WjViSzBWVU94WVh2ekhMM080RmlGbWU1aEZFcDk3enBKanl2TEJh?=
 =?utf-8?B?WU9LdVJKVVFRUEdQcXNjdDRObm9sR280THJ2MEZBOGcxMjZpQVk1MDk0NzRF?=
 =?utf-8?B?R2kyZmlFc2xLNlppUUViYzdNTHkwbUhSemJrclhsK0FvUXJ5c0Q5Nkx6RWps?=
 =?utf-8?B?OG5FOVhMV0o1dzFHUmtzVFZ2VERuRUt0dERkSGRDQm5IS1UwY2RQMldCTGt5?=
 =?utf-8?Q?e1jw7K611rmRCeY7q88NcOGgt3QLdv8d?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3htS01zamVxeXRhUjFKeTBBb21NZVZDbGlLYlJkUkxiWDg2RmRRVlV0T3Zv?=
 =?utf-8?B?UjZrc1FuYU5BRC9maGN3SHgyVHZnN2poVGtEMnZ4L3N2b2ZCbmFUaGxQZGhj?=
 =?utf-8?B?LzZzWUhSTXcvam41aE4rMmdNaWtvZTdZYjMzSzJaeEo3YTMwUGpESTk2ZldH?=
 =?utf-8?B?U3dGSU1CREwrT3daSlV1QUFoSmxqL3FrZXFSOVVaNXg3c1BzTTZBNDdzZUNN?=
 =?utf-8?B?WGZRSldyQXljRk9MWFNUelRwM1piQjRQVXQ4TVU1dUtJMzNCT2VSTnlFVTl1?=
 =?utf-8?B?WW1WcWo1eWRCODZqeFpsOU9ackg1dWdwZWsray92a1hDdWxHN1lWaHBVMFA0?=
 =?utf-8?B?U3Jsb0dIZnJqL3ZTYnFCQ0FzaWh5aytqZW1nU1lvZ3BZaW5YSTZ4UVFXTjJI?=
 =?utf-8?B?ZzdWNmJLcG9wdlZ3YmVYdWZMYy9HTnBwcTNzendoMVQxTkFsYzdoTnFDbWp4?=
 =?utf-8?B?elJvVXVMVG83NmJrWjF1Vk0yVkJnS1RSODU1dVFFc3U0azk1RzN0MjllNklW?=
 =?utf-8?B?QVBZRklSa3FDVTVaQmI5eWJHSjlIRjhqMi9Zc2tmT1N2V0ovb2M2NUNJcmZx?=
 =?utf-8?B?bzFNcUVVV1BncU5aM2dMdVlucVRzYlVZLzFvL01UL2VSMmZGeTQ1SVlVUUUw?=
 =?utf-8?B?aXlqRjBWVmVxV0dHSVMwY2lBeThpdDAycE1reU5zTFYrSHBxenpNMzRrZUNR?=
 =?utf-8?B?NThNSDNjb2ZZTmtacC80UFl2VkU2R1ZaTEFwTFJSbnZEWFgyUDdiQWcxdHJq?=
 =?utf-8?B?eGVBWnVRcDVuYXpJODlHL1VCeUNITXFPOWE0ZjRJTEFLRzNnaldBbE9NbFox?=
 =?utf-8?B?Rmh3KzlIV2RrZlB3QnhBa3pEUm95ZXNFUzMwSUEwNmdDVXVwUzNFbnJva3Fh?=
 =?utf-8?B?YnJ3dm96Tkk0disra01WRzJjUUo2aFRzQXY3U3pkK2RQS3dNWGRmMkpWWk5J?=
 =?utf-8?B?Q0VBRUFneWgzKzVRODhvbnNvMUNHU3lWVjk4dW9mOXg0RzdEU253RHJacXZ4?=
 =?utf-8?B?RTZ1YkpEcUZobmJVdFZOTlFiU01tTjJ2WWZnV3crYk1HTDJxTjcyd2VLREp2?=
 =?utf-8?B?Q29aVDVEK3ZwMzJIK0hzNlFHQWkvTU5LWE5pQTBubCt0L2ZiSW5wczBtdWdj?=
 =?utf-8?B?Sjgwb1g4NWo1ZHN1N3czMDE3dU1rdzRCRnJtQ2RPSW5uUklEV0xWaE9Kcmkz?=
 =?utf-8?B?L0gwS1VvMzRNRWtGcHVMenorUGdHUWl4YjFSQ2dIMUJCMm40clo4eVBwMDkz?=
 =?utf-8?B?NmRQRVZ3YnJTaHo2MExMMms5RWFoUWpMV1BFb0tNLzBNV0wvalV5aVNqRlBt?=
 =?utf-8?B?TkRFaW05MU9OWFhiYWhQdG1obDYxT3JIUU5hNFcwM2VJSDU0bS9OQUF0Unlt?=
 =?utf-8?B?cHN6UWMvRE1SV0ZkaTM0RWdiMWtGZ3Z3WjZxSDJqMHR0WUhYcDlSM1NxTDdC?=
 =?utf-8?B?U0ZhOHRqWXdkV3pYSG5tQVgxQXhMdzB0Si9HVzlJMTZxSHZxY0FJTUthUmtr?=
 =?utf-8?B?Q0JPVHkxMHNQMWZGdS91KzQ1Sm0vbkgzQ1JXa0xveWo0aHVQYU5QMXBIMXhn?=
 =?utf-8?B?c2g3dFZMZXd3MlUzWjY3ZTNXcFFpd3cyb3M2ZHBYY1hCWUFxZ1lRZ1pzTjZs?=
 =?utf-8?B?bDNoWlgzWHJDdk8rT2dpZUxhbGxWQkMyWEVhWEpLR2x4b25TbmNQZEVsYWQz?=
 =?utf-8?B?cmJQR3F5RXRrazhpNWZuV0VNL2dkdEtZR0dpTFBrSEt4Z3NYN1RyaGhLckJn?=
 =?utf-8?B?akMrdzBPYTBzaVl6U0svMVVnYnpOS2F5cXA0VGtwZkV2MWg5cDdHKzBISHdr?=
 =?utf-8?B?MlNZcDhxNXZHbVhUNVBZbnZHYmVFL3NDRFcycEhLTTZkTmsxbHR3cWpYbEVO?=
 =?utf-8?B?MHVPaUVIUUxtRFlvZlkxdGpQNDBqdVllck5XYW4xdEJmU25UTCtmSk9rRlVk?=
 =?utf-8?B?bFc3STAzdktQa2RFaUw4Q3lNTTNIOHhPaStMMm5Ydkd2WkhWaFNma3FJQm1N?=
 =?utf-8?B?dzR3UTBCVzNPK3lYTzhONnpsRk1JRG5oS2ZhUG9zeXFMVnNsWThvY0xTc2NS?=
 =?utf-8?B?M0lkZ3VLb202OXRPT3Z5MG1nbGVFSndCQm1SQ2lmYmIxRllsOUd6SjdhZnRZ?=
 =?utf-8?B?ZVpNUzZ6RnFqOHVacjRCbklYS0pPekZlRlFVc3ZOd0g2SDZzYWFyaTRLT1RK?=
 =?utf-8?B?L1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab314a18-7a94-4208-a011-08de31e6f082
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 21:08:28.2805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 71EpVYRMQnfajOgnz29hZB0TVkIEZTV/2DAwQ4c+ZQnEJXS4F3yQsB6Jknptqqobb+4zbZIqcYorVHg+u7ssMuT2KiDCLDbm23rBlUIioxI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6668
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



On 12/2/2025 12:33 AM, Daniele Ceraolo Spurio wrote:
> 
> 
> On 12/1/2025 2:37 PM, Michal Wajdeczko wrote:
>> Hi Daniele,
>>
>> some initial comments to keep you busy ;)
>>
>> On 11/27/2025 2:45 AM, Daniele Ceraolo Spurio wrote:
>>> Scheduler groups (a.k.a. Engine Groups Scheduling, or EGS) is a GuC
>>> feature that allows the driver to define groups of engines that are
>>> independently scheduled across VFs, which allows different VFs to be
>>> active on the HW at the same time on different groups.
>>>
>>> This is intended for specific scenarios where the admin knows that the
>>> VFs are not going to fully utilize the HW and therefore assigning all of
>>> it to a single VF would lead to part of it being permanently idle.
>>> We do not allow the admin to decide how to divide the engines across
>>> groups, but we instead support specific configurations that are designed
>>> for specific use-cases. During PF initialization we detect which
>>> configurations are possible on a given GT and create the relevant
>>> groups. Since the GuC expect a mask for each class for each group, that
>>> is what we save when we init the configs.
>>>
>>> Right now we only have one use-case on the media GT. If the VFs are
>>> running a frame render + encoding at a not-too-high resolution (e.g.
>>> 1080@30fps) the render can produce frames faster than the video engine
>>> can encode them, which means that the maximum number of parallel VFs is
>>> limited by the VCS bandwidth. Since our products can have multiple VCS
>>> engines, allowing multiple VFs to be active on the different VCS engines
>>> at the same time allows us to run more parallel VFs on the same HW.
>>> Given that engines in the same media slice share some resources (e.g.
>>> SFC), we assign each media slice to a different scheduling group. We
>>> refer to this configuration as "media_slices", given that each slice
>>> gets its own group.
>>>
>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_gt_sriov_pf.c           |   5 +
>>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c    | 135 ++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h    |   1 +
>>>   .../gpu/drm/xe/xe_gt_sriov_pf_policy_types.h  |  14 ++
>>>   4 files changed, 155 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>>> index 0714c758b9c1..62dda1c24e77 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>>> @@ -14,6 +14,7 @@
>>>   #include "xe_gt_sriov_pf_control.h"
>>>   #include "xe_gt_sriov_pf_helpers.h"
>>>   #include "xe_gt_sriov_pf_migration.h"
>>> +#include "xe_gt_sriov_pf_policy.h"
>>>   #include "xe_gt_sriov_pf_service.h"
>>>   #include "xe_gt_sriov_printk.h"
>>>   #include "xe_guc_submit.h"
>>> @@ -123,6 +124,10 @@ int xe_gt_sriov_pf_init(struct xe_gt *gt)
>>>       if (err)
>>>           return err;
>>>   +    err = xe_gt_sriov_pf_policy_init(gt);
>>> +    if (err)
>>> +        return err;
>>> +
>>>       err = xe_gt_sriov_pf_migration_init(gt);
>>>       if (err)
>>>           return err;
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>>> index 4445f660e6d1..9b878578ea90 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>>> @@ -5,11 +5,14 @@
>>>     #include "abi/guc_actions_sriov_abi.h"
>>>   +#include <drm/drm_managed.h>
>> system headers shall be included before our local headers
> 
> ok
> 
>>
>>> +
>>>   #include "xe_bo.h"
>>>   #include "xe_gt.h"
>>>   #include "xe_gt_sriov_pf_helpers.h"
>>>   #include "xe_gt_sriov_pf_policy.h"
>>>   #include "xe_gt_sriov_printk.h"
>>> +#include "xe_guc.h"
>>>   #include "xe_guc_buf.h"
>>>   #include "xe_guc_ct.h"
>>>   #include "xe_guc_klv_helpers.h"
>>> @@ -351,6 +354,125 @@ u32 xe_gt_sriov_pf_policy_get_sample_period(struct xe_gt *gt)
>>>       return value;
>>>   }
>>>   +#define MAX_MEDIA_SLICES (hweight32(XE_HW_ENGINE_VECS_MASK))
>> redundant ( )
>>
>> and maybe such macro should be placed in xe_hw_engine_types.h
>> with proper comment why it works:
>>
>>     /*
>>      * Each media slice has 1x VECS
>>      * Max number of VECS instances gives us a max number of slices
>>      */
> 
> ok
> 
>>> +static int pf_sched_group_media_slices(struct xe_gt *gt, u32 **masks, u32 *num_masks)
>>> +{
>>> +    u8 slice_to_group[MAX_MEDIA_SLICES];
>>> +    struct xe_hw_engine *hwe = NULL;
>> do we need to initialize this here?
>> it will be initialized by for_each_hw_engine, no?
>>
>>> +    enum xe_hw_engine_id id;
>>> +    u32 vcs_mask = VCS_MASK(gt);
>>> +    u32 vecs_mask = VECS_MASK(gt);
>>> +    u32 gsc_mask = GSCCS_MASK(gt);
>> we try to define vars in rev-xmas-tree order
>>
>>> +    u32 *values;
>>> +    u8 slice;
>>> +    u8 groups;
>> I guess for those two generic counters we don't need to use explicitly sized int
>>
>>> +
>>> +    xe_gt_assert(gt, xe_gt_is_media_type(gt));
>>> +
>>> +    /* A media slice has 2 VCS and a VECS. We bundle the GSC with the first slice */
>>> +    for (slice = 0, groups = 0;
>>> +         gsc_mask || vcs_mask || vecs_mask;
>>> +         slice++, gsc_mask = 0, vcs_mask >>= 2, vecs_mask >>= 1) {
>>> +        if (unlikely(slice >= MAX_MEDIA_SLICES)) {
>> maybe this 'for' loop should be just for 'slice = [0, MAX)'
>>
>>> +            xe_gt_sriov_err(gt, "Too many media slices (%u) during EGS setup\n",
>>> +                    slice);
>> then after this loop we can have asserts that no engine instances are left behind
>>
>>> +            return -EINVAL;
>>> +        }
>>> +
>>> +        if ((vcs_mask & 0x3) || (vecs_mask & 0x1) || (gsc_mask & 0x1))
>>> +            slice_to_group[slice] = groups++;
>>> +    }
>> like this:
>>
>>     for (slice = 0; slice < MAX_MEDIA_SLICES; slice++ ) {
>>
>>         if ((vcs_mask & 0x3) || (vecs_mask & 0x1) || (gsc_mask & 0x1))
>>             slice_to_group[slice] = groups++;
>>
>>         vcs_mask >>= 2;
>>         vecs_mask >>= 1;
>>         gsc_mask >>= 1;
>>     }
>>
>>     xe_gt_assert(gt, !vcs_mask)
>>     xe_gt_assert(gt, !vecs_mask)
>>     xe_gt_assert(gt, !gsc_mask)
> 
> sure, will change
> 
>>> +
>>> +    /* We need at least 2 slices to split them up */
>> shouldn't we also check that each group has both VCS and VECS?
> 
> It's not really necessary, having a group that only has a VCS or a VECS is a valid scenario. For example, the main use-case we have right now (remote desktop) only cares about VCS, so not having a VECS in a group wouldn't impact it.
> 
>>
>>> +    if (groups < 2) {
>>> +        *masks = NULL;
>>> +        *num_masks = 0;
>>> +        return 0;
>>> +    }
>>> +
>>> +    /*
>>> +     * The GuC expects and array with GUC_MAX_ENGINE_CLASSES entries for
>> typo: an array ?
> 
> yup
> 
>>> +     * each group.
>>> +     */
>>> +    values = drmm_kzalloc(&gt_to_xe(gt)->drm,
>>> +                  GUC_MAX_ENGINE_CLASSES * groups * sizeof(u32),
>>> +                  GFP_KERNEL);
>>> +    if (!values)
>>> +        return -ENOMEM;
>>> +
>>> +    for_each_hw_engine(hwe, gt, id) {
>>> +        u8 guc_class = xe_engine_class_to_guc_class(hwe->class);
>>> +        u8 entry;
>>> +
>>> +        switch (hwe->class) {
>>> +        case XE_ENGINE_CLASS_VIDEO_DECODE:
>>> +            slice = hwe->instance / 2;
>> hmm, this seems to duplicate previous loop where we had:
>>
>>             vcs_mask >>= 2;
>>
>> maybe these two loops can be combined?
> 
> The issue is that there is an allocation in the middle, which is required in the second loop and sized based on the results of the first loop. I could always allocate enough memory for all the possible groups (i.e. MAX_MEDIA_SLICES), no matter how many there actually are, but I'm not sure if that is better than the double loop. I'm ok with switching if you think that's a better solution.

if you can try, then yes please, but if that's too much - we can rework this later if needed

> 
>>
>>> +            break;
>>> +        case XE_ENGINE_CLASS_VIDEO_ENHANCE:
>>> +            slice = hwe->instance;
>>> +            break;
>>> +        case XE_ENGINE_CLASS_OTHER:
>>> +            slice = 0;
>>> +            break;
>>> +        default:
>>> +            xe_gt_sriov_err(gt, "unknown media gt class %u (%s) during EGS setup\n",
>>> +                    hwe->class, hwe->name);
>> this also seems like an attempt to catch our coding error,
>> so plain assert should be sufficient
> 
> ok
> 
>>
>>> +            drmm_kfree(&gt_to_xe(gt)->drm, values);
>> do we need to bother with this kfree ?
>> it's managed allocation and any error from here will lead to abort the probe anyway
> 
> will drop
> 
>>
>>> +            return -EINVAL;
>>> +        }
>>> +
>>> +        entry = (slice_to_group[slice] * GUC_MAX_ENGINE_CLASSES) + guc_class;
>> redundant ( )
>>
>>> +        values[entry] |= BIT(hwe->logical_instance);
>>> +    }
>>> +
>>> +    *masks = values;
>>> +    *num_masks = GUC_MAX_ENGINE_CLASSES * groups;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int pf_init_sched_groups(struct xe_gt *gt)
>>> +{
>>> +    int err;
>>> +    int m;
>>> +
>>> +    xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
>>> +
>>> +    if (GUC_SUBMIT_VER(&gt->uc.guc) < MAKE_GUC_VER(1, 26, 0))
>>> +        return 0;
>>> +
>>> +    for (m = 0; m < XE_SRIOV_SCHED_GROUPS_MODES_COUNT; m++) {
>>> +        u32 *masks = NULL;
>>> +        u32 num_masks = 0;
>>> +
>>> +        switch (m) {
>>> +        case XE_SRIOV_SCHED_GROUPS_NONE:
>>> +            break;
>>> +        case XE_SRIOV_SCHED_GROUPS_MEDIA_SLICES:
>>> +            /* this mode only has groups on the media GT */
>> then having array of all modes on every GT seems non-optimal
> 
> My thought here comes from the fact that the sysfs controls are per-device, not per-gt, so we need a list of modes that will be usable in that interface. My decision was to have a single list of modes that applies to both GTs.
> To have separate lists of modes per GT we'll then also need to have a device-level list of modes that maps to the per-gt lists, which IMO makes things more complicated. It's not like we're wasting a huge amount of memory anyway.

but how this sysfs device-level uabi could look like?

for now we have just two options: either EGS is not avail/used, or it's configured to single fixed preset config (if one is available)
we can't have or select any more configs per-GT as VF will not be able to detect any other variant (it can only see if EGS is on/off)

but that's on the GT level, so in theory we can combine individual GT-modes into some device level combo

my understanding is that on the sysfs we will expose something like this (if EGS config is available):

for current media_slice only case:

├── .scheduling_groups
    ├── mode				# RW: none [media_slice]
    ├── current -> available/media_slice
    ├── available
        ├── media_slice
        │   ├── group0			# RO: rcs0 ccs0 ...
        │   ├── group1			# RO: vcs0 vcs1 vecs0
        │   └── group2			# RO: vcs2 vcs2 vecs1

but if we could create some EGS config also on the GT0 then this could be expanded to:

├── .scheduling_groups
    ├── mode				# RW: none compute [media] compute_media
    ├── current -> available/media
    ├── available
        ├── compute
        │   ├── group0			# RO: ccs0 ...
        │   ├── group1			# RO: ccs1 ...
        │   └── group2			# RO: vcs0 vcs1 vecs0 vcs2 vcs2 vecs1
        ├── media
        │   ├── group0			# RO: rcs0 ccs0 ...
        │   ├── group1			# RO: vcs0 vcs1 vecs0
        │   └── group2			# RO: vcs2 vcs2 vecs1
        ├── compute_media
        │   ├── group0			# RO: ccs0 ...
        │   ├── group1			# RO: ccs1 ...
        │   ├── group2			# RO: vcs0 vcs1 vecs0
        │   └── group3			# RO: vcs2 vcs2 vecs1


but maybe it's too early to discuss this ...


> 
>>
>>> +            if (xe_gt_is_media_type(gt)) {
>>> +                err = pf_sched_group_media_slices(gt, &masks, &num_masks);
>>> +                if (err)
>>> +                    return err;
>>> +            }
>>> +            break;
>>> +        default:
>>> +            xe_gt_sriov_err(gt, "unknown sched group mode %u\n", m);
>> this looks more like a coding error, so maybe use just assert?
> 
> ok
> 
>>
>>> +            return -EINVAL;
>>> +        }
>>> +
>>> +        xe_gt_assert(gt, (num_masks % GUC_MAX_ENGINE_CLASSES) == 0);
>>> +
>>> +        if ((m == XE_SRIOV_SCHED_GROUPS_NONE) || num_masks)
>>> +            gt->sriov.pf.policy.guc.sched_groups.supported_modes |= BIT(m);
>>> +
>>> +        gt->sriov.pf.policy.guc.sched_groups.modes[m].masks = masks;
>>> +        gt->sriov.pf.policy.guc.sched_groups.modes[m].num_masks = num_masks;
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>   static void pf_sanitize_guc_policies(struct xe_gt *gt)
>>>   {
>>>       pf_sanitize_sched_if_idle(gt);
>>> @@ -401,6 +523,19 @@ int xe_gt_sriov_pf_policy_reprovision(struct xe_gt *gt, bool reset)
>>>       return err ? -ENXIO : 0;
>>>   }
>>>   +/**
>>> + * xe_gt_sriov_pf_policy_init - Initializes the SW state of the PF policies.
>>> + * @gt: the &xe_gt
>>> + *
>>> + * This function can only be called on PF. This function does not touch the HW.
>> but must be called after checking HW engine fuses, right?
> 
> yes, I'll expand the doc.
> 
>>
>>> + *
>>> + * Return: 0 on success or a negative error code on failure.
>>> + */
>>> +int xe_gt_sriov_pf_policy_init(struct xe_gt *gt)
>>> +{
>>> +    return pf_init_sched_groups(gt);
>>> +}
>>> +
>>>   static void print_guc_policies(struct drm_printer *p, struct xe_gt_sriov_guc_policies *policy)
>>>   {
>>>       drm_printf(p, "%s:\t%s\n",
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
>>> index 2a5dc33dc6d7..c9c04d1b7f50 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
>>> @@ -18,6 +18,7 @@ bool xe_gt_sriov_pf_policy_get_reset_engine(struct xe_gt *gt);
>>>   int xe_gt_sriov_pf_policy_set_sample_period(struct xe_gt *gt, u32 value);
>>>   u32 xe_gt_sriov_pf_policy_get_sample_period(struct xe_gt *gt);
>>>   +int xe_gt_sriov_pf_policy_init(struct xe_gt *gt);
>>>   void xe_gt_sriov_pf_policy_sanitize(struct xe_gt *gt);
>>>   int xe_gt_sriov_pf_policy_reprovision(struct xe_gt *gt, bool reset);
>>>   int xe_gt_sriov_pf_policy_print(struct xe_gt *gt, struct drm_printer *p);
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
>>> index 4de532af135e..3b915801c01b 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
>>> @@ -8,16 +8,30 @@
>>>     #include <linux/types.h>
>>>   
>> we expect all enums (and enumerators) to have proper kernel-doc
> 
> will add
> 
>>
>>> +enum xe_sriov_sched_group_modes {
>>> +    XE_SRIOV_SCHED_GROUPS_NONE = 0, /* disabled */
>> do we really need this?
> 
> This makes things much easier in the follow up patches, because we don't have to treat the disabling as a special case. If the user want to disabled the feature we map it to this enum and then just handle it as any other mode.
> 
>>
>>> +    XE_SRIOV_SCHED_GROUPS_MEDIA_SLICES, /* separate groups for each media slice */
>>> +    XE_SRIOV_SCHED_GROUPS_MODES_COUNT
>> while it looks handy solution to count enumerators,
>> now COUNT pretends to be a valid mode enumerator while it is not
>>
>> maybe just provide separate #define for it?
> 
> IMO this is safer for future enum extensions. 

missing enumerators in 'switch' can be captured by the compiler

> Also, we do it this way all over the driver, including in SRIOV code (e.g. XE_SRIOV_VF_CCS_CTX_COUNT).

it wasn't me to let this in ;)

> 
>>
>>> +};
>>> +
>>>   /**
>>>    * struct xe_gt_sriov_guc_policies - GuC SR-IOV policies.
>>>    * @sched_if_idle: controls strict scheduling policy.
>>>    * @reset_engine: controls engines reset on VF switch policy.
>>>    * @sample_period: adverse events sampling period (in milliseconds).
>>> + * @sched_groups: available scheduling group configurations and current mode.
>> don't forget to describe inner members
>>
>> and there is no 'current' now
> 
> oops, that comes later
> 
>>
>>>    */
>>>   struct xe_gt_sriov_guc_policies {
>>>       bool sched_if_idle;
>>>       bool reset_engine;
>>>       u32 sample_period;
>>> +    struct {
>>> +        u32 supported_modes;
>>> +        struct {
>>> +            u32 *masks;
>>> +            u32 num_masks;
>>> +        } modes[XE_SRIOV_SCHED_GROUPS_MODES_COUNT];
>> hmm, for the NONE mode, all groups must be 0, so why bother with .masks/.num fields for it?
> 
> Again for follow up. To disable the groups we need to send the KLV with no data. The way I've done it is that we just set the mode to XE_SRIOV_SCHED_GROUPS_NONE and the underlying code will automatically handle it because the mask is null, without having to know that this particular setting is actually turning the feature off. See __pf_provision_sched_groups in the next patch.

but why make it so hidden/secret (and to some extend error-prone)

disabling EGS is an explicit activity, IMO it shouldn't be done due to lack of some bits (that might be not intentional)

> Also, I was thinking that for sysfs we could allow the code to set XE_SRIOV_SCHED_GROUPS_MEDIA_SLICES on both GTs and since on GT0 that's not a supported mode it will automatically map to empty masks/num_masks, which will tell the GuC to keep the feature disabled.

not quite happy, but if you insist, will not block on that

> 
> Daniele
> 
>>
>> maybe all we need is:
>>
>>     struct {
>>         const char *name;
>>         u32 *config;
>>     } modes[];
>>
>> then:
>>
>>     supported_modes := iterate over modes array and look for non-null config/name
>>
>>     none := supported_modes is empty
>>
>>     current := pointer to modes[] or NULL
>>
>>> +    } sched_groups;
>>>   };
>>>     /**
> 

