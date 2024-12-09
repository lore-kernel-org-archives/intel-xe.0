Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D1FE7717D
	for <intel-xe@archiver.kernel.org>; Mon,  9 Dec 2024 18:54:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4023110E512;
	Mon,  9 Dec 2024 18:54:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EDWlAV/+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D665F10E512
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Dec 2024 18:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733770443; x=1765306443;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=RxTaHptVshZnYRT3scg1ksxBCRq+j0tOjSWtp6A8bsA=;
 b=EDWlAV/+X9oLLq/0yI6JVDXhr3tx+0kVqbxzp7maTAETuuJUtrGAIYcv
 qDCg4U2c+D0YtITjfDghUFCMuIhltCqU1D1iB/kwomCWuiEFd9ydjHXqm
 XH0K/DnPZmBp6+wt2ClfzGx/D53mUOkAQBMAkcoBOaPKHt7EVDZnBKm+b
 fKHfbdLbLgqltu3W9EQN8ScZnYRZ3QwtLsg/LiPYC3nKuJ6i5MzhdeqSp
 t9ystz6wrM+9MDelqCpQ0TXGV185I2I5nlxCk43bcSpiARVuR8+EnoMwf
 h3vMqwc6sO5O2pxDiUh4ZD1lF9UTmn9rqvdoyNSR8Fwk4/hS72GvpdCtI g==;
X-CSE-ConnectionGUID: GZGi3Id2REKyNO9260XRHQ==
X-CSE-MsgGUID: ARcLXvhcSUmfrGqIIuy/zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="36923834"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; d="scan'208";a="36923834"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 10:54:02 -0800
X-CSE-ConnectionGUID: otGU+ndvSoWf4iUVJ+nzow==
X-CSE-MsgGUID: 1nG4NYZpSd+po9Dw/NiCgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; d="scan'208";a="99642740"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Dec 2024 10:54:02 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Dec 2024 10:54:01 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Dec 2024 10:54:01 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 9 Dec 2024 10:54:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sUw0Hx2/JTdzWMHVKQLOAkPJMOGh7achRm260BiPi7jdUENeHak96fJfrQKfhwN4oA5E1g3sfZybs3vrNSCX3pwLCrz8S7oRRGrbNN6HKiD4zk3CCOeFan47l1fy16mCnceasN1I+yQkJpUjiPDkj2L2hXIvntzemZLfp0SMvHswcP5oQyXRAgL7vc15jpGPy3/6Agk9q/CGhaV2FFFks34kTsd3ZVyLYNO08jI4zQUSWvQWiDSw9tOVCsKQfpofkquTh4Q9Q99oPfzeu5iRBu+cYURY/VWFm+iEcbJa54n3AF2STOowqFUGzGCu10XHy3lOQ5ZvH7mElFYvKig3cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4G1ML5nXedaRmIHvBqBeq4B9jLquSKCjMomywpiw688=;
 b=gQv11xkmw/PFepKm5hlRVLXKhxWR5WptFsrG12f3MacuT00QoChhbO068DudyE5AkHmdeugXwBMckm2KZTHW8oR+z5zfhT7RlHCY1THbWMTeLrZ8cuGwLGLjTXiq2+D5sqvzYA3MTKqa+B2MidTK3RjyLXOu/1ralll+Ry/oobYmwDU02YZq8pdEJ45dW4w7iSFbs2i8ZTixOTa9tpmQJbcxckOdtLm2Th/FlnmULkZYsNQ95Wp6uolRoQ+Q+JyAYNnrkyNwqnGqZU1VoU0pc2MB9LK3PxbUE0PTpyNLEzFgK/5zJzr3vQE3Uj6rqUu0xhXGtMgoxIcceRnH7xgTEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by MW3PR11MB4636.namprd11.prod.outlook.com (2603:10b6:303:5a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Mon, 9 Dec
 2024 18:53:52 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8230.016; Mon, 9 Dec 2024
 18:53:52 +0000
Message-ID: <4bf4ed6d-4064-4c26-971e-01c90347602a@intel.com>
Date: Mon, 9 Dec 2024 10:53:46 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/12] drm/xe/pxp: Add support for PXP-using queues
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20241120234353.1037180-1-daniele.ceraolospurio@intel.com>
 <20241120234353.1037180-8-daniele.ceraolospurio@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20241120234353.1037180-8-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0060.namprd04.prod.outlook.com
 (2603:10b6:303:6a::35) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|MW3PR11MB4636:EE_
