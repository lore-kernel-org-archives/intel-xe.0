Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E23BD58E4C
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 09:35:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E475410E209;
	Mon,  2 Mar 2026 09:35:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OpGFzlI2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE4B110E209
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Mar 2026 09:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772444149; x=1803980149;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vnJq96jlQzQz9AF0A2jT2uLk2SlPreRABJqEx+un1TQ=;
 b=OpGFzlI2DJ8RH215/Pux0pkNn9+LWwMAJOcomFBGTlGUSwvOCPVclmAO
 /NtW9rxmoTv0NApVOIMcaIecP8I1hhGSatS+N/1PLtmhGLsHFmroNarog
 uvIIkjYNdFTeOV/+ULB+QUzqeP4ID5YBNjLsYSkWUXNtgy+ErSWUjAH7/
 UcVmAwYDTUxEWxbVm89vFeUkFToo6YVRhSoiILv48sAqlXHNU8Vba5jh0
 q9haOhQXE0mp5zDnmUylt53MSA1Ac+ZRSrOLDXpPKdBelBTy5cWSdbuYi
 FJyxDJs7IodO7c00W6Q2rOLplin6sAYYmteOhfe/5t86/GTu6HnBmHf0w Q==;
X-CSE-ConnectionGUID: dlPifCJrQUaWCbILnl76OQ==
X-CSE-MsgGUID: 41jGCIaXSTW6FxMNJWRYUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="72473963"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="72473963"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 01:35:48 -0800
X-CSE-ConnectionGUID: iLHP1MAvQnO1u0RL8E74Pg==
X-CSE-MsgGUID: ihK+NXGeRyiY2FSw6KRBhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="220681506"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 01:35:49 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 01:35:48 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 2 Mar 2026 01:35:48 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.51) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 01:35:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vZZmXUSJ7mBh/UnkOouXdZRG4Ay+W5oR2EtgxBKrLVpZ0c02Hgn5tOqLsZ8kDpNAjoPn/AsNIQ5PtjMFkC3CuT+ZdqtQ3V6yozydnc9oaLB2MnjMrA/mCKplfEGwgCyjLK61hmg8u2cu8MbD4zMB9iQ9wvbmYDQkjnQoIpCnbKdaFVEahF8VPEaVG0/jWZ8O3sKSnJPoiD74IiidZpNwDhByGsBpkQnn26btSeyXXsaN142x+hV0dx8sp/aJj4nRBvBsbQ/lKck1Rpxq5aGFnPFftdQ760dkAiYyOb3iLX0akYI99OwRluBJnO8j0/mNgl9uvBTbPP/VL8PXqYdgjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2N2uaxIQB2vDfFWnGo02+wvhWuQvFZ+WXD/woBnKDzk=;
 b=ucfQ6PZAvFnd6pnSypY/f/01KNX7j3vzeI8PMBQfAv9xBHum7QIqtWfNvF5E2fnHWt8iPedHECoN3psN4ujJrvBD9gKLqf4MHpl5t0QYIe+iBV2kIhBt1ufwK2AmwspowVOO2HtwXB/FzqbiACh6Lcl5DT4zowlaJIKwnL7YNOtS7bGhUUBF+/uvJMIjaBBmMC/64DoIUVwRIgGcM6FlCG04X/uVCVDlD45bDqGGE+p6D7g4vWBkZDK9hxSzfbKKsbuhfXr77/uvxqapYgtDnlNgrfq8nkh6HnEwXj9f8yCzlz2TZ40ASVtC8i9VvKLwt3X6UQw3oTELS9mwrIM9EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB7556.namprd11.prod.outlook.com (2603:10b6:806:31f::21)
 by SA1PR11MB5921.namprd11.prod.outlook.com (2603:10b6:806:22a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Mon, 2 Mar
 2026 09:35:43 +0000
Received: from SA3PR11MB7556.namprd11.prod.outlook.com
 ([fe80::3b95:cfb:be21:788c]) by SA3PR11MB7556.namprd11.prod.outlook.com
 ([fe80::3b95:cfb:be21:788c%3]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 09:35:43 +0000
Message-ID: <5ffd98cb-9c41-4907-8855-384f20a8e27a@intel.com>
Date: Mon, 2 Mar 2026 15:05:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/6] drm/xe/sysctrl: Add System Controller types and
 structures
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Nilawar,
 Badal" <badal.nilawar@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>, "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>, "Ruhl, Michael J"
 <michael.j.ruhl@intel.com>, "Luse, Paul E" <paul.e.luse@intel.com>, "V,
 Mohamed Mansoor" <mohamed.mansoor.v@intel.com>, "Nasim, Kam"
 <kam.nasim@intel.com>
References: <20260128081403.3138456-8-anoop.c.vijay@intel.com>
 <20260128081403.3138456-10-anoop.c.vijay@intel.com>
 <DM4PR11MB54567ADA9436AC7380EFA6DEEA91A@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Language: en-US
From: Anoop Vijay <anoop.c.vijay@intel.com>
Organization: Intel
In-Reply-To: <DM4PR11MB54567ADA9436AC7380EFA6DEEA91A@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0112.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::15) To SA3PR11MB7556.namprd11.prod.outlook.com
 (2603:10b6:806:31f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB7556:EE_|SA1PR11MB5921:EE_
X-MS-Office365-Filtering-Correlation-Id: d82c3a90-c469-49e6-1189-08de783f12ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: z++Oy1K6lES6T0sBYCdCGGmRYBsGFaxtt2wTRnhsci3kSe5vfRTXYWWEp4G6viy5ij1jNleRq8X2rrAnV8xoLfnmFfV4A9lSV9BLyPgev+qcqzl8xtbxQJvocLTkRFzDtPvVf3nrcpj0M5WkKM23MnG+LPm5wRv8KlMhvDUSQ2HFUS9d10/aXhDauABH2Psrc4CSu42jR1TeleND4w9pNkD0H7XWnrsFCNXdGtOYXu835z4PY5Ui75hb9qFqQ00KBTVpBcEoGHI9btwizqQXiM1LQuxo5b+pD5g94s7g76AhsdaooLiZIZAP0y+LntUYg4u0CAyHx/kEA80+xap02szGf147ev5zBk8paiXscjwFt9Q4bm6PLwYUKg7l3kDw8oB6umSai6PZjYhrE/Tcdo1XyLzKt1hTl8RybFjv8CH7hfGwH4xRfjBLAEv1wJWKbZ6k+o9CJn0WqPMXp5tCc5vC92or8q7cgwW8lx81pbMT5vlJlqPAQC5hcngteHHFjpmERzkRbrIPbbtT8uGoPhLWD1gCKc1p1xIqV94OJoHbM8a15SKyt99sQydkazVH9hO13zcdd1718vCVlvtmFLlSH00IRkbLeF++mVDALFdqWYmF9kfMKxqOMGT7KkCq55Mw52Pv0iBKK+q8Kc4HJxQlXoG+BB0YEv5dPjfDyF+ksxAzVRaRY6J2Aspla948
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB7556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzhWSVBnT0hZeER2MHI0TkJmSTNNMTlvOE1NekNyY1NadWxLV1RLVU93OUM4?=
 =?utf-8?B?cXF3SHdpSUMycGNGUGRFU2tyWnUvemIyaDlCN05VMzFrN0RUbnhqcy9oUW4x?=
 =?utf-8?B?U3hwY0tRUWJXNUhrMERhSTl4ZUgwY1dwUnFYZDQ0b1g5WkdXekVpeklRRlpx?=
 =?utf-8?B?azlkTzdNOG1OUm5ydHJPSDBFTjZlQ1dsR3JxWTh1U0VIc3RKWVVIdXl6QUFB?=
 =?utf-8?B?eWYxTHdhTzVhMmJNTDZ0TGR6S3JKUmZUMjR0dGVEYXdJcEF1Qkx5UUpkR052?=
 =?utf-8?B?bmpnWEFGS3dzb2kvQTZUSVR1QzhpNTNsazNMVWZPMERKcDYrTDdWUW84blVL?=
 =?utf-8?B?SXkzNm10T3poWVNKcVg2cjlsMmRaNjNKemYvcWUwYU95SnNGbE1GOXgwZm93?=
 =?utf-8?B?UkVEUVV3aDBaOXJnWHljQUQxSHRoQ1VwMHJ0MzBabmFmNGs5MlovcUV5MHlU?=
 =?utf-8?B?c0JOeGhkNkZlUERnUnYyL0FVWTk2VHB6bGdwbWtwQjIzZW1ObDNRR29Rb1dU?=
 =?utf-8?B?dnNTTFMwNnpuems2NG9DTTNDdlV3R2xwUU9RRkFuYU1BRmxmL2dUMGV6ZlRS?=
 =?utf-8?B?WjE4YzFscHlSSkpUMnlVNGlpVVRXVktGSVlVdjJENEFtcmEwMnQ5cVJjMHFK?=
 =?utf-8?B?SnJVMDFtbE1lZTVYaUtjY0tFdEpTWUJ4ZVNWWlpYWmpLY1lNUGdVWFZrR01R?=
 =?utf-8?B?UkFWckszNlhuUlJOZktjNFZTVXU4ODNGMzZmM3BlczdLTWlCd3Qxa0NXMVhY?=
 =?utf-8?B?SXZ2YW9tUHNmdkRiKytWVUYvV1EvTTZoTzNWUUlpSDNnUUZ4eWVBcEhMY2RM?=
 =?utf-8?B?Z3ljQ2hzQ25IajhQd3hmS0c0SVlpaHNsMlk0ODhhWlZMUlNjS2VVNTJWcXVq?=
 =?utf-8?B?c0tHT3FBT1lpczdDZkxaNHpVejlJNDM3cXlqdjNBNEMwYklSSEV5bmJUSjJ4?=
 =?utf-8?B?YmdWVng5bmlHd3NCVDlEcm9pQzhWaW9KZGxmSWxnMEJPQjRSdTVyN2RLSVFh?=
 =?utf-8?B?bzZ5V1RFeGd2empNWjljdnFtUTVrT3pJc0ZYaGh5d3RIVVdDZDgybDZTM1VB?=
 =?utf-8?B?TVYycXdBbzA3aWxGZGRrUnpqM1FFMmVkajJlVHZJeWN1SHdCYmgxRDBBcGwr?=
 =?utf-8?B?QytXSkl4M0s0SGVZVmp1Z01ZR1pnWWtrZFhBQXlsTXh5TUFhWGJzNHg3ZDla?=
 =?utf-8?B?UXJHL0pmQkRpRFl3bG1TQ1IrVkZmRDZhYVBrSWlWU203NSsxT25vWkUzSk1a?=
 =?utf-8?B?MUdnUlJyYWVscWd4WUVrZmhEM2xWeUxNaFpDYmxpMitXaHNCQWozMUVORGo3?=
 =?utf-8?B?Nk1jZk5pWkxQTVY0dktFNUNWTlZJUGx2WnFvcW1aMHNKM0J1SThjMHBpOEM5?=
 =?utf-8?B?Z0RrN1FITmhuSTVLTVFNZkcrNllxVjdudmRlOFM1dDcrRnVXSHk1elpYUHNG?=
 =?utf-8?B?amo2VEtJN2oyMktHRmlzQnZyR2cyVVNjSXBZZ1hXN1REaUxMbHBmYnNGZFhO?=
 =?utf-8?B?ckhLN1FnOEUvRXFZRVBFK0ZiK1lNWTZoTWRrdVVBaDdYcEVaQ09qSWJtSE9T?=
 =?utf-8?B?UnRwcmxWeTJaNnEwZkszclJyWCtFc0dZOFQ0bi93RE1DZkFhVjNIZ21DSS9C?=
 =?utf-8?B?Vk52dUpxWEx0V1EyTldLOGs5Vk9RYUlmSEw0eGtkN2dPY2ZOZnFQbDhTUE0x?=
 =?utf-8?B?RzhOeVBoTm1Wb3pVZ2RuYk5hRnBuODFuVXp3M3c2Wi8rSVBLR3FmKzdiMm9u?=
 =?utf-8?B?NS9yS1NIZVBnd1BiSFFwUjBBU2FESEVDVmQ0RGJXem12elFOL1ZuZGhCdTc2?=
 =?utf-8?B?QkZyUkRHNTJqaS8ybzM5L05WNkRMcDZlOG8rRG9PZVVsMEdlUzFtY0ZOYzlY?=
 =?utf-8?B?ODF6M0VvN0VOR1lDc2hCMFdZbTRKK0M5dS9kRnFFajN6THJaY2hTTHVOd3Rv?=
 =?utf-8?B?ZmY0TjlVMHRXMGJESVVhc3ZlVDZVT1JNRW5mVExJY1g1bzcrcGs5a1B1YzB2?=
 =?utf-8?B?enNwYWJ3eFBPQmpneWdGNjYwQ2Erc1Nadjd2eGJ0NCtZNVFQbmtYTng3ei9B?=
 =?utf-8?B?SW4wbTlFendMTVA0dW9SbU9LN0xNaWVZTkZEWjlyMlU2ZHVRSEQ4c3M1TUtL?=
 =?utf-8?B?VUxySzdDZkNOMGNXSnpUblk0SjdJcmRWRUFGY0JSRzZjSHROeTRZOFBuR24z?=
 =?utf-8?B?VWtYSkV2RjhxRUEzTlNDYjQ3NFBTd29xdzhNWFNqa0REUFpBSHZmNjc1TlVP?=
 =?utf-8?B?a01VZW54TGtuTExLKzZMZ1JpU2xzQXg0aEx0SVFiUkNVVEZVZDR5VTExZHNa?=
 =?utf-8?B?cTRCT3RJdzhxMGZDNDJaWmE4OVArRGhTTHE2WjFaTDZ1ZGlSdTVNbUhuTDQr?=
 =?utf-8?Q?NhnTfN2TDBTn2Koc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d82c3a90-c469-49e6-1189-08de783f12ce
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB7556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 09:35:43.0701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JZ0Blw/v8eAbYytDoxto+VmTlQLMBXQzDwiWC1Wohd40UuIks5UHBLrdIlomXMxph6JKT/FmHzKOcvw1x+gfyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5921
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


On 1/29/2026 3:55 AM, Lin, Shuicheng wrote:
> On Wed, Jan 28, 2026 12:14 AM Anoop Vijay wrote:
>> From: Anoop Vijay <anoop.c.vijay@intel.com>
>>
>> Add type definitions and header declarations for System Controller mailbox
>> communication protocol.
>>
>> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
>> ---
>> v4: (Matt, Mike)
>> - Add domain-specific MMIO accessor
>> - Change phase_bit type from u32 to bool
>>
>> v6: (Matt)
>> - Add mailbox protocol constants
>> ---
>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox.h       | 35 ++++++++++++++++
>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 42
>> +++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_sysctrl_types.h         | 33 +++++++++++++++
>>   3 files changed, 110 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>>   create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>>   create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_types.h
>>
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>> new file mode 100644
>> index 000000000000..2b64165c8e76
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>> @@ -0,0 +1,35 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef __XE_SYSCTRL_MAILBOX_H__
>> +#define __XE_SYSCTRL_MAILBOX_H__
>> +
>> +#include <linux/bitfield.h>
>> +#include <linux/types.h>
>> +
>> +struct xe_sysctrl;
>> +struct xe_device;
>> +struct xe_sysctrl_mailbox_command;
>> +
>> +#define APP_HDR_GROUP_ID_MASK			GENMASK(7, 0)
>> +#define APP_HDR_COMMAND_MASK			GENMASK(15, 8)
>> +#define APP_HDR_VERSION_MASK			GENMASK(23, 16)
>> +#define APP_HDR_RESERVED_MASK			GENMASK(31, 24)
>> +
>> +#define XE_SYSCTRL_APP_HDR_GROUP_ID(hdr) \
>> +	FIELD_GET(APP_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
>> +
>> +#define XE_SYSCTRL_APP_HDR_COMMAND(hdr) \
>> +	FIELD_GET(APP_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
>> +
>> +#define XE_SYSCTRL_APP_HDR_VERSION(hdr) \
>> +	FIELD_GET(APP_HDR_VERSION_MASK, le32_to_cpu((hdr)->data))
>> +
>> +void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc); int
>> +xe_sysctrl_send_command(struct xe_device *xe,
>> +			    struct xe_sysctrl_mailbox_command *cmd,
>> +			    size_t *rdata_len);
> 
> I don't see this function is called in the series. May I know when and where this function will be used?
> Thanks.
> 
> Shuicheng

xe_sysctrl_send_command() function is introduced here as part of mailbox 
interface, it is called in other patch series build on top of this one, 
such as:

https://patchwork.freedesktop.org/series/160482/
https://patchwork.freedesktop.org/series/160184/
https://patchwork.freedesktop.org/series/161655/

Thanks,
Anoop

> 
>> +
>> +#endif /* __XE_SYSCTRL_MAILBOX_H__ */
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> new file mode 100644
>> index 000000000000..ce10924c5881
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> @@ -0,0 +1,42 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef __XE_SYSCTRL_MAILBOX_TYPES_H__
>> +#define __XE_SYSCTRL_MAILBOX_TYPES_H__
>> +
>> +#include <linux/types.h>
>> +
>> +struct xe_sysctrl_mailbox_mkhi_msg_hdr {
>> +	__le32 data;
>> +} __packed;
>> +
>> +struct xe_sysctrl_mailbox_app_msg_hdr {
>> +	__le32 data;
>> +} __packed;
>> +
>> +struct xe_sysctrl_mailbox_command {
>> +	/** @header: Application message header containing command
>> information */
>> +	struct xe_sysctrl_mailbox_app_msg_hdr header;
>> +
>> +	/** @data_in: Pointer to input payload data (can be NULL if no input
>> data) */
>> +	void *data_in;
>> +
>> +	/** @data_in_len: Size of input payload in bytes (0 if no input data) */
>> +	size_t data_in_len;
>> +
>> +	/** @data_out: Pointer to output buffer for response data (can be
>> NULL if no response) */
>> +	void *data_out;
>> +
>> +	/** @data_out_len: Size of output buffer in bytes (0 if no response
>> expected) */
>> +	size_t data_out_len;
>> +};
>> +
>> +#define SYSCTRL_MB_FRAME_SIZE			16
>> +#define SYSCTRL_MB_MAX_FRAMES			64
>> +#define SYSCTRL_MB_MAX_MESSAGE_SIZE
>> 	(SYSCTRL_MB_FRAME_SIZE * SYSCTRL_MB_MAX_FRAMES)
>> +
>> +#define SYSCTRL_MB_DEFAULT_TIMEOUT_MS		500
>> +
>> +#endif /* __XE_SYSCTRL_MAILBOX_TYPES_H__ */
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h
>> b/drivers/gpu/drm/xe/xe_sysctrl_types.h
>> new file mode 100644
>> index 000000000000..d4a362564925
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
>> @@ -0,0 +1,33 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_SYSCTRL_TYPES_H_
>> +#define _XE_SYSCTRL_TYPES_H_
>> +
>> +#include <linux/mutex.h>
>> +#include <linux/types.h>
>> +
>> +struct xe_mmio;
>> +
>> +/**
>> + * struct xe_sysctrl - System Controller driver context  */ struct
>> +xe_sysctrl {
>> +	/** @mmio: MMIO region for system control registers */
>> +	struct xe_mmio *mmio;
>> +
>> +	/** @cmd_lock: Mutex protecting mailbox command operations */
>> +	struct mutex cmd_lock;
>> +
>> +	/**
>> +	 * @phase_bit: MKHI message boundary phase toggle bit
>> +	 *
>> +	 * Phase bit alternates between 0 and 1 for consecutive
>> +	 * messages to help distinguish message boundaries.
>> +	 */
>> +	bool phase_bit;
>> +};
>> +
>> +#endif /* _XE_SYSCTRL_TYPES_H_ */
>> --
>> 2.43.0
> 

