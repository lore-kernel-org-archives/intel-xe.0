Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13110F588F0
	for <intel-xe@archiver.kernel.org>; Mon, 20 Apr 2026 16:19:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC5F110E6EB;
	Mon, 20 Apr 2026 16:19:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eOEVkB+J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB55A10E6EB
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Apr 2026 16:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776701988; x=1808237988;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Muv1CP7aS8V/ZSEgCGuaJ80W5tzN9p2pIcKa3bRiXGE=;
 b=eOEVkB+Jf/e2WtfEuL1W/dUfDWrOCsI+vOjB0lNEB0eNrDzoIMJzRgmf
 jWmSLJ/T1usyHBGsBG3/f3k7JoU2dr220xKGYG6nYWrBIiSy6u+PcqpE1
 vupEawkk34+AIt+sFaZP47HRPxjISkwhnvgjd3vi46AVThB9aMPZe4kj+
 xoWxc/rmKy1TgNBtmUk/DTg09BLFHaJL7Gi9DqMDXPDz+jNwEbd7kemQ9
 d7N+PNjGjmSrS73SW7UvwiYRDrgaYGtQ1TVSvoB/1gl7fLgusbX93EYkR
 7bU9Hxc5LYGHegO2cXihRXa42c6eVj7e7PBe0y/utRYeyr2LDNuOJyOE/ w==;
X-CSE-ConnectionGUID: bV04wf5wS/a5ItkLDQrtlA==
X-CSE-MsgGUID: kfSMwCXMSLaPS/oNgX5wyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="89090496"
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; d="scan'208";a="89090496"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 09:19:48 -0700
X-CSE-ConnectionGUID: A0rxseFSTWqeV+haqi1tRg==
X-CSE-MsgGUID: vOkFHXLXTxaaFW9QVAltfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; d="scan'208";a="255020546"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 09:19:47 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 20 Apr 2026 09:19:46 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 20 Apr 2026 09:19:46 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.12) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 20 Apr 2026 09:19:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N5Jkyqy+hnvI/2tNN6APaxTR4Bkf5fZFU4Gbl9pU5yjfq1q/og7vp0yx7lzx6nbTrkbLsv5w/SuHgLfiOTMzagtroXxANJDzPmdQcXFqR07pUZL+rVDEZxl0vGlIwwgI47dTskhIYlEU91XSEGBo0UyWLqQOkq+ka0atFkup9IP0EA6s7Ct+O1Z2fSbpiNH/FqKCJfC3jQbp2F1Bo6DERWYJ/4JIhuwfVAozippDZaNWIcUn/bO8ihtLbeeTXalUpTZT8pSJ56rzyw+ZF9q/LItufvyymjnuOf7SarRxzJZ5b13gZiHACU0cAg4hp+duh4zyQO7QEvPsW18uiSVqLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zFYfY8gb+3qSnlN+V30bDSVYSwl9JYV0T0MCfQW2Wko=;
 b=YnK+Ad0jRGdlMUX28hFkfohBDeB1+FxpwEcW/cucnRfDcOGqVUq1OAtPLcl4BmadjAcnmVPw28K3EpF1w6/9M9J3NwBtjfB/1+i2t4NtJGGOzElwJtxLYxOL9PZvzmzwbZi5hCJhIEGDdG9uZ3ZZfs2lGw+LfF3GnbFPAfgOeW+IvBfaw9cTRuhrBhK/a0JWC1G9k6MaitrQq2ASjekwyd2eV2ulZmE33D0+ZH8w4FRByAlohX4a0YrHTDST0KUejFxwcBYMoMhTVFxMhYikuZXvcR0eQfpRaw912eKTTF6vHkqL5PhKlQx/T/FG1X8CTEm85gW4oW9U8W/WeYOUnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by SJ0PR11MB5087.namprd11.prod.outlook.com (2603:10b6:a03:2ad::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Mon, 20 Apr
 2026 16:19:42 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%6]) with mapi id 15.20.9846.011; Mon, 20 Apr 2026
 16:19:42 +0000
Message-ID: <bd5d4112-36c1-4e9f-b06e-08213922c157@intel.com>
Date: Mon, 20 Apr 2026 21:49:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] drm/xe/xe_ras: Add RAS support for GPU health
 indicator
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <anshuman.gupta@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>, <mallesh.koujalagi@intel.com>,
 <anoop.c.vijay@intel.com>