X-MS-Office365-Filtering-Correlation-Id: a19d16c7-c993-41ba-dea6-08dd1882d323
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dzB4VmVScU9xQkc5dVlFeTVwSTNZdTkwSmRYY2MwOEUwcVMyQWpZdHRmRWE2?=
 =?utf-8?B?UDVlaHFXN0x4RE5sYjVrd2xXTXBxVnQvNGdPSzBqczduQ0krM0c5ZGVNaGRj?=
 =?utf-8?B?c09jcis5M1pGSDQrQmt3TEhRZ0RrQTl3NHlCd2RMZ2Z3V0Y2bFdGb1RVeGpE?=
 =?utf-8?B?T0ZGUlNnNGNYUjhKVEVSek1vYm02QUZZN1VBSWNtUG0yZVR2ZDhFTEVtRTRG?=
 =?utf-8?B?TEM2WlBHb0drOUhZbWh3SGplaFlpa2txbjVRdVJzRjR4bDN4ODVqbVQvai81?=
 =?utf-8?B?WlQ0STJ4a2xYS2dpd2x3TE9PMU96SHBsR1R3TmlvNFB4S05LMW9oNlorL2ts?=
 =?utf-8?B?eDNWRXM3SHpNR01EUEpCN3Q3bTZQeVBYY1hNaUc3K2VQUHNJWVBFUXBaVWs5?=
 =?utf-8?B?TnRhVUpwWi9JTVd6L2pzNUNRcStvaVFLWTYxR1FEOU9Jc0t0MHhybHMzQ21S?=
 =?utf-8?B?aE55c1c4TThKUWpldHVITVNFSmNMZWUzOFhzYzFEOVJRNjBHazYrU0cvSkFv?=
 =?utf-8?B?a3JxY1g0ZTBTak9qUTVHMXFwRDNaU1BBZDByK2dZSTZROE1nSWo1bE5nV3lE?=
 =?utf-8?B?M29FZUxkVkx5VlVvazAzTU8zeUhzOTcvSUpPZExsS0RySXh3SzVuN0hreSt4?=
 =?utf-8?B?d3pvakxtQjBzd3lVNTk0WTZHVFNSOFFldkQwSGlwT3dpUmkvTDBlOGxCd3NO?=
 =?utf-8?B?NXRFM09qWVJ0eit2WlRWazBTdUdTQlgwd3FKdlN2VzM4VlFkL0h5QkluWVF1?=
 =?utf-8?B?N21FMGxjYUZFQk51QUlyTHBtLzV3bE5KVFJ6cThLY0xQMTRNQTNRSzhHNlFj?=
 =?utf-8?B?VUl5K2NtZjdSbFlpcVc0eXlub1FWK0xEOFo5QXJZM0ozUXhxZVhIR2RjZ2Jp?=
 =?utf-8?B?K05FTEF4N0pYS3VqTlhzN3pQOTF6NHlveVA1YnA4VDlCdDJzNE9NUjNNY0tk?=
 =?utf-8?B?N1VCUWJxZGVoY0w2SWZsMUpiUW5EUmQ5SWhrV2xIUDg1N3ZzcGpCSkFiK1g0?=
 =?utf-8?B?OVJuV0hmWndrM0JGVW5JakdtQnZsYjFrRmYxN1NzeWZSVE5UVjNmNEl5a1hV?=
 =?utf-8?B?WS9CbGZTS1kzOG9qVCtMWXRsbU4wN1RnQ2srK283d0EwTkZ3NDR0eEx3VVRT?=
 =?utf-8?B?a29xcW1vL0VFamxGNEJqRVpuQlJQKytWRkpCc1RlS2RDNUFaM3VZV1JaMTdC?=
 =?utf-8?B?MG1ORnZnQkVXNS9KWWw4Vmx3L1JHbld0V1M2Y1JNallaU0dwNjV6YUtsVXdR?=
 =?utf-8?B?cnZmb1RYN0J0VWt2cnlGemo4Q3p4anI0NVpUdzVxOXVLN0VDNVZkOWMvQll2?=
 =?utf-8?B?Z0NiaGszZjBqMk92alFGM2FsZDNndlI5QWhEcjhrei9rZmRDSzl3R3g5bEoy?=
 =?utf-8?B?dmlXWWlEbG9NZHg0ZUNxaGQxVmxNMGpIdHJBK0gxZW9oOW1wSUh3dGFBYzBU?=
 =?utf-8?B?NzNRUVBzd1FZOExRTmh1SjhCa21ZV3hiNWxkOVZGeGRHNGJLUVZRL0xYK00w?=
 =?utf-8?B?NWZDdEZVZnF2dTExUGp3ODFGMkFSd253MmlmYW9mYmJwd3BDN3loK0M2RVpZ?=
 =?utf-8?B?bGdoekpSdUsyRlp4Zy81NlllcGIzNGN5MFl3eitFRDhoSXVjL2R4V2Q2bnN0?=
 =?utf-8?B?ZjdkdnFHOURsTy9UWlRJKzNqdDhzck8vQ3FyeXZiNHBTb2tzaytrbTVaVCtU?=
 =?utf-8?B?dU8zK0NLbGhUaTQvR1c4VzYyeEc4YUQyYi9zRU9kTnNIRjIzSlZrRXJYc1dY?=
 =?utf-8?B?WERyeXgwa3d1YnBXVXdWUUc4RkRxTzEzSkhLUG92anQydEt0R1lvY2NLVWNr?=
 =?utf-8?B?N3J0K21CVFpsanVIdzBIdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzlwbDl6ZFo3TUtwV0VKR3RPbUFYTS96R0JCUThrVktXeTNaQ0RRM3lFd2lD?=
 =?utf-8?B?NDhGU3ZCL1dEUUNpNFlSNVNTMS9DcDhEaDgvQmZXUE1RR0pJMFZpR2piWHkz?=
 =?utf-8?B?Qjl3akVKZDNtZFdtMkRsRW10NlBIaXVHRDhRS0tFZldTd0MxL1EzOVhjZEoy?=
 =?utf-8?B?bTFPUTZCN21YN2lLZml4YURaS3o3czRNQmJ3RncrTzY4V0N1ZEJDRXBWWFBj?=
 =?utf-8?B?elhnWnNMRjNpYUdqeUNPRW91VzdyV3NZSmxkUjJ4MkFETVRUaURFWG16M1JV?=
 =?utf-8?B?NXVFbGp3U1hCcnBZTW5MTkc1cHBYbGxWWTg4REM4TVdNRnFpazVjNUh2RFUx?=
 =?utf-8?B?NkI4T2l2dWdZSk53R1VGbDF0STF5RWhWYmZyS1RpcjBJMlUrRXFpVklUcTln?=
 =?utf-8?B?cVRHcGhua0F0YVl3cjJSRzhnMTFEQnViQndDcUdZMjEzYkk1TUltMmhiWUFy?=
 =?utf-8?B?Rm9samhVdTk5eUtnaCs1em5TZm1BN1ppL0lIS0M5cXRQZmdYZERZaU5SUFIx?=
 =?utf-8?B?ZmovSkk2alNnbWl6RW1VN0h2UUcrYUs2VGZNTjVvbXpuek9SWkkwMHZkL2JT?=
 =?utf-8?B?K0JsRXlyTm9sZzZwTzBYZ1c5V2NhQ3VPWTNwSDEvSzdOWmpFK0dVMmJxTHky?=
 =?utf-8?B?a2EvQ1RrWUhJUWgzOEkwN1QwcjVnV2hqeWZpdzU5bGtiYmxLdXpLZ3I3c2hM?=
 =?utf-8?B?N3R4K3hQdk9EdWU4aU9EQXVUSS9CNlY5SU1zTStnMVZZTzNPMlczUTRHVDEv?=
 =?utf-8?B?bjZOR1E1NmtwblZpYmtFbG1mREl0SWtPQllXT2RkcTNaeU1CZTFGL1FEaTRE?=
 =?utf-8?B?Y01HMHVodENuemlZVlIvZmpJZlllVmVMd0pvNm5uUmd6SFMxRmVmblNuWkFN?=
 =?utf-8?B?TXRLWkx0Z2pMRjZxdm9qR0puOU0zTldEV3dkUHFvVGNpYk0wUWhzTXExVnBN?=
 =?utf-8?B?SVJld21ldEQydHV5bmtDcm9PcUhiaHRJQytZRlNwRE9sMlh5TWZIOTlKTnZt?=
 =?utf-8?B?NFZoM24yWS9jY3JUQTk0QW0yLzJWN2N2QjVPd0ZDNmFqakc5RFQwUHQydWJj?=
 =?utf-8?B?M2tGc1BzUkhRU1pkMHRzQVBSK254aUhDSjg4aGk5dkZENjRjUXJtaVQwVjR6?=
 =?utf-8?B?bldWSWFDcnpVeG1aOXFRWnhOVTVUVkJwUU1lc0RSZ1lGdUVkRnM1ZGJVdGRX?=
 =?utf-8?B?SXhHK0ZiVlRmc1VOekdSQUJ0aDNnRTl4N3d0N2ZRK21EV1RzbE5YSW1hemcw?=
 =?utf-8?B?Rk1RQmdiejkrdi9RdmlnNFE0VExKL3IzR1g4UmI1TFFYMitpOSs1U1FMcksw?=
 =?utf-8?B?N0NPWndrbTNTL2hUOWQ0Y3ZCYUtGU1E4cFMvM0lDUThxakZFTjZESTlTVDI5?=
 =?utf-8?B?V2JZTFpUWVlMR3V5eVBWd2VDcThFTnJrcThERkpKcHZyamhLRnBzRi9URUJM?=
 =?utf-8?B?dlJjUXpGZzR2VzBJVHYxdGxTajF2ZEd6OW01blN0TTFadFlPY21ZdDJoOWpH?=
 =?utf-8?B?UnpiMms3MExCOEQyaXh4MkdJM2pYRENJWSs3VXRzNVhObER1OUdSdFVyK0F6?=
 =?utf-8?B?cFlJaWJBSHJpNzF4Qmh0YnFYSVpnT2xvRmtieHFsc1lLMGJEcStxbjlxekEr?=
 =?utf-8?B?WVlRTEc0NG5GbTNzMkdyeFFuL2xUSDdSeDVZeDVjNXdZclBXU3g5b1F6VE84?=
 =?utf-8?B?alUzOEZIbTJYY1V6Wmg5Sk9jNDVXQmh5SlEyUTE0WnFYUWg0SzlHYitZOHFY?=
 =?utf-8?B?UWdKbUg4WEl6NlNHWUZiVURtNFFTQVJrcm4yZlNZeXIzL2tNTXRON25idGhy?=
 =?utf-8?B?VjRMU1JRYkhFSHhNU2JFTG5FRmxFYzNzZnJKSThwQW1jVklRK1FPMHdXNFJi?=
 =?utf-8?B?T0xKWDBtM0lYNVdpblVqaDFXdUVkeWp2cWdudU1ERG5aQm1NUTVzRUpJN0FG?=
 =?utf-8?B?Um9BUG83Q2hpT3dBN1J1Tk84VkRDMWJZSlhDYWdOZEZVQm53QTZiTytFNUtt?=
 =?utf-8?B?VXJYVkVCUk1icFgwZHZXYjFVdmJiNG1XZzJoY0pxVGdaNkhUMUswYlhKZWkr?=
 =?utf-8?B?REJuSUtPbk14S3Urak0rOWxyTzZvZUdydWF5cStKci9WLzlGTEd3a00zbTRr?=
 =?utf-8?B?U0M5ZGNUaWZISzdrY3paSkZOTmJ3K044eGFvY0w2WnJrOEY5b2tWUXNoRkUz?=
 =?utf-8?B?bnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a19d16c7-c993-41ba-dea6-08dd1882d323
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 18:53:52.6829 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ddmh2aveZ6ArA5exmpPnetBeGtsa4DGoUb0EJTlFrarRO231grhv3UthRnmgoObvjkhrggPNgtVdQjdk8vIBIeyuQbQvjQp2o/o080BNCFc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4636
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

