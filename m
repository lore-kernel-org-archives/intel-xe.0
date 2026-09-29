Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 116A9CA5FA7
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 16:52:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1BBA10EFA6;
	Tue, 29 Sep 2026 16:52:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fOBpIzzM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0443B10EFA6
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Sep 2026 16:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790700747; x=1822236747;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=40UR7fxMJYguf0CtUxwqjs9cBdz5FTG2dC6rpKzvPRo=;
 b=fOBpIzzMwsTJCnma6t3AZDb7htz2qv7klnCILo8Cm1YomQ5uV+qt8Z/Y
 VwGneZaki4r91KylbO4wiEmXkcQTnk8NqlIZ1vF/OW7N7fk2pFnRfDMUb
 eNF0oAopoJ1FfrLjo1T6CgROfVHtfFieeEBIYJM1hgSQsYZ5tX+LCB2QL
 iXfKVV6Oxy6kqI0zj+bC1vse+v82aW9jHXl/sdTKBIdxjHmvekm4frOfJ
 Kc8qd6eh5jkDL2G1OlIzYeHzhmFkvs1aDG9RX3rt/PM1KaKZLSNRALuiV
 J/HlsrmX+Douvqvhh0mUqtLPp6N80tLGAbjf84GGzfXLcdyazIrkqTkWC g==;
X-CSE-ConnectionGUID: 3sLqatAhRhu6eoujkdXlgA==
X-CSE-MsgGUID: yw1cWcW9Sw6rT/LZDxYCkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="102801842"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="102801842"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 09:48:29 -0700
X-CSE-ConnectionGUID: awXG2cELTsmJHjAVdpJ1mw==
X-CSE-MsgGUID: +I+9LhW2SsWSZmtOSDK/Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="271908969"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 09:48:29 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 09:48:28 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 29 Sep 2026 09:48:28 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.57) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 09:48:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DMNDo2odcAgEGq+PLfjU0nMDalhqHd9ax0B3XVHOCdGQY7rMxtVgl1u6dU6fSKJbu3cBhGHdnMS6TRLVRDo2vlHVEET+59rMO2btrWZCwOmydMaBk0VfkU3LYHE+Ui7B7ibzUg66+hNAoGjRvHzYHIKN+Kv2WnDxXu8GJ8zpLg/D33q2ZrHi1GKwxrb9iCi6nsyGwOCXj87L9XNUCjulJFMeF3eJG7J9Na73RwqGYoLrMj0NjSUt4Xf4EO14iOYuiILd99W+s1ZH362zYaSoLZQ5ZnjGIIltIfYo53y79sEezJDL8enFN0OYyWL97emd4GDvcIxXVcKNI/LuYZCTkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hKxXso3DG874b+HaaIWe3MQB4fPfb+xy+OikkUL8FcU=;
 b=w9PXM943jfUJpqKvrdLrdOZLTHs3QtZWAaGAFxqOKsikoWP36yr81HR8cDj5tOaIN2SIvQHxdURC0LGN3+2J5FuSdbjqFzGhS4bjA2HRZtd8rymR5E9Vbub+oGAElSb+c6lS7EwZA9S1qXJ10NFEzrNJvLO9Q9L09A2gYGhMKyh9qkonjP/trZzMdZ5H5e3Nn3gFs+CGjBqhsgbQImza3B35s7oV7nJGRKygJT5dgVlgXO3XaL2sesNIiJWRcSme03F4LOKP6XNtsZcYtmg4vdDbcAXobuKrkTW+AtQf1x9X8PUSqw9cbzYdhidH3gKlzlkCSmkRc15iC5e+nCvbGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by IA0PR11MB8397.namprd11.prod.outlook.com (2603:10b6:208:48b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 16:48:23 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%6]) with mapi id 15.21.0451.024; Tue, 29 Sep 2026
 16:48:23 +0000