References: <20260416093610.4085667-1-soham.purkait@intel.com>
 <20260416093610.4085667-3-soham.purkait@intel.com>
 <aeDN6g6HWd3v-V72@ashyti-mobl2.lan>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <aeDN6g6HWd3v-V72@ashyti-mobl2.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0203.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::13) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|SJ0PR11MB5087:EE_
X-MS-Office365-Filtering-Correlation-Id: b7d15576-dea5-41b5-ab7e-08de9ef8a112
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: 96aNCgmJlj1qsKEjFeaJw1q51WFb/Uw28hD9aLe9mqHfH5v2RRQvQ4SDpUPILmbaQE/FM0cvhDrpDpo8BZE9upwWLrneTywEhaOqIwVu9KvKMbUYmd/ZUiFH9JPIDUAtA7P9/5U8iYmHtlos9qLfK+bVnm3lPG5m5MQ8jNpA8kfDsBAO93r3ab+l+wdxLuPXwUbLwRnEvfQ7GpCf80/d26OvW4/RnQbAJg7059ubUlQ+KsS6nczluRavN5R77l0ecdI3FWtQWxA6PpJlgoqoKs6oN885yPWmCJLPescdrvts4EHMLSbZQtyy5sFvzfcwMX2KeiIm5bDqV5oHQLozoFwA3e9ZUlzuGk+Ta9Aw51o5cboZHys0wFQwOjB+hG50Q8yGIY0rA++PSbZ+W4vHpHPwBI2+U4AKUJPBQsu4zmjkp/EXQljnSzrCSxLJ0QCA+SFpyk3RWAYegTP3l6sVB3Yz7WaJxsQcX0hLmzFT02rgK6XErPdJhzInxz4SUP91YiU6w6mSiQQOMG4Y886UYCLbhEkLzVoHER13DpsiA/juq2Ip+76/iS0Uk8bK8nNMSkafssIFM1fWm9BUoOfihwG0XKDCH6crqiPF7+0gNNCl0htlCm/tsmWniwuHxT9i45BmY+HFWxPcm7DtvH2SmXXgFWmLm0NFErWR2+6gCRcb6Ms49bkYdD4Zj7+AVMqapheZa59zorVV/AVVoZrBL7fTt5+ldtcfdW4XG39pc9Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXpJakx4YXRvdGd3UkhJd2JLdnBhWllMN2JjUENUMDNCS0poYUhBNkQvL1F4?=
 =?utf-8?B?aHBNL0Fjb2ZNWGZyRVRKTnFMdnlzNFVkNXpmUzNpMVRURklObTV2MXI3VlFm?=
 =?utf-8?B?RGdBV1YvaW5SZ01Ob2h0S0pFbEJ5a1g4ZWVucDVGM1o5UGN1QTMyejVwckpz?=
 =?utf-8?B?MFUyaEZ5eHhlUFppcU5jRE52ZEtUUHdvNTZhQ2p3R3hjUTVLT1JRQUh3S3RM?=
 =?utf-8?B?RzhxWEVmZ3ZPZ2lDR1Uxb3hjTWxBT0UrYUd2QUt1TU1URTFoK2NSZ20zQUIx?=
 =?utf-8?B?TXBSZ1VMemxWQ28xNzhZZ3QzZWhZR2U2eEo0YVZBTWVIY1pxNG1VcmU5Z0JX?=
 =?utf-8?B?MytqTnpXbm1FMklBN0VZVlZiZlV4Mk9MbS9keVYzd0hSY1hFRmxQeWUvbS9u?=
 =?utf-8?B?RllUcVZ5RnR2SkZaSTUwNVVwazBmMXR1MFJjNDZJcXJJZXVYZzJYakRXQ1Zk?=
 =?utf-8?B?TDMzYnJBR3ZMcGhBdktlT3ZKbUp1UVdmVHNrT1RRcWFQOGdCTHkwUkFYSHpC?=
 =?utf-8?B?UXhaVEphLyt4dW1sVGc2M0F2eXllLzkwc3J6SzVVNTZGVUdZUVhqL2pQVDRy?=
 =?utf-8?B?cE85bWp3dVJ4c09ndExIbjhuR1p0NTB0RXExZGJ4WXAzZ2Z4S0I5NGxOZTYy?=
 =?utf-8?B?ODFDNU5XdEt0NXl4T3NpdEtMRlgrMXU3Q0ZDRTkrMHZXalVlZTF4aFB2U2c0?=
 =?utf-8?B?VFV4T0xYd21VUFdNYVNFcVE3ZzFHN1FHN2RrR1ZVYXhyZDNKSXVmd0E5cE9z?=
 =?utf-8?B?U01JNVVhR1VNOHVTQ214ZTRaZFJLNi9XUXJVcHllYVloWFBISGV3NFhIeWg1?=
 =?utf-8?B?ZFZ2Q2JwbWtScGtzVnowU3hpMlZnQ2FhdkdINm1WSXRTQ0tjSDgzK3EzeE80?=
 =?utf-8?B?RDg3aFFqN0Jva3FRSzVUbC9MSmtLS0JqRjZHZ0t1ckFVUmE4TVhhcHRhMHkx?=
 =?utf-8?B?WlFnbTQyY3BWRVhpWFZiNG8zRHJucWRKNS9uemtTeWhTNWpNUFpaeERDb0pJ?=
 =?utf-8?B?ajR2c1R1aFhjbXllRmtXaDYrSEcrSkxtanJHUjBtbFdXc3ZmV2x0T0ZiMk04?=
 =?utf-8?B?UGNyRkYwQVdIc2hOR3g5emZ3RlVrN2tFTEhqenJKcEFlcVdCaWl0RzJVYmJG?=
 =?utf-8?B?YjZUYXpmVmVxaHY1UlZpN0crYVRvSE5qemRZU1JxYWlvTis2Z1VPUVgzczlo?=
 =?utf-8?B?RmtORlZQQVRjbDYvT3FRSkJlU1NlVDRPRTJ5ai9teU9QbFVySzlJWUhsamlD?=
 =?utf-8?B?YWtaN2tSOFJndFhGZW03b1VHUzdzbldXR0lxV3RZQXRnbkdMOU9Ma3dHZGpB?=
 =?utf-8?B?LzhDR0ZacmxPcmdkdlVaOElRTEg5U2lJNkFsejlNU29ZUC9JVHF5TzRzbUsx?=
 =?utf-8?B?MWpSZDNsKzBERWczV1FwYmR6WTVmQXVyTlBQWFV1TlBGNUc0cVp5ZnZWUmpE?=
 =?utf-8?B?M0hSUGlDNC95VEhYN2ZkcHdxK0dTQi9VNmduZ25MbnJxdlRTKzJNeEpmenFB?=
 =?utf-8?B?YytjR3FPWWpEekRpR01HTndqY0dPUE1OQWdkb29sVnRvZGt4NHZ4N3NWZUx0?=
 =?utf-8?B?bms4QWgzejQ1Z3YxYUFiMzQxcXY2MUl6T0c4anJLUDhjQVl4Z0lCYkxkNDZ6?=
 =?utf-8?B?d0hoeTFRZ0tWMnZQSUFIY3JOVGt5YUkvVU4wZGVmdjlvT1BuTTIxNWhZelNB?=
 =?utf-8?B?S21ObHM4UFViZ0RhRjlEd0dSYkVBK1EzemFOUjVHMlZFRnFnT25CVitiZkRp?=
 =?utf-8?B?MDVsNlFXVWZOY0R4OFRMeTRYNktSYlZJck95UDBxNUJFZEE1aDRHdzAyQ3lQ?=
 =?utf-8?B?NWVlN09GemZaOWVsSTIyK0t5MExOT1puWjRPNUYvVmNOdkZCSHlSSDN1RWFT?=
 =?utf-8?B?aHp1d0YyTG9lTDlYSHhqemYxYWN3eU5PaS9XYUs4VFBZbkh4R0kxdUQ3MUFl?=
 =?utf-8?B?Z0ZZYkd1WGRPb3lsMitLemNxQlhPYUkyelh5bFFDMjRLOGk3QzlNSEc4V0pB?=
 =?utf-8?B?RWJhMVhOZElLQVZkYUcrRUxuQWM2NCs3R2pFOXBNV1hKWnJWUjlqWDhmU3Fk?=
 =?utf-8?B?aHJVeXh1TFlzM3U3cFZCaE9wN1ZOenN4OFprcVlRSVJ5ME44RkhqMUVGUFMx?=
 =?utf-8?B?c09lNDExV3hwZFdGYWwrTitzQmd4VGR0aUlwRUhHZzloWFU4MmZ6cnRnYk01?=
 =?utf-8?B?NzFtWVV3WWxweTUxZ0hjOGxuSHlCOWtRQkhzQVQxUCtGLzUzZ2tRS3VpdlZE?=
 =?utf-8?B?azhacVlDWENKNnRwd0ZMbWEwc2NOZVJNK1ZiemxINCtVeUYvcW5MTXR2eXYx?=
 =?utf-8?B?OWZHOGNTUGtheE43aEgvMlNVWkc4TTIyZzZMenV2UXlFbTJuUDBrRUhoalVD?=
 =?utf-8?Q?p7rKM738cdzzCQMs=3D?=