On 11/20/2024 15:43, Daniele Ceraolo Spurio wrote:
> Userspace is required to mark a queue as using PXP to guarantee that the
> PXP instructions will work. When a PXP queue is created, the driver will
> do the following:
> - Start the default PXP session if it is not already running;
> - set the relevant bits in the context control register;
> - assign an rpm ref to the queue to keep for its lifetime (this is
>    required because PXP HWDRM sessions are killed by the HW suspend flow).
>
> When a PXP invalidation occurs, all the PXP queues will be killed.
> On submission of a valid PXP queue, the driver will validate all
> encrypted objects mapped to the VM to ensured they were encrypted with
> the current key.
>
> v2: Remove pxp_types include outside of PXP code (Jani), better comments
> and code cleanup (John)
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_engine_regs.h |   1 +
>   drivers/gpu/drm/xe/xe_exec_queue.c       |  57 +++-
>   drivers/gpu/drm/xe/xe_exec_queue.h       |   5 +
>   drivers/gpu/drm/xe/xe_exec_queue_types.h |   8 +
>   drivers/gpu/drm/xe/xe_execlist.c         |   2 +-
>   drivers/gpu/drm/xe/xe_lrc.c              |  16 +-
>   drivers/gpu/drm/xe/xe_lrc.h              |   4 +-
>   drivers/gpu/drm/xe/xe_pxp.c              | 317 ++++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_pxp.h              |   9 +-
>   drivers/gpu/drm/xe/xe_pxp_types.h        |  26 ++
>   include/uapi/drm/xe_drm.h                |  40 ++-
>   11 files changed, 471 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 7c78496e6213..07365d4f288e 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -130,6 +130,7 @@
>   #define RING_EXECLIST_STATUS_HI(base)		XE_REG((base) + 0x234 + 4)
>   
>   #define RING_CONTEXT_CONTROL(base)		XE_REG((base) + 0x244, XE_REG_OPTION_MASKED)
> +#define	  CTX_CTRL_PXP_ENABLE			REG_BIT(10)
>   #define	  CTX_CTRL_OAC_CONTEXT_ENABLE		REG_BIT(8)
>   #define	  CTX_CTRL_RUN_ALONE			REG_BIT(7)
>   #define	  CTX_CTRL_INDIRECT_RING_STATE_ENABLE	REG_BIT(4)
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 60418debc1ec..6851334be230 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -23,6 +23,7 @@
>   #include "xe_ring_ops_types.h"
>   #include "xe_trace.h"
>   #include "xe_vm.h"
> +#include "xe_pxp.h"
>   
>   enum xe_exec_queue_sched_prop {
>   	XE_EXEC_QUEUE_JOB_TIMEOUT = 0,
> @@ -36,6 +37,8 @@ static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue
>   
>   static void __xe_exec_queue_free(struct xe_exec_queue *q)
>   {
> +	if (xe_exec_queue_uses_pxp(q))
> +		xe_pxp_exec_queue_remove(gt_to_xe(q->gt)->pxp, q);
>   	if (q->vm)
>   		xe_vm_put(q->vm);
>   
> @@ -75,6 +78,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>   	INIT_LIST_HEAD(&q->lr.link);
>   	INIT_LIST_HEAD(&q->multi_gt_link);
>   	INIT_LIST_HEAD(&q->hw_engine_group_link);
> +	INIT_LIST_HEAD(&q->pxp.link);
>   
>   	q->sched_props.timeslice_us = hwe->eclass->sched_props.timeslice_us;
>   	q->sched_props.preempt_timeout_us =
> @@ -109,6 +113,21 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
>   {
>   	struct xe_vm *vm = q->vm;
>   	int i, err;
> +	u32 flags = 0;
> +
> +	/*
> +	 * PXP workloads executing on RCS or CCS must run in isolation (i.e. no
> +	 * other workload can use the EUs at the same time). On MTL this is done
> +	 * by setting the RUNALONE bit in the LRC, while starting on Xe2 there
> +	 * is a dedicated bit for it.
> +	 */
> +	if (xe_exec_queue_uses_pxp(q) &&
> +	    (q->class == XE_ENGINE_CLASS_RENDER || q->class == XE_ENGINE_CLASS_COMPUTE)) {
> +		if (GRAPHICS_VER(gt_to_xe(q->gt)) >= 20)
> +			flags |= XE_LRC_CREATE_PXP;
> +		else
> +			flags |= XE_LRC_CREATE_RUNALONE;
> +	}
>   
>   	if (vm) {
>   		err = xe_vm_lock(vm, true);
> @@ -117,7 +136,7 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
>   	}
>   
>   	for (i = 0; i < q->width; ++i) {
> -		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K);
> +		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, flags);
>   		if (IS_ERR(q->lrc[i])) {
>   			err = PTR_ERR(q->lrc[i]);
>   			goto err_unlock;
> @@ -162,6 +181,19 @@ struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *v
>   	if (err)
>   		goto err_post_alloc;
>   
> +	/*
> +	 * We can only add the queue to the PXP list after the init is complete,
> +	 * because the PXP termination can call exec_queue_kill and that will
> +	 * go bad if the queue is only half-initialized. This means that we
> +	 * can't do it when we handle the PXP extension in __xe_exec_queue_alloc
> +	 * and we need to do it here instead.
> +	 */
> +	if (xe_exec_queue_uses_pxp(q)) {
> +		err = xe_pxp_exec_queue_add(xe->pxp, q);
> +		if (err)
> +			goto err_post_alloc;
> +	}
> +
>   	return q;
>   
>   err_post_alloc:
> @@ -250,6 +282,9 @@ void xe_exec_queue_destroy(struct kref *ref)
>   	struct xe_exec_queue *q = container_of(ref, struct xe_exec_queue, refcount);
>   	struct xe_exec_queue *eq, *next;
>   
> +	if (xe_exec_queue_uses_pxp(q))
> +		xe_pxp_exec_queue_remove(gt_to_xe(q->gt)->pxp, q);
> +
>   	xe_exec_queue_last_fence_put_unlocked(q);
>   	if (!(q->flags & EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD)) {
>   		list_for_each_entry_safe(eq, next, &q->multi_gt_list,
> @@ -405,6 +440,22 @@ static int exec_queue_set_timeslice(struct xe_device *xe, struct xe_exec_queue *
>   	return 0;
>   }
>   
> +static int
> +exec_queue_set_pxp_type(struct xe_device *xe, struct xe_exec_queue *q, u64 value)
> +{
> +	if (value == DRM_XE_PXP_TYPE_NONE)
> +		return 0;
> +
> +	if (!xe_pxp_is_enabled(xe->pxp))
> +		return -ENODEV;
> +
> +	/* we only support HWDRM sessions right now */
> +	if (XE_IOCTL_DBG(xe, value != DRM_XE_PXP_TYPE_HWDRM))
> +		return -EINVAL;
> +
> +	return xe_pxp_exec_queue_set_type(xe->pxp, q, DRM_XE_PXP_TYPE_HWDRM);
> +}
> +
>   typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
>   					     struct xe_exec_queue *q,
>   					     u64 value);
> @@ -412,6 +463,7 @@ typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
>   static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
>   	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY] = exec_queue_set_priority,
>   	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE] = exec_queue_set_timeslice,
> +	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE] = exec_queue_set_pxp_type,
>   };
>   
>   static int exec_queue_user_ext_set_property(struct xe_device *xe,
> @@ -431,7 +483,8 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
>   			 ARRAY_SIZE(exec_queue_set_property_funcs)) ||
>   	    XE_IOCTL_DBG(xe, ext.pad) ||
>   	    XE_IOCTL_DBG(xe, ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY &&
> -			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE))
> +			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE &&
> +			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE))
>   		return -EINVAL;
>   
>   	idx = array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_property_funcs));
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> index 90c7f73eab88..17bc50a7f05a 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -57,6 +57,11 @@ static inline bool xe_exec_queue_is_parallel(struct xe_exec_queue *q)
>   	return q->width > 1;
>   }
>   
> +static inline bool xe_exec_queue_uses_pxp(struct xe_exec_queue *q)
> +{
> +	return q->pxp.type;
> +}
> +
>   bool xe_exec_queue_is_lr(struct xe_exec_queue *q);
>   
>   bool xe_exec_queue_ring_full(struct xe_exec_queue *q);
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 1158b6062a6c..9e4af4824b65 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -128,6 +128,14 @@ struct xe_exec_queue {
>   		struct list_head link;
>   	} lr;
>   
> +	/** @pxp: PXP info tracking */
> +	struct {
> +		/** @pxp.type: PXP session type used by this queue */
> +		u8 type;
> +		/** @pxp.link: link into the list of PXP exec queues */
> +		struct list_head link;
> +	} pxp;
> +
>   	/** @ops: submission backend exec queue operations */
>   	const struct xe_exec_queue_ops *ops;
>   
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index a8c416a48812..84b69a5dd361 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -265,7 +265,7 @@ struct xe_execlist_port *xe_execlist_port_create(struct xe_device *xe,
>   
>   	port->hwe = hwe;
>   
> -	port->lrc = xe_lrc_create(hwe, NULL, SZ_16K);
> +	port->lrc = xe_lrc_create(hwe, NULL, SZ_16K, 0);
>   	if (IS_ERR(port->lrc)) {
>   		err = PTR_ERR(port->lrc);
>   		goto err;
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 22e58c6e2a35..b05268cd8f36 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -876,7 +876,7 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
>   #define PVC_CTX_ACC_CTR_THOLD	(0x2a + 1)
>   
>   static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> -		       struct xe_vm *vm, u32 ring_size)
> +		       struct xe_vm *vm, u32 ring_size, u32 init_flags)
>   {
>   	struct xe_gt *gt = hwe->gt;
>   	struct xe_tile *tile = gt_to_tile(gt);
> @@ -964,6 +964,16 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>   				     RING_CTL_SIZE(lrc->ring.size) | RING_VALID);
>   	}
>   
> +	if (init_flags & XE_LRC_CREATE_RUNALONE)
> +		xe_lrc_write_ctx_reg(lrc, CTX_CONTEXT_CONTROL,
> +				     xe_lrc_read_ctx_reg(lrc, CTX_CONTEXT_CONTROL) |
> +				     _MASKED_BIT_ENABLE(CTX_CTRL_RUN_ALONE));
> +
> +	if (init_flags & XE_LRC_CREATE_PXP)
> +		xe_lrc_write_ctx_reg(lrc, CTX_CONTEXT_CONTROL,
> +				     xe_lrc_read_ctx_reg(lrc, CTX_CONTEXT_CONTROL) |
> +				     _MASKED_BIT_ENABLE(CTX_CTRL_PXP_ENABLE));
> +
>   	xe_lrc_write_ctx_reg(lrc, CTX_TIMESTAMP, 0);
>   
>   	if (xe->info.has_asid && vm)
> @@ -1012,7 +1022,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>    * upon failure.
>    */
>   struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
> -			     u32 ring_size)
> +			     u32 ring_size, u32 flags)
>   {
>   	struct xe_lrc *lrc;
>   	int err;
> @@ -1021,7 +1031,7 @@ struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
>   	if (!lrc)
>   		return ERR_PTR(-ENOMEM);
>   
> -	err = xe_lrc_init(lrc, hwe, vm, ring_size);
> +	err = xe_lrc_init(lrc, hwe, vm, ring_size, flags);
>   	if (err) {
>   		kfree(lrc);
>   		return ERR_PTR(err);
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index 9bc86c1fc16f..40605b868d88 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -42,8 +42,10 @@ struct xe_lrc_snapshot {
>   #define LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR (0x34 * 4)
>   #define LRC_PPHWSP_PXP_INVAL_SCRATCH_ADDR (0x40 * 4)
>   
> +#define XE_LRC_CREATE_RUNALONE 0x1
> +#define XE_LRC_CREATE_PXP 0x2
>   struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
> -			     u32 ring_size);
> +			     u32 ring_size, u32 flags);
>   void xe_lrc_destroy(struct kref *ref);
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
> index bc816cfecdd6..ce1d7ab448dc 100644
> --- a/drivers/gpu/drm/xe/xe_pxp.c
> +++ b/drivers/gpu/drm/xe/xe_pxp.c
> @@ -6,11 +6,16 @@
>   #include "xe_pxp.h"
>   
>   #include <drm/drm_managed.h>
> +#include <uapi/drm/xe_drm.h>
>   
>   #include "xe_device_types.h"
> +#include "xe_exec_queue.h"
>   #include "xe_force_wake.h"
> +#include "xe_guc_submit.h"
> +#include "xe_gsc_proxy.h"
>   #include "xe_gt.h"
>   #include "xe_gt_types.h"
> +#include "xe_huc.h"
>   #include "xe_mmio.h"
>   #include "xe_pm.h"
>   #include "xe_pxp_submit.h"
> @@ -34,11 +39,45 @@ bool xe_pxp_is_supported(const struct xe_device *xe)
>   	return xe->info.has_pxp && IS_ENABLED(CONFIG_INTEL_MEI_GSC_PROXY);
>   }
>   
> -static bool pxp_is_enabled(const struct xe_pxp *pxp)
> +bool xe_pxp_is_enabled(const struct xe_pxp *pxp)
>   {
>   	return pxp;
>   }
>   
> +static bool pxp_prerequisites_done(const struct xe_pxp *pxp)
> +{
> +	struct xe_gt *gt = pxp->gt;
> +	unsigned int fw_ref;
> +	bool ready;
> +
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +
> +	/*
> +	 * If force_wake fails we could falsely report the prerequisites as not
> +	 * done even if they are; the consequence of this would be that the
> +	 * callers won't go ahead with using PXP, but if force_wake doesn't work
> +	 * the GT is very likely in a bad state so not really a problem to abort
> +	 * PXP. Therefore, we can just log the force_wake error and not escalate
> +	 * it.
> +	 */
> +	XE_WARN_ON(!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL));
> +
> +	/* PXP requires both HuC authentication via GSC and GSC proxy initialized */
> +	ready = xe_huc_is_authenticated(&gt->uc.huc, XE_HUC_AUTH_VIA_GSC) &&
> +		xe_gsc_proxy_init_done(&gt->uc.gsc);
> +
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +
> +	return ready;
> +}
> +
> +static bool pxp_session_is_in_play(struct xe_pxp *pxp, u32 id)
> +{
> +	struct xe_gt *gt = pxp->gt;
> +
> +	return xe_mmio_read32(&gt->mmio, KCR_SIP) & BIT(id);
> +}
> +
>   static int pxp_wait_for_session_state(struct xe_pxp *pxp, u32 id, bool in_play)
>   {
>   	struct xe_gt *gt = pxp->gt;
> @@ -48,6 +87,8 @@ static int pxp_wait_for_session_state(struct xe_pxp *pxp, u32 id, bool in_play)
>   			      250, NULL, false);
>   }
>   
> +static void pxp_invalidate_queues(struct xe_pxp *pxp);
> +
>   static void pxp_terminate(struct xe_pxp *pxp)
>   {
>   	int ret = 0;
> @@ -55,6 +96,24 @@ static void pxp_terminate(struct xe_pxp *pxp)
>   	struct xe_gt *gt = pxp->gt;
>   	unsigned int fw_ref;
>   
> +	lockdep_assert_held(&pxp->mutex);
> +
> +	pxp_invalidate_queues(pxp);
> +
> +	/*
> +	 * If we have a termination already in progress, we need to wait for
> +	 * it to complete before queueing another one. We update the state
> +	 * to signal that another termination is required and leave it to the
> +	 * pxp_start() call to take care of it.
> +	 */
> +	if (!completion_done(&pxp->termination)) {
> +		pxp->status = XE_PXP_NEEDS_TERMINATION;
> +		return;
> +	}
> +
> +	reinit_completion(&pxp->termination);
> +	pxp->status = XE_PXP_TERMINATION_IN_PROGRESS;
> +
>   	drm_dbg(&xe->drm, "Terminating PXP\n");
>   
>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> @@ -81,13 +140,32 @@ static void pxp_terminate(struct xe_pxp *pxp)
>   out:
>   	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   
> -	if (ret)
> +	if (ret) {
>   		drm_err(&xe->drm, "PXP termination failed: %pe\n", ERR_PTR(ret));
> +		pxp->status = XE_PXP_ERROR;
> +		complete_all(&pxp->termination);
> +	}
>   }
>   
>   static void pxp_terminate_complete(struct xe_pxp *pxp)
>   {
> -	/* TODO mark the session as ready to start */
> +	/*
> +	 * We expect PXP to be in one of 2 states when we get here:
> +	 * - XE_PXP_TERMINATION_IN_PROGRESS: a single termination event was
> +	 * requested and it is now completing, so we're ready to start.
> +	 * - XE_PXP_NEEDS_TERMINATION: a second termination was requested while
> +	 * the first one was still being processed; we don't update the state
> +	 * in this case so the pxp_start code will automatically issue that
> +	 * second termination.
> +	 */
> +	if (pxp->status == XE_PXP_TERMINATION_IN_PROGRESS)
> +		pxp->status = XE_PXP_READY_TO_START;
> +	else if (pxp->status != XE_PXP_NEEDS_TERMINATION)
> +		drm_err(&pxp->xe->drm,
> +			"PXP termination complete while status was %u\n",
> +			pxp->status);
> +
> +	complete_all(&pxp->termination);
>   }
>   
>   static void pxp_irq_work(struct work_struct *work)
> @@ -111,6 +189,8 @@ static void pxp_irq_work(struct work_struct *work)
>   	if ((events & PXP_TERMINATION_REQUEST) && !xe_pm_runtime_get_if_active(xe))
>   		return;
>   
> +	mutex_lock(&pxp->mutex);
> +
>   	if (events & PXP_TERMINATION_REQUEST) {
>   		events &= ~PXP_TERMINATION_COMPLETE;
>   		pxp_terminate(pxp);
> @@ -119,6 +199,8 @@ static void pxp_irq_work(struct work_struct *work)
>   	if (events & PXP_TERMINATION_COMPLETE)
>   		pxp_terminate_complete(pxp);
>   
> +	mutex_unlock(&pxp->mutex);
> +
>   	if (events & PXP_TERMINATION_REQUEST)
>   		xe_pm_runtime_put(xe);
>   }
> @@ -132,7 +214,7 @@ void xe_pxp_irq_handler(struct xe_device *xe, u16 iir)
>   {
>   	struct xe_pxp *pxp = xe->pxp;
>   
> -	if (!pxp_is_enabled(pxp)) {
> +	if (!xe_pxp_is_enabled(pxp)) {
>   		drm_err(&xe->drm, "PXP irq 0x%x received with PXP disabled!\n", iir);
>   		return;
>   	}
> @@ -229,10 +311,22 @@ int xe_pxp_init(struct xe_device *xe)
>   	if (!pxp)
>   		return -ENOMEM;
>   
> +	INIT_LIST_HEAD(&pxp->queues.list);
> +	spin_lock_init(&pxp->queues.lock);
>   	INIT_WORK(&pxp->irq.work, pxp_irq_work);
>   	pxp->xe = xe;
>   	pxp->gt = gt;
>   
> +	/*
> +	 * we'll use the completion to check if there is a termination pending,
> +	 * so we start it as completed and we reinit it when a termination
> +	 * is triggered.
> +	 */
> +	init_completion(&pxp->termination);
> +	complete_all(&pxp->termination);
> +
> +	mutex_init(&pxp->mutex);
> +
>   	pxp->irq.wq = alloc_ordered_workqueue("pxp-wq", 0);
>   	if (!pxp->irq.wq) {
>   		err = -ENOMEM;
> @@ -259,3 +353,218 @@ int xe_pxp_init(struct xe_device *xe)
>   	drmm_kfree(&xe->drm, pxp);
>   	return err;
>   }
> +
> +static int __pxp_start_arb_session(struct xe_pxp *pxp)
> +{
> +	int ret;
> +	unsigned int fw_ref;
> +
> +	fw_ref = xe_force_wake_get(gt_to_fw(pxp->gt), XE_FW_GT);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FW_GT))
> +		return -EIO;
> +
> +	if (pxp_session_is_in_play(pxp, ARB_SESSION)) {
> +		ret = -EEXIST;
> +		goto out_force_wake;
> +	}
> +
> +	ret = xe_pxp_submit_session_init(&pxp->gsc_res, ARB_SESSION);
> +	if (ret) {
> +		drm_err(&pxp->xe->drm, "Failed to init PXP arb session\n");
Is it not worth printing the value of ret? Same question on the print 
below, too.

John.

> +		goto out_status;
> +	}
> +
> +	ret = pxp_wait_for_session_state(pxp, ARB_SESSION, true);
> +	if (ret) {
> +		drm_err(&pxp->xe->drm, "PXP ARB session failed to go in play\n");
> +		goto out_status;
> +	}
> +
> +	drm_dbg(&pxp->xe->drm, "PXP ARB session is active\n");
> +
> +out_status:
> +	if (!ret)
> +		pxp->status = XE_PXP_ACTIVE;
> +	else
> +		pxp->status = XE_PXP_ERROR;
> +
> +out_force_wake:
> +	xe_force_wake_put(gt_to_fw(pxp->gt), fw_ref);
> +	return ret;
> +}
> +
> +/**
> + * xe_pxp_exec_queue_set_type - Mark a queue as using PXP
> + * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
> + * @q: the queue to mark as using PXP
> + * @type: the type of PXP session this queue will use
> + *
> + * Returns 0 if the selected PXP type is supported, -ENODEV otherwise.
> + */
> +int xe_pxp_exec_queue_set_type(struct xe_pxp *pxp, struct xe_exec_queue *q, u8 type)
> +{
> +	if (!xe_pxp_is_enabled(pxp))
> +		return -ENODEV;
> +
> +	/* we only support HWDRM sessions right now */
> +	xe_assert(pxp->xe, type == DRM_XE_PXP_TYPE_HWDRM);
> +
> +	q->pxp.type = type;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_pxp_exec_queue_add - add a queue to the PXP list
> + * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
> + * @q: the queue to add to the list
> + *
> + * If PXP is enabled and the prerequisites are done, start the PXP ARB
> + * session (if not already running) and add the queue to the PXP list. Note
> + * that the queue must have previously been marked as using PXP with
> + * xe_pxp_exec_queue_set_type.
> + *
> + * Returns 0 if the PXP ARB session is running and the queue is in the list,
> + * -ENODEV if PXP is disabled, -EBUSY if the PXP prerequisites are not done,
> + * other errno value if something goes wrong during the session start.
> + */
> +#define PXP_TERMINATION_TIMEOUT_MS 500
> +int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
> +{
> +	int ret = 0;
> +
> +	if (!xe_pxp_is_enabled(pxp))
> +		return -ENODEV;
> +
> +	/* we only support HWDRM sessions right now */
> +	xe_assert(pxp->xe, q->pxp.type == DRM_XE_PXP_TYPE_HWDRM);
> +
> +	/*
> +	 * Runtime suspend kills PXP, so we need to turn it off while we have
> +	 * active queues that use PXP
> +	 */
> +	xe_pm_runtime_get(pxp->xe);
> +
> +	if (!pxp_prerequisites_done(pxp)) {
> +		ret = -EBUSY;
> +		goto out;
> +	}
> +
> +wait_for_termination:
> +	/*
> +	 * if there is a termination in progress, wait for it.
> +	 * We need to wait outside the lock because the completion is done from
> +	 * within the lock
> +	 */
> +	if (!wait_for_completion_timeout(&pxp->termination,
> +					 msecs_to_jiffies(PXP_TERMINATION_TIMEOUT_MS)))
> +		return -ETIMEDOUT;
> +
> +	mutex_lock(&pxp->mutex);
> +
> +	/*
> +	 * check if a new termination was issued between the above check and
> +	 * grabbing the mutex
> +	 */
> +	if (!completion_done(&pxp->termination)) {
> +		mutex_unlock(&pxp->mutex);
> +		goto wait_for_termination;
> +	}
> +
> +	/* If PXP is not already active, turn it on */
> +	switch (pxp->status) {
> +	case XE_PXP_ERROR:
> +		ret = -EIO;
> +		break;
> +	case XE_PXP_ACTIVE:
> +		break;
> +	case XE_PXP_READY_TO_START:
> +		ret = __pxp_start_arb_session(pxp);
> +		break;
> +	case XE_PXP_NEEDS_TERMINATION:
> +		pxp_terminate(pxp);
> +		mutex_unlock(&pxp->mutex);
> +		goto wait_for_termination;
> +	default:
> +		drm_err(&pxp->xe->drm, "unexpected state during PXP start: %u", pxp->status);
> +		ret = -EIO;
> +		break;
> +	}
> +
> +	/* If everything went ok, add the queue to the list */
> +	if (!ret) {
> +		spin_lock_irq(&pxp->queues.lock);
> +		list_add_tail(&q->pxp.link, &pxp->queues.list);
> +		spin_unlock_irq(&pxp->queues.lock);
> +	}
> +
> +	mutex_unlock(&pxp->mutex);
> +
> +out:
> +	/*
> +	 * in the successful case the PM ref is released from
> +	 * xe_pxp_exec_queue_remove
> +	 */
> +	if (ret)
> +		xe_pm_runtime_put(pxp->xe);
> +
> +	return ret;
> +}
> +
> +/**
> + * xe_pxp_exec_queue_remove - remove a queue from the PXP list
> + * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
> + * @q: the queue to remove from the list
> + *
> + * If PXP is enabled and the exec_queue is in the list, the queue will be
> + * removed from the list and its PM reference will be released. It is safe to
> + * call this function multiple times for the same queue.
> + */
> +void xe_pxp_exec_queue_remove(struct xe_pxp *pxp, struct xe_exec_queue *q)
> +{
> +	bool need_pm_put = false;
> +
> +	if (!xe_pxp_is_enabled(pxp))
> +		return;
> +
> +	spin_lock_irq(&pxp->queues.lock);
> +
> +	if (!list_empty(&q->pxp.link)) {
> +		list_del_init(&q->pxp.link);
> +		need_pm_put = true;
> +	}
> +
> +	q->pxp.type = DRM_XE_PXP_TYPE_NONE;
> +
> +	spin_unlock_irq(&pxp->queues.lock);
> +
> +	if (need_pm_put)
> +		xe_pm_runtime_put(pxp->xe);
> +}
> +
> +static void pxp_invalidate_queues(struct xe_pxp *pxp)
> +{
> +	struct xe_exec_queue *tmp, *q;
> +
> +	spin_lock_irq(&pxp->queues.lock);
> +
> +	/*
> +	 * Removing a queue from the PXP list requires a put of the RPM ref that
> +	 * the queue holds to keep the PXP session alive, which can't be done
> +	 * under spinlock. Since it is safe to kill a queue multiple times, we
> +	 * can leave the invalid queue in the list for now and postpone the
> +	 * removal and associated RPM put to when the queue is destroyed.
> +	 */
> +	list_for_each_entry(tmp, &pxp->queues.list, pxp.link) {
> +		q = xe_exec_queue_get_unless_zero(tmp);
> +
> +		if (!q)
> +			continue;
> +
> +		xe_exec_queue_kill(q);
> +		xe_exec_queue_put(q);
> +	}
> +
> +	spin_unlock_irq(&pxp->queues.lock);
> +}
> +
Blank line at end of file that is causing the 'git am' complaint.

> diff --git a/drivers/gpu/drm/xe/xe_pxp.h b/drivers/gpu/drm/xe/xe_pxp.h
> index 39435c644dcd..2e0ab186072a 100644
> --- a/drivers/gpu/drm/xe/xe_pxp.h
> +++ b/drivers/gpu/drm/xe/xe_pxp.h
> @@ -9,12 +9,17 @@
>   #include <linux/types.h>
>   
>   struct xe_device;
> -
> -#define DRM_XE_PXP_HWDRM_DEFAULT_SESSION 0xF /* TODO: move to uapi */
> +struct xe_exec_queue;
> +struct xe_pxp;
>   
>   bool xe_pxp_is_supported(const struct xe_device *xe);
> +bool xe_pxp_is_enabled(const struct xe_pxp *pxp);
>   
>   int xe_pxp_init(struct xe_device *xe);
>   void xe_pxp_irq_handler(struct xe_device *xe, u16 iir);
>   
> +int xe_pxp_exec_queue_set_type(struct xe_pxp *pxp, struct xe_exec_queue *q, u8 type);
> +int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q);
> +void xe_pxp_exec_queue_remove(struct xe_pxp *pxp, struct xe_exec_queue *q);
> +
>   #endif /* __XE_PXP_H__ */
> diff --git a/drivers/gpu/drm/xe/xe_pxp_types.h b/drivers/gpu/drm/xe/xe_pxp_types.h
> index 40c28f32f51a..db9019dcd78c 100644
> --- a/drivers/gpu/drm/xe/xe_pxp_types.h
> +++ b/drivers/gpu/drm/xe/xe_pxp_types.h
> @@ -6,7 +6,10 @@
>   #ifndef __XE_PXP_TYPES_H__
>   #define __XE_PXP_TYPES_H__
>   
> +#include <linux/completion.h>
>   #include <linux/iosys-map.h>
> +#include <linux/mutex.h>
> +#include <linux/spinlock.h>
>   #include <linux/types.h>
>   #include <linux/workqueue.h>
>   
> @@ -16,6 +19,14 @@ struct xe_device;
>   struct xe_gt;
>   struct xe_vm;
>   
> +enum xe_pxp_status {
> +	XE_PXP_ERROR = -1,
> +	XE_PXP_NEEDS_TERMINATION = 0, /* starting status */
> +	XE_PXP_TERMINATION_IN_PROGRESS,
> +	XE_PXP_READY_TO_START,
> +	XE_PXP_ACTIVE,
> +};
> +
>   /**
>    * struct xe_pxp_gsc_client_resources - resources for GSC submission by a PXP
>    * client. The GSC FW supports multiple GSC client active at the same time.
> @@ -82,6 +93,21 @@ struct xe_pxp {
>   #define PXP_TERMINATION_REQUEST  BIT(0)
>   #define PXP_TERMINATION_COMPLETE BIT(1)
>   	} irq;
> +
> +	/** @mutex: protects the pxp status and the queue list */
> +	struct mutex mutex;
> +	/** @status: the current pxp status */
> +	enum xe_pxp_status status;
> +	/** @termination: completion struct that tracks terminations */
> +	struct completion termination;
> +
> +	/** @queues: management of exec_queues that use PXP */
> +	struct {
> +		/** @queues.lock: spinlock protecting the queue management */
> +		spinlock_t lock;
> +		/** @queues.list: list of exec_queues that use PXP */
> +		struct list_head list;
> +	} queues;
>   };
>   
>   #endif /* __XE_PXP_TYPES_H__ */
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 4a8a4a63e99c..ae6313b8438a 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1087,6 +1087,24 @@ struct drm_xe_vm_bind {
>   /**
>    * struct drm_xe_exec_queue_create - Input of &DRM_IOCTL_XE_EXEC_QUEUE_CREATE
>    *
> + * This ioctl supports setting the following properties via the
> + * %DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY extension, which uses the
> + * generic @drm_xe_ext_set_property struct:
> + *
> + *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY - set the queue priority.
> + *    CAP_SYS_NICE is required to set a value above normal.
> + *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE - set the queue timeslice
> + *    duration in microseconds.
> + *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE - set the type of PXP session
> + *    this queue will be used with. Valid values are listed in enum
> + *    drm_xe_pxp_session_type. %DRM_XE_PXP_TYPE_NONE is the default behavior, so
> + *    there is no need to explicitly set that. When a queue of type
> + *    %DRM_XE_PXP_TYPE_HWDRM is created, the PXP default HWDRM session
> + *    (%XE_PXP_HWDRM_DEFAULT_SESSION) will be started, if isn't already running.
> + *    Given that going into a power-saving state kills PXP HWDRM sessions,
> + *    runtime PM will be blocked while queues of this type are alive.
> + *    All PXP queues will be killed if a PXP invalidation event occurs.
> + *
>    * The example below shows how to use @drm_xe_exec_queue_create to create
>    * a simple exec_queue (no parallel submission) of class
>    * &DRM_XE_ENGINE_CLASS_RENDER.
> @@ -1110,7 +1128,7 @@ struct drm_xe_exec_queue_create {
>   #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
>   #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
>   #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
> -
> +#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE		2
>   	/** @extensions: Pointer to the first extension struct, if any */
>   	__u64 extensions;
>   
> @@ -1713,6 +1731,26 @@ struct drm_xe_oa_stream_info {
>   	__u64 reserved[3];
>   };
>   
> +/**
> + * enum drm_xe_pxp_session_type - Supported PXP session types.
> + *
> + * We currently only support HWDRM sessions, which are used for protected
> + * content that ends up being displayed, but the HW supports multiple types, so
> + * we might extend support in the future.
> + */
> +enum drm_xe_pxp_session_type {
> +	/** @DRM_XE_PXP_TYPE_NONE: PXP not used */
> +	DRM_XE_PXP_TYPE_NONE = 0,
> +	/**
> +	 * @DRM_XE_PXP_TYPE_HWDRM: HWDRM sessions are used for content that ends
> +	 * up on the display.
> +	 */
> +	DRM_XE_PXP_TYPE_HWDRM = 1,
> +};
> +
> +/* ID of the protected content session managed by Xe when PXP is active */
> +#define DRM_XE_PXP_HWDRM_DEFAULT_SESSION 0xf
> +
>   #if defined(__cplusplus)
>   }
>   #endif