Message-ID: <f9fbd2b5-1290-4a3e-a439-96cf8c124bc0@intel.com>
Date: Tue, 29 Sep 2026 22:18:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/13] drm/xe/hwmon: Add helpers to validate thermal
 sensor readings
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
References: <20260924205429.2846256-1-karthik.poosa@intel.com>
 <20260924205429.2846256-5-karthik.poosa@intel.com>
 <arrCNETSdIpLzF-n@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <arrCNETSdIpLzF-n@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0065.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::9) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|IA0PR11MB8397:EE_
X-MS-Office365-Filtering-Correlation-Id: 86381208-ef3d-4e87-4d09-08df1e497938
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|4143699003|22082099003|18002099003|3023799007|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: FMOx1kgAujKJ954D6vpb4kNlrzU2DHOIeSF2hS46w+vTMQDKvV6RgNmuBxsQ8t/0QLxbB++HOGEA90MCLSh1InomT9Ig9pX6ACGvL2YACPYw19JJ9x+Z/mhx5fa4yOlYLF9lRqnEJtRWnDxSVkbxfvPA8q/MUMppb6itMUBfmW/h+TDTptcVcOvPLx4t4uy0dYnC8r70hMHtXbysZIOdMTrKIqFapuoUfIkOAUev3fEtKOCysHblskM54XRQ/6fEIqJ5j+CSwtBvP8Y2RD3pQW9gUSDrByjrqHs6huBgC+kCtD4CNtul9S+fcvfuUwpNy5AmsX5AgMxtQam5mrHrEYil4u6jBTqGopO6DK3G/bwQf17c/2ZOHr/jJcQgUqoLK8E3eivhdhz2vPB80MgTap5e0HkWd5p9PUnD6hnGh5cgtx6+rTb2WvHd8+xdiPkoDF53n9xi4zKrMBC4uvc/QZaI6ng3hlIF8sTljKoo5kQpirnnroF5/DH3cnls20KXfSPd2kVSWSwy61GFFRDtqz6ljlX8PoNvNstBxTrvdX1VfQcF3a4F6ik1VfYTxfsNV7Rw5EsJbiCNAZmIq2TnzjfI6YJc9LL6aljc6qHJyuAIwINBtlNh7zG9zcQWuWwAE8+ZZ5QW9YRBqktz9bVeNpkCKItLkZLudzGkdsvlmPY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(4143699003)(22082099003)(18002099003)(3023799007)(10067099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmhkK01QdVRTVzZwVWI1TUkrak9UZG1FQTVzMlpLYVcreStIellOblQxalJ0?=
 =?utf-8?B?ZjN4L2RUc0pvdjR5N0tvNmt3WURkeDBTTVFjODJ4bTVicmU3NXMvWTV6MGRs?=
 =?utf-8?B?eDkwbE04L3A5Wi9lNzAvdFEwS2NRTFlIVmptNTgvUFliTDhwMVVRMjBHQjQz?=
 =?utf-8?B?WnVSM2hVNkIzdFhTNHEvdk5KUVloOGpobXRjeDYyNThIOUd3Rlc4cm82Z3V0?=
 =?utf-8?B?dDZSNVFoT0FkMzRSSFhHUU9URHMrNXRIU2NMMlp2aWlWU2VaR0JoRXhIcVVC?=
 =?utf-8?B?azRDN1VKVDBrTkpNbXBOZWk5OERGdFY1ZjVqZjA2SVdwdzE0RkRCOXZSaGpY?=
 =?utf-8?B?azFUVHJNM1hwZVUzQUEyVEcrVVEyTEVuaTBTTlVtUzBVL0lKYzFVa2o3eWJT?=
 =?utf-8?B?Njh6YXRDWklpYlZxV2F0SkZxT2p2ZHJEOHJwNW0wRjNlTDEvdHYrV2FGSnZK?=
 =?utf-8?B?dDA3Mll4VUNNaUNWbHBxSVhIdThQcmpSalFzcGxqZG1USWpNZ21EZzNieVVx?=
 =?utf-8?B?Vklvalk3c1p4VjJXQW1Dd3hXSFhWRTZ0bFVuMEFCVjVieTFNRzFpM0kyTHgx?=
 =?utf-8?B?K05TTkt3aUhLN0xlRmlrWVpQWlNQSVRLb0l0NHhqYUtPNWM5WnZSY0JJbnl4?=
 =?utf-8?B?Z0MydzdpWm1CeEFRcjNheWk0K2ttdGlmelhSSTFQckhCTk1hUHNyNnRtQ0Fq?=
 =?utf-8?B?SkdRNEhyMFlJdUNrQURKb3BMSnk3VnFPNURmeFJmTDBHRitrZ0pHbmZZRzZR?=
 =?utf-8?B?UW90TnFERnlSZFVMaDNCbjF0bzFBYnY4M09odU5aSXgyRWZOUjVFMXpicnU4?=
 =?utf-8?B?bUVzS1I1RTlFUEoxZVVPaHdLTmNRV0pLQXI0WDBSaUg2dC9FK1QvQ2tlNFpM?=
 =?utf-8?B?MW51K2JEVWcxV3hGWVpXTXZkTjZxdUJuQUtIWXUxL3hyemJHUC9VZG9rdVJ5?=
 =?utf-8?B?T3FpakIwYkZ4ZEg2aGlxYjk2MUdmTU1mVVNHdHg2RGpqWTNqbzNxNXdxeUZ3?=
 =?utf-8?B?ZWgwQUNGRzlOSTVEbEtZR1pjSE1RNXRLRDZyKzN3MU5JUkFFb0FydVVNdTlw?=
 =?utf-8?B?MkRJbjN4S21pdjl0cmxBcmhyS0xKSERhS2VnOXM0ZUh4TUtSWE9XdDhWd0pI?=
 =?utf-8?B?Q3dSNmR3VStUblFadm15dXJkcEFlV1ZIbTJwcjBleWNkOXpVMFZOcmFxVy8v?=
 =?utf-8?B?MlNtQ0NQdFVEaFVXazlVRjZJam9LY1RuNXVNeisreEtjNUpvWERFZlMyTXBj?=
 =?utf-8?B?bVhrZUQ1MkFMRlNWVmVBSnJlNjlLUzJzQlVJSHhHdlFqeDI0Sk9Sd1NzMU1Y?=
 =?utf-8?B?RURKOFMycTFvUWw0dGtPVENJOHUrTTIxRFEzaHprLzZidWdxQm9xblNkUDZY?=
 =?utf-8?B?aldwMEhQKzMrM0toUWZYY1l6YTNqN2tvc0ZKdUFyUWR4UENyUktrU0s5MjR5?=
 =?utf-8?B?Vlg3S2ZuSTNEZjA4ek9kQlJyOWg2OEZ1bzlMdG1EY2tXTzN0V0hQUU1qeHRp?=
 =?utf-8?B?dlNidSt4MW9XMUZUc0JDcjFQRUxQY21yaG52TkhrZzF3a1VmdTBDd0M4UWFL?=
 =?utf-8?B?OEtvOVZhL1V3ejJEUUdQRDdpL29FRnFSMDlEOEZmS0F2TG5BdHM2aUJwV2Zv?=
 =?utf-8?B?MHZGOVZzRTN0dUpoSnVndFlxTEtIRGJiV1REOFN1RlpXZjI3dnE4bWpIMlhn?=
 =?utf-8?B?TXFuOWRRSXNWTkJyTkxFMDdETFZPT2tOanI2Q2xOcVlkOEh5N2x3Sk90V29p?=
 =?utf-8?B?NFd5bmRqNWtXcFdId3Z6a0VSZysxTmY0VHNkYVExMXFzU09NRU5NVWxGYVFD?=
 =?utf-8?B?MEY4Rlc4SFpnczN0cEZBUzhVUHFQUi9oRTUvTGFxUTI3QThYWGMwN2pIT3hB?=
 =?utf-8?B?N3NaeThxYTlYREVQTUcxUVpvQUkrQVIrWmN1by82QlVnYkNqUURZUUJKWXYx?=
 =?utf-8?B?U2lBQ1lWT3pCU3UzOXBBY29jU3FQSmVLcnc0Y3JnTHpwRHJFNkorbVZPTDh0?=
 =?utf-8?B?ejEwaDVxcHRud0hhd2xRVFFBbW1Sc1JmRkh5U1YrNXBydS9KcmNVL1A4VmR5?=
 =?utf-8?B?MUVQS2NzcE1sU2pKaFgxQm9BT2RtUU1wRVZaR3FiT0ljanhzWnVJK2NVT0tw?=
 =?utf-8?B?TXlIcmMzTVUxYmd1Sk85TnIvYWQzU09XOE0yblNkM1d0SUhac2VLWi9DSUdO?=
 =?utf-8?B?U3NUY2cvZE1LZ2xkV3VqNFRsaEhXek9pZUpoTk1wTFJsSkVKWkZmdW15cVJD?=
 =?utf-8?B?U2Y2MExEU3BSU0xET2pWcjZaZ3FDaE9sZ25NRE9KTnNKKzBRT2tqbE0xZUxH?=
 =?utf-8?B?Y0RUOWhZSStWdSt1RlZRSTZ1M0czR0c3bUVGbkZEcEFnamFDMFZzUT09?=
X-Exchange-RoutingPolicyChecked: ZT0LP37G23HwpIc3MwZN/w+U3n+91JF3NfSGIZt/6dwzLb6Ogl8kD81QPs6XrZV9PLkMCbYj+i2rqy+ZaDCpEZhFtCri2OZYb3UDwrTuSyk0A19alxjZFxvnZNJ99jLnOM2JGtwDLVCjWfgcsPHx7BG0ql6bzieB2AXHCFSaduR9enuJ3a4X8IJMillgbzX7SnilrRMHjuYtRrv3UaJVF5iCggw7KLBg3pVtV6RrQkKoDkLfAO8Hr4wW/YRyQ6TGMNsvR5z5zlkRDImNWxsQR5BN56Fj3nVWyaYTequpXsk7qingJoB+hY4Jgd5FfbKVQyZ/9cxsyUs6LjGoHSjA6A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 86381208-ef3d-4e87-4d09-08df1e497938
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 16:48:22.9004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JRp2uHOvjDB2PgynP1fJzMNDLpT+aFA/dAkDk0A0MtvoYTj8tXPFv97VaO3xmxZC/M783x7KvO8f97O5jZbYDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8397
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


On 29-09-2026 01:08, Rodrigo Vivi wrote:
> On Fri, Sep 25, 2026 at 02:24:20AM +0530, Karthik Poosa wrote:
>> Add mmio_temp_valid() and mbx_temp_valid() to check whether a temperature
>> sensor reading is valid. An MMIO value of 0xFFFFFFFF or a mailbox value of
>> 0xFF indicates the sensor is unavailable.
>>
>> Gate these checks behind has_mbx_temp_sentinel, enabled on CRI currently.
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device_types.h |  2 ++
>>   drivers/gpu/drm/xe/xe_hwmon.c        | 16 ++++++++++++++++
>>   drivers/gpu/drm/xe/xe_pci.c          |  2 ++
>>   drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
>>   4 files changed, 21 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 4661bfce2f4e..87554605fa41 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -202,6 +202,8 @@ struct xe_device {
>>   		 * pcode mailbox commands.
>>   		 */
>>   		u8 has_mbx_power_limits:1;
>> +		/** @info.has_mbx_temp_sentinel: Device has temperature-unavailable sentinels */
>> +		u8 has_mbx_temp_sentinel:1;
>>   		/** @info.has_mbx_thermal_info: Device supports thermal mailbox commands */
>>   		u8 has_mbx_thermal_info:1;
>>   		/** @info.has_mem_copy_instr: Device supports MEM_COPY instruction */
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index c743867a2ebf..8a1dbe708828 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -104,6 +104,9 @@ enum sensor_attr_power {
>>   /* Index of memory controller in READ_THERMAL_DATA output */
>>   #define TEMP_INDEX_MCTRL	2
>>   
>> +/* Mailbox sentinel reported for an unavailable temperature sensor */
>> +#define TEMP_MBX_INVALID	0xFF
>> +
>>   /* Mailbox temperature is sign-magnitude: bit 7 sign, bits 6:0 magnitude. */
>>   #define TEMP_MBX_SIGN		BIT(7)
>>   #define TEMP_MBX_MAG		GENMASK(6, 0)
>> @@ -822,6 +825,19 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
>>   	return ret;
>>   }
>>   
>> +static inline bool mmio_temp_valid(const struct xe_hwmon *hwmon, u32 value)
>> +{
>> +	return hwmon->xe->info.has_mbx_temp_sentinel ? value != U32_MAX
>> +						     : value != 0;
>> +}
>> +
>> +/* Mailbox temperature is sign-magnitude (bit 7 sign, bits 6:0 magnitude). */
>> +static inline bool mbx_temp_valid(const struct xe_hwmon *hwmon, u8 value)
>> +{
>> +	return hwmon->xe->info.has_mbx_temp_sentinel ? value != TEMP_MBX_INVALID
>> +						     : value != 0;
>> +}
> When reviewing the patch 7, I noticed a small change that took me back to the
> temp valid...
>
> What if temperature is 0 ?!
> Why isn't it valid?
This can happen on pre-CRI platforms (.has_mbx_temp_sentinel!=true), 
where temperature sentinel is not supported.
In that case, we shall return true here on those platforms.
>
>> +
>>   /* Decode an 8-bit sign-magnitude mailbox temperature to degrees Celsius. */
>>   static int mbx_temp_decode(u8 value)
>>   {
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index d66d5a0339ae..e656fc012902 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -476,6 +476,7 @@ static const struct xe_device_desc cri_desc = {
>>   	.has_gsc_nvm = 1,
>>   	.has_i2c = true,
>>   	.has_mbx_power_limits = true,
>> +	.has_mbx_temp_sentinel = true,
>>   	.has_mbx_thermal_info = true,
>>   	.has_mert = true,
>>   	.has_pre_prod_wa = 1,
>> @@ -796,6 +797,7 @@ static int xe_info_init_early(struct xe_device *xe,
>>   	/* runtime fusing may force flat_ccs to disabled later */
>>   	xe->info.has_flat_ccs = desc->has_flat_ccs;
>>   	xe->info.has_mbx_power_limits = desc->has_mbx_power_limits;
>> +	xe->info.has_mbx_temp_sentinel = desc->has_mbx_temp_sentinel;
>>   	xe->info.has_mbx_thermal_info = desc->has_mbx_thermal_info;
>>   	xe->info.has_gsc_nvm = desc->has_gsc_nvm;
>>   	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
>> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
>> index fed509ff601e..0041ec5676d3 100644
>> --- a/drivers/gpu/drm/xe/xe_pci_types.h
>> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
>> @@ -50,6 +50,7 @@ struct xe_device_desc {
>>   	u8 has_late_bind:1;
>>   	u8 has_llc:1;
>>   	u8 has_mbx_power_limits:1;
>> +	u8 has_mbx_temp_sentinel:1;
>>   	u8 has_mbx_thermal_info:1;
>>   	u8 has_mert:1;
>>   	u8 has_pre_prod_wa:1;
>> -- 
>> 2.25.1
>>