X-Exchange-RoutingPolicyChecked: LM7CiDdQyhTCT1UN+nM6OzHK9vA6Xc2uGDlw0afcnhjskhOFPuzz33OQl2qEM6uglKpiM2I4zAFVHbJjB8e4yxMJCeM7tYmqC8T7/HyHvIe4/trpGy/uDhlC1gysvmDva64nxbXJCGK3AyANDsTMkZNo4rpnNQ7WH2H3RoZObec9QAztUXLX8bdyU/G6HeSss0WmCUrnxzR3tnPui8n45AQk8krBfVCS8pmTRrfqTbtWkDY+0aZcesXW236x1AuYYOC1K013ONvmjuw1VVRnzT+F0CerZT7lpIu120sfVjYfnncaYlWVC1sb4PZJRsgqP5ci3AVzIx171KuHCt60uA==
X-MS-Exchange-CrossTenant-Network-Message-Id: b7d15576-dea5-41b5-ab7e-08de9ef8a112
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 16:19:42.6127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 07XkM1dEJLNCAIpTtbQuSW2q7H8HBeT5QCrRPXf5gb89d8rwaiOE0iBpZ4yQFah3TUmDE3vEQFjMltlAQSSDew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5087
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

Hi Andi,

On 16-04-2026 17:24, Andi Shyti wrote:
> Hi Soham,
>
> On Thu, Apr 16, 2026 at 03:06:10PM +0530, Soham Purkait wrote:
>> GPU health indicator exposes a single sysfs interface, gpu_health,
>> at the device level, allowing administrators and management tools to
>> query the GPU health status. The interface permits both read and write
>> operations on PF and native functions, while on VFs it is exposed as
>> read-only.
> Can you describe better the interfaces? The input and output
> values?

Sure. I missed it in this series. I think it is better to be in 
cover-letter isn't it  ?

FYI the sysfs file (gpu_health) is placed in the device level and behaves as
follows:

$ cat /sys/.../device/gpu_health
[ok] warning critical

$ echo critical > /sys/.../device/gpu_health

$ cat /sys/.../device/gpu_health
ok warning [critical]

>
>> v1:
>>   - gpu_health is read-write on PFs and native functions. It is read-only
>>     on VFs. VF write attempts are rejected.
> Are you adding a changelog for V1?
>
>> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ...
>
>> +static const char * const gpu_health_states[] = { "ok", "warning", "critical" };
>> +static const char * const gpu_health_fmt[] = {
>> +	"[%s] %s %s\n",
>> +	"%s [%s] %s\n",
>> +	"%s %s [%s]\n",
>> +};
> Please, don't use complex sentences in sysfs outputs. Use a
> single string/character/value
>
> ...
>
>> +static ssize_t gpu_health_show(struct device *dev, struct device_attribute *attr, char *buf)
>> +{
>> +	struct xe_device *xe = kdev_to_xe_device(dev);
>> +	struct xe_sysctrl_mailbox_command command = {0};
>> +	struct xe_ras_health_get_response response = {0};
>> +	struct xe_ras_health_get_input request = {0};
>> +	u8 health;
>> +	int ret;
>> +	size_t rlen = 0;
>> +
>> +	prepare_sysctrl_command(&command, XE_SYSCTRL_CMD_GET_HEALTH, &request,
>> +				sizeof(request), &response, sizeof(response));
>> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>> +	if (ret) {
>> +		xe_err(xe, "[RAS]: Sysctrl error ret %d\n", ret);
>> +		return -EIO;
> why not return ret? (same goes for the rest of the function and
> the store() function).
>
>> +	}
>> +	if (rlen != sizeof(response)) {
>> +		xe_err(xe,
>> +		       "[RAS]: invalid Sysctrl response length %zu (expected %zu)\n",
>> +		       rlen, sizeof(response));
>> +		return -EIO;
>> +	}
>> +	if (response.current_health >= ARRAY_SIZE(gpu_health_states)) {
>> +		xe_err(xe, "[RAS]: invalid health state %u from Sysctrl\n",
>> +		       response.current_health);
>> +		return -EIO;
>> +	}
> ...
>
>> +static ssize_t gpu_health_store(struct device *dev, struct device_attribute *attr,
>> +				const char *buf, size_t count)
>> +{
> ...
>
>> +	if (IS_SRIOV_VF(xe)) {
>> +		xe_dbg(xe, "[RAS]: GPU health state update rejected on VF\n");
>> +		return -EPERM;
>> +	}
> This is redundant as this function wouldn't be used for sriov.
>
>> +	state = sysfs_match_string(gpu_health_states,
>> +				   buf);
>> +	if (state < 0)
>> +		return -EINVAL;
>> +
>> +	request.new_health = (xe_ras_health_status_t)state;
>> +
>> +	prepare_sysctrl_command(&command, XE_SYSCTRL_CMD_SET_HEALTH, &request,
>> +				sizeof(request), &response, sizeof(response));
>> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>> +	if (ret) {
>> +		xe_err(xe, "[RAS]: Sysctrl error ret %d\n", ret);
>> +		return -EIO;
>> +	}
>> +	if (rlen != sizeof(response)) {
>> +		xe_err(xe,
>> +		       "[RAS]: invalid Sysctrl response length %zu (expected %zu)\n",
>> +		       rlen, sizeof(response));
>> +		return -EIO;
>> +	}
>> +	if (response.current_health >= ARRAY_SIZE(gpu_health_states)) {
>> +		xe_err(xe, "[RAS]: invalid health state %u from Sysctrl\n",
>> +		       response.current_health);
>> +		return -EIO;
>> +	}
>> +
>> +	health = response.current_health;
>> +
>> +	xe_dbg(xe, "[RAS]: current GPU health state=%d (%s)\n",
>> +	       health, gpu_health_states[health]);
>> +
> BTW, why do we need the field response.operation_status that is
> not used at all here?

This is just for the debugging purposes. "response.current_health" is 
the health status after this change.

Thanks,
Soham

>
>> +	return count;
>> +}
>> +
>> +static struct device_attribute dev_attr_gpu_health_rw =
>> +	__ATTR_RW_MODE(gpu_health, 0600);
>> +
>> +static struct device_attribute dev_attr_gpu_health_ro =
>> +	__ATTR_RO_MODE(gpu_health, 0400);
>> +
>> +static struct device_attribute *gpu_health_attr(struct xe_device *xe)
>> +{
>> +	return IS_SRIOV_VF(xe) ? &dev_attr_gpu_health_ro : &dev_attr_gpu_health_rw;
>> +}
> ...
>
>> +static void gpu_health_indicator_sysfs_init(struct xe_device *xe)
>> +{
>> +	struct device *dev = xe->drm.dev;
>> +	int err;
>> +
>> +	err = device_create_file(dev, gpu_health_attr(xe));
>> +	if (err)
>> +		goto err;
> Please, don't use goto this way. If you need only one log out of
> the outcome of this function, print it in _init(): make this
> an int function, return err and check err in the calling
> function.
>
> Andi
>
>> +
>> +	err = devm_add_action_or_reset(dev, gpu_health_sysfs_fini, dev);
>> +	if (err)
>> +		goto err;
>> +
>> +	return;
>> +
>> +err:
>> +	xe_err(xe, "[RAS]: failed to initialize GPU health sysfs, err=%d\n", err);
>> +}
>> +
>> +/**
>> + * xe_ras_init - Initialize Xe RAS
>> + * @xe: xe device instance
>> + *
>> + * Initialize Xe RAS
>> + */
>> +void xe_ras_init(struct xe_device *xe)
>> +{
>> +	if (!xe->info.has_sysctrl)
>> +		return;
>> +
>> +	gpu_health_indicator_sysfs_init(xe);
>> +}
