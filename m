Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4846EC61DBD
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 06:12:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E859A10F255;
	Fri, 28 Aug 2026 06:12:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ObpMLKAm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0522210F254
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 06:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787897546; x=1819433546;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cDBJzMs1vW4pkv4ZUMVeQxs/DMMURDOje4KlCJ/XuWY=;
 b=ObpMLKAmoPtWevfMKgdMLfsHWwAeDulQiu8TsjxJ4QyF70g7MreDL2XE
 D0V/8vqoOE4nN8/EHJQppsG72/3QFkJTcotUk3pf4O1FdpnrxgHYZ4fi5
 aj4OPSY85fZueP6hYtfF49als/p608BpcTLX+G9TfsOKuJxoA0ZyIChoa
 ZZDt8UQ4RWbrB8nEIqSCoyWZmRn/lqoZLv+wncXi97v9TgYkue+Vz95Cf
 bqV3y7apBM1j+mchV/vEqpGFBeSk2ALlau/n/DR+UKf3LHMVGBT1mSMYL
 uT55VToQ/piHmLZxT24zXXqsARBEcmXzitGyRvFBZ0UFbHDCOJLt0w7Po Q==;
X-CSE-ConnectionGUID: j8UaPEQiTHGcevfsGqlcjA==
X-CSE-MsgGUID: MwFbDXxVRzqaT48kY5l9Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="87535228"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="87535228"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 23:12:25 -0700
X-CSE-ConnectionGUID: SMYEySoFQ5G4yFDzQQEk/A==
X-CSE-MsgGUID: 3rtkXHGcR0SxlBuzDxopmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="272290571"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 23:12:25 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 23:12:24 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 23:12:24 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.62) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 23:12:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CBAH7BTfDC9ja5Ndem7WAY1wDD8H/jLGCN8iwwEkSZzs0PjrG/6jniYffVVKzw3UIV2d0ICBs1lQE0Bd7HKssSX2l1vK/Z96Rwrou24UGwdTdze305BZ6lm0sQA4cEan9Q61A/IGIAy3MLDYoxvkbvrt0Q3vsSkORtYJd7kentXoHiIQxoZp4wfs6xiPLGBsI+qzRZXkZ6bpWzJkNFs1QWNFiskaIwe26aLrLTn/Xc+5ma4vNiR2tULuve6A4eJ/Tste8ZmjzdgMAybhIj0W5qhVm3k0pdCWOCHhD8j7lej+aLRMOZHf2alJojOFZfe/6OYeErBSanZAhJty0xfB1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2oT3tBzJxyRGkX8MTgXiiRuj2KlAVgmWak04OM+3/fs=;
 b=BhL+HH87ktDpF5Jv+0TDcRIxOP1hCwYHlA5AXl8mZ8OX6klOyF77Pa8TgG+mzU8mxn3cxzcb6l2TjrrqaJw14xDlOiY35l09Jra8bcyto4XYxC3mV6WnwjZ/JkMIor9LfL578gQyJNZCUnX8wZnWtRuANNfF+PjN7uOLTwnEt6oH8KdExPKC6Fuu7Q4ADzb75g2cKQ5v10sRXlHfhaf0CS64Po3IaT0zNI9jYL0gyeSeFbLJIjhNtuw+oJU5Nv5GBeRRnij+hiFYzHiXCEP3010jcSw1wUcPhpBguQhG06cdtDIkBk1hM/kUHBMbpDbHXJc+bx5eiGAV0ekCUVjvRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS4PR11MB088116.namprd11.prod.outlook.com (2603:10b6:8:507::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 06:12:23 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 06:12:23 +0000
Message-ID: <2f41b3f0-076b-4876-93b6-216fa88e7c83@intel.com>
Date: Fri, 28 Aug 2026 11:42:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 09/10] drm/xe/pci: Introduce PCIe Function Level Reset
To: Raag Jadav <raag.jadav@intel.com>
CC: "Laguna, Lukasz" <lukasz.laguna@intel.com>,
 <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <rodrigo.vivi@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <michal.winiarski@intel.com>, <matthew.auld@intel.com>, <dev@lankhorst.se>,
 <jani.nikula@intel.com>, <lukas@wunner.de>,
 <daniele.ceraolospurio@intel.com>, <badal.nilawar@intel.com>
References: <20260821112436.545405-1-raag.jadav@intel.com>
 <20260821112436.545405-10-raag.jadav@intel.com>
 <a1c9ead7-b3f3-4bfd-9840-df36f3e85d99@intel.com>
 <ao6raGv1PAtsmW4b@black.igk.intel.com>
 <a2bb115f-80aa-480a-b8d4-c6f38c590e85@intel.com>
 <ao7QRcbFlJxVxHHP@black.igk.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <ao7QRcbFlJxVxHHP@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0297.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21e::12) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS4PR11MB088116:EE_
X-MS-Office365-Filtering-Correlation-Id: 1be613a3-eb2a-4177-4639-08df04cb52a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|10067099003|6133799003|3023799007|22082099003|18002099003|4143699003|11063799006|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info: 9DjdFAJgIjF/rxFF81bS0a/BhRkAsPcnEnIMakTC2m1sTVfMY6uYyxzz0M4edtANF151M02VxqwkW3zXmWdIrxoQ9byKU/xmqGTX+UVvCHRs/7LYf4LZyH9Z9qm7mxR2OXiXd1tBPLjDNtCTkQyR6k1c+9zUaIBxeOCTT7yiZAgKe429Bha7LQE9MyilTr5z4xj/4NxmQfBvXCxZlSHLOf9/qIwcGTjfHBG+8ac+OcM85d1ZeNgWepoUcG67iw5LrbR3yv1PJn1Q8ouYrSctgu5K/umksPwTGaGEvOzO5y4f8IbW1LWOIi4niBygiE63XoKZ1NyITRsdetlx2FpnwXvsbAXj9aagKhdfJNDzQAQhD3uQId1FFxf40LJn6Q1IwsBPEAt2ejtvvkAh9je7X7gki6uJDg0hv8SB1nEMvfab3Xa08nRrzm8gNvZyNRgzs5C9eWQ85FHfiX3JiilEceFUcSo4lpDkSX6mSMH0XkcF1JfRQk71XT4D1jDsNaKGidmSfTnUjZNX4zr1vmrWvua3WwES59JNTPIDvG4+sTfPEcypI4N7lKdjUFcWZ9qSwkbJuZ8RkMtqLwWLxF08cp77rBTkNQCvqUyvvp6ZJq/FMjCkMBlUvQlZgVbItBiNNP0Hae1BT4o1z+xXv96cVYNIWOtLrEb8qG1UmWgKfh0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(6133799003)(3023799007)(22082099003)(18002099003)(4143699003)(11063799006)(5023799004)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkRQanBEaDBVUVYvVk1MRWNpQmczMTN6SG9seVVkdTZhUHROY0ljNDdZZDg1?=
 =?utf-8?B?NVRHTFdoOWZSSXMyekhMVGtQOEFpOVIrQ2VwazVnMFY5UVZ5U1lqZHlUQXJu?=
 =?utf-8?B?TnZQclFGUytNREVxZzBobTZYR0o4WHJaZGtzNUFBMWlBcjYyOWJDak1oa0tV?=
 =?utf-8?B?YUJBQXhQNWlvVzMybld5UHA0bFdxd1hSRE9oNUhmODNPcS9PTmhmdW9IVkRO?=
 =?utf-8?B?MldrMlRWTnl1Z1BaYXUwbFU3RHdwNDFrN0lrbFFNQlFJRkFvbHVFRkdCR0R5?=
 =?utf-8?B?SU5kY29odzFqVjZ6Ukx5MGtQcFQwTnhvaHJ6S2JFelZobWtZMHdxU0NzZGV5?=
 =?utf-8?B?eFZONHFOdERzVnRCeFRRckRzL3JiMzhkWnprQ0RzeERTWFQyYjJ1cCt5cTdT?=
 =?utf-8?B?NkFJcEsyK2taUlR1aXNtVUo3TjhwWWgrdGVEbmpwcU9NdlA5RnpVNi81aUl6?=
 =?utf-8?B?Tyt6eXlMV2xuN2J0Qjg5cFdOZk55bVkvdmV2OVhJYUVCTTU4M0FlNGJKb2Y4?=
 =?utf-8?B?SUhLWlNmMW95Qk52dmgraTVqM0xIYnU2Mkw5d0lNcXMyV0V1VW1FSGNNenVa?=
 =?utf-8?B?Y0xzd0Z2OGYxNTNzKzZjWnFZdjRvMHM2a3lUTUwxY1ZYTGp0OTdMeUVXRWlE?=
 =?utf-8?B?ZG53Yk1YQk95M043ak9VODh0R3AzZkFIMWJoVnFTQnptRzVPcE9aV3ZucGdo?=
 =?utf-8?B?MHZ5MnZkWW9DcHUrUlRGeUVCWUVpRUpQUzdESkI5OVNiNnR3QW0vOWtaUmpF?=
 =?utf-8?B?WEpOaGlqL0RDbml2Wk51Z3B5YkpzQUM1a1I4SGg0QTRYeXhIbXF0WmViSThv?=
 =?utf-8?B?UVQyOGpQcjJobE9nTHVyT0hIWndHcmxGZUU3SVRnMG5ocUkxY1I0Rm1WOXI2?=
 =?utf-8?B?R2RTTE9kQXhxYXZqR0NiWGcyUTYwRlNrTlZJQiswOTBpVHlwb0JPS2xhSWky?=
 =?utf-8?B?TVRrelVPQnFKZ29rNjd5TzNTRm4vQXNRMkppYU9lajM2aldxVmVwcGtWTTVV?=
 =?utf-8?B?RFM0SGRuT2wwcTJQU0JFU0dkNEQzQTlaYk9TSW9XZnJnUnkycW9sVWNINE5r?=
 =?utf-8?B?VjJYRWxMaHl1REY1WEtZN0dzN3pZZFJBYnFxeTVKL2d0Z1BCNlZDSGNsNWVI?=
 =?utf-8?B?QU1sbVU3OWdMSVhmbzJjNmgvRjI2eFRvQjhjNkhoNkt5ZzU2MlBidEpsOHhl?=
 =?utf-8?B?MmN6WEFEeUd4ODlLckRQRHZIYytUQzVCZ01nUTJvcld0VWk4Z3MrUnlQdm1J?=
 =?utf-8?B?U3B6dndRSjRLL05zZHNRM1czREZBdTlEaS84K0ZSWEVTdWNFZVEzQ3JCRHhF?=
 =?utf-8?B?SlNoSGRIdjhpeEVaNll5UzJxQXZGQXBnR21oUEpTaWxLNGV4L2VESENDUWY2?=
 =?utf-8?B?TDB4RURDQXpnUjJpMUdJV285VTYrMmg5azVCWEdwc1E4Rm13K1ltZmVLK0Zn?=
 =?utf-8?B?cWhXblJXUmtvcjFoWjdqV0ExWDJiZXN1RGhCQnVUTTcxdlpnQ0dzejVSQUJ3?=
 =?utf-8?B?OEhZdWFoRjNtZlI0by8wSUJ4ajdpVnhLT1BmajFNRDBxZ2o3RFl1eHdycWox?=
 =?utf-8?B?ZTV4NXI1TTVjSjEvWE1OZUdWcFkzbGtKalByTXQ2STdkMG1PQi9xalAvOTYx?=
 =?utf-8?B?Qm1BMzlYSDY0MmFWdXRBYmVJRDVFZWpPUjNvaG5HK21iYTZsRnVTUEZsK0lP?=
 =?utf-8?B?RW1SY1ZOVUsrMm5jOXp0S2N6ZWZTRlU0NmorQWhNVXBCYjlCZFRKdmorU09k?=
 =?utf-8?B?a0FoWVBXZ0dkK1ZaMGdRY3ZmT2RodTY5OEJNQUpjeXpWTDExLytWOEJpTFhU?=
 =?utf-8?B?eVd4MzVoWSs3Q0czM2NmVWMyRldnNklaaUoxaUlySndqd095dmF6bU0xVFdR?=
 =?utf-8?B?dEwzQ3ZWVnNTTGdDZ3dRcng3MWFuTHp2N01vd09JL0xKM1IzeVlKOEc3bGxY?=
 =?utf-8?B?V2FaRmtRTGJXN0Y2UnNKQUQyaEVnVkxUK3ZrVlZWMGhlalJ6ODgzTDJXVTR2?=
 =?utf-8?B?RWFFamxFOUp5a3BLRC84L055WnlJYURhMXFFakFHSk5ONHowVDZyaVFJZTdm?=
 =?utf-8?B?UlhsVDdab0FsV3lva3AxV0lOVktHSVd6cEJSbjhvVThxdkJLVjVMZVV1U1V4?=
 =?utf-8?B?bUVxeUh3TVJDQlcxbjVtdkRuU3hSZmdNZHpPWThoQnZUbVBmYVF5bm9iRkxD?=
 =?utf-8?B?Wk5QcFpSdGU3S2VZYTF3cFZGQ3ZtUUpuRDlXOVluSDdmcWxKVm9WZ2I0WU5Z?=
 =?utf-8?B?ZkZsZy9zeHZGR2dIa2VyUzgxbk1aeXBzcUlPazFCaDNQVHpKREhvMWhmMTdl?=
 =?utf-8?B?bXJOV3FDTFBZeCt0bGJGb3RSWE9hd0YvMFBuNGw2Zm0vV1NaZjE3UT09?=
X-Exchange-RoutingPolicyChecked: SfWqxQA3WY2jnrQ6gxSsIk5abrRlGaZ7CPqqedUyU2McJ5/i21YCh/vbwyZWhj74pLJVvqcyyByMtbxyR8QqXn2qHEYygH00/org57oznjC3lcbwv/AiNbmUP/RhqhyhQ5k4gPAWdSLRETvsjM9R5vf52OrHzYgBnm/MOVvBdErKRv3nVM1Xu6tXPa9cmPwA0+5Pvu428Czqx4cyxUhcsAV1ks8RthD+ZLfcoiFrh1uqdFsdW2v/GnUxp0rXX//UsJ3YklYFBjLDAfWtwteBb3FhM+QNwbU6M5xzvtWf+F9EYGpFSzSdjOGxG3b/KtMdEPJZjHHLpSkz5ZhuQqzD5Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1be613a3-eb2a-4177-4639-08df04cb52a9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 06:12:22.8099 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ggwfLShAOxfBgm/96KLzo0Rq6NMVn6qYj2pNXApLxe/1WWvu48nCwXt882vYd5c/69AxMZIK9//4RYmlKfgiKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB088116
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


On 26-08-2026 17:08, Raag Jadav wrote:
> On Wed, Aug 26, 2026 at 03:22:19PM +0530, Tauro, Riana wrote:
>> On 26-08-2026 14:31, Raag Jadav wrote:
>>> On Tue, Aug 25, 2026 at 12:06:32PM +0200, Laguna, Lukasz wrote:
>>>> On 8/21/2026 13:23, Raag Jadav wrote:
>>>>> With bare minimum pieces in place, we can finally introduce PCIe Function
>>>>> Level Reset (FLR) support which re-initializes hardware state without the
>>>>> need for reloading the driver from userspace. All VRAM contents are lost
>>>>> along with hardware state and driver takes care of recreating the required
>>>>> kernel bos as part of re-initialization, but user still needs to recreate
>>>>> user bos and reload context after PCIe FLR.
>>>>>
>>>>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>>>>> Tested-by: Lukasz Laguna <lukasz.laguna@intel.com>
>>>>> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>> ---
>>>>>     v2: Spell out Function Level Reset (Jani)
>>>>>     v5: Prevent PM ref leak for wedged device (Matthew Brost)
>>>>>     v6: Add PCIe FLR documentation (Daniele)
>>>>>     v7: Refine PCIe FLR documentation (Daniele)
>>>>>         Introduce xe_pci_reset_skip() helper (Lukasz)
>>>>>     v9: Add 'Xe' prefix to document title (Rodrigo)
>>>>> v10: Update documentation to include PCI Error Handling (Lukasz)
>>>>>         Maintain wedged reference on FLR failure (Lukasz)
>>>>> ---
>>>>>     drivers/gpu/drm/xe/xe_device_types.h |   3 +
>>>>>     drivers/gpu/drm/xe/xe_pci_error.c    | 128 +++++++++++++++++++++++++++
>>>>>     2 files changed, 131 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>>>>> index 7be3f15bf7a0..8cbb5b747710 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>>>> @@ -518,6 +518,9 @@ struct xe_device {
>>>>>     	/** @pxp: Encapsulate Protected Xe Path support */
>>>>>     	struct xe_pxp *pxp;
>>>>> +	/** @flr_prepared: Prepared for function-reset */
>>>>> +	bool flr_prepared;
>>>>> +
>>>>>     	/** @needs_flr_on_fini: requests function-reset on fini */
>>>>>     	bool needs_flr_on_fini;
>>>>> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
>>>>> index 48466d726eae..81c4e55fae8f 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_pci_error.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
>>>>> @@ -12,8 +12,55 @@
>>>>>     #include "xe_pm.h"
>>>>>     #include "xe_printk.h"
>>>>>     #include "xe_ras.h"
>>>>> +#include "xe_sriov_pf_helpers.h"
>>>>>     #include "xe_survivability_mode.h"
>>>>> +/**
>>>>> + * DOC: Xe PCI Error Handling
>>>>> + *
>>>>> + * Xe driver registers PCI callbacks which are called by PCI core in case of
>>>>> + * bus errors or resets.
>>>>> + *
>>>>> + * Currently both Function Level Reset (FLR) and bus error handling callbacks are
>>>>> + * supported. Both wipe the VRAM and resets the state of all the hardware units.
>>>>> + * Therefore, the contents of all exec queues and BOs in VRAM are lost, and the
>>>>> + * hardware needs a full re-initialization. The way Xe driver handles it, is
>>>>> + * pretty much similar to system suspend/resume flow with a few notable exceptions.
>>>>> + *
>>>>> + * Prepare phase:
>>>>> + *
>>>>> + * - Temporarily wedge the device to prevent userspace access
>>>>> + * - Kill exec queues which signals all fences and frees in-flight jobs
>>>>> + * - Stop the scheduler and all submissions to GuC
>>>>> + * - The fact that FLR is needed is because hardware could be in corrupted state
>>>>> + *   and access unreliable, so skip memory eviction due to untrustworthy VRAM
>>>>> + *   contents
>>>>> + * - Remove all memory mappings since VRAM contents will be lost
>>>>> + *
>>>>> + * Re-initialization phase:
>>>>> + *
>>>>> + * - Recreate kernel BOs due to skipped memory eviction in prepare phase
>>>>> + * - Restore kernel queues which were killed in prepare phase
>>>>> + * - Reload all uC firmwares
>>>>> + * - Bring up all hardware units
>>>>> + * - Unwedge the device to allow userspace access
>>>>> + *
>>>>> + * Since VRAM contents are lost, the user is expected to recreate user memory
>>>>> + * and reload context.
>>>>> + *
>>>>> + * TODO: Reuse FLR callbacks for bus error handling.
>>>>> + *
>>>>> + * Current implementation is only limited to re-initializing GT. This needs to
>>>>> + * be extended for a lot of components listed below.
>>>>> + *
>>>>> + * - Proper re-initialization of GSC and PXP for integrated platforms
>>>>> + * - SR-IOV cases which need PF and VF synchronization
>>>>> + * - Re-initialization of all child devices registered by Xe
>>>>> + * - Prepare existing xe_device_wedged() users for temporary wedging
>>>>> + * - MM corner cases
>>>>> + * - Display
>>>>> + */
>>>>> +
>>>>>     static void prepare_device_for_reset(struct pci_dev *pdev)
>>>>>     {
>>>>>     	struct xe_device *xe = pdev_to_xe_device(pdev);
>>>>> @@ -142,9 +189,90 @@ static void xe_pci_error_resume(struct pci_dev *pdev)
>>>>>     	xe_device_wedged_put(xe);
>>>>>     }
>>>>> +static inline bool xe_pci_reset_skip(struct xe_device *xe)
>>>>> +{
>> Add a TODO
> Sure.
>
>>>>> +	return !IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe_sriov_pf_num_vfs(xe) || xe->info.probe_display;
>>>>> +}
>>>>> +
>>>>> +static void xe_pci_reset_prepare(struct pci_dev *pdev)
>>>>> +{
>>>>> +	struct xe_device *xe = pdev_to_xe_device(pdev);
>>>>> +	int err;
>>>>> +
>>>>> +	err = xe_pci_reset_skip(xe);
>>>>> +	if (err) {
>>>>> +		xe_err(xe, "PCIe FLR not supported\n");
>> Nit: Can the log be just PCIe reset
>  From PCI standpoint there are different types of resets, so better to be
> explicit.

I see bus-reset also using the reset_prepare/done callbacks.
I was thinking use the same name as function calls
It's a nit so upto you.

>
>>>>> +		goto wedge;
>>>> Looks like we always take the reference, so can't we do it at the top of
>>>> this function and only return here?
>>> Because we check for pre-existing ref below, in that case something else
>>> is already wrong and it's pointless to move forward. We take a local ref
>>> anyway because PCI core doesn't distinguish failure cases and calls
>>> ->reset_done() regardless, so we have to compensate for it by maintaining
>>> the ref across calls (which we later drop in ->reset_done()).
>>   If it is not supported why not just return in both function calls? Why
>> proceed?
> You mean allow userspace access while FLR is in progress?

If we do not quiesce the device and trigger a flr would it not cause 
other crashes anyway?

Thanks
Riana

>
> Raag
>
>>>>> +	}
>>>>> +
>>>>> +	err = xe_device_wedged(xe);
>>>>> +	if (err)
>>>>> +		xe_err(xe, "PCIe FLR failed, device in unexpected state\n");
>>>>> +
>>>>> +wedge:
>>>>> +	/* Wedge the device to prevent userspace access but don't send the event yet */
>>>>> +	xe_device_wedged_get(xe);
>>>>> +	if (err)
>>>>> +		return;
>>>>> +
>>>>> +	/*
>>>>> +	 * The hardware could be in corrupted state and access unreliable, but we try to
>>>>> +	 * update data structures and cleanup any pending work to avoid side effects during
>>>>> +	 * PCIe FLR. This will be similar to system suspend flow but without eviction.
>>>>> +	 */
>>>>> +	err = xe_device_suspend(xe, true);
>>>>> +	if (err) {
>>>>> +		xe_err(xe, "Failed to prepare for PCIe FLR\n");
>>>>> +		return;
>>>>> +	}
>>>>> +
>>>>> +	xe->flr_prepared = true;
>>>>> +	xe_info(xe, "Prepared for PCIe FLR\n");
>>>>> +}
>>>>> +
>>>>> +static void xe_pci_reset_done(struct pci_dev *pdev)
>>>>> +{
>>>>> +	struct xe_device *xe = pdev_to_xe_device(pdev);
>>>>> +	int err;
>>>>> +
>>>>> +	err = xe_pci_reset_skip(xe);
>>>>> +	if (err)
>>>>> +		goto out;
>>>>> +
>>>>> +	if (!xe->flr_prepared)
>>>>> +		goto out;
>>>>> +
>>>>> +	/* Unprepare early in case we fail */
>>>>> +	xe->flr_prepared = false;
>>>>> +
>>>>> +	/*
>>>>> +	 * We already have the data structures intact, so try to re-initialize the device.
>>>>> +	 * This will be similar to system resume flow, except we'll also need to recreate
>>>>> +	 * kernel bos and restore kernel queues.
>>>>> +	 */
>>>>> +	err = xe_device_resume(xe, true);
>>>>> +	if (err) {
>>>>> +		xe_err(xe, "Re-initialization failed\n");
>>>>> +		goto out;
>>>>> +	}
>>>>> +
>>>>> +	/* Unwedge to allow userspace access */
>>>>> +	xe_device_wedged_put(xe);
>>>>> +	xe_info(xe, "Re-initialization success\n");
>>>>> +
>>>>> +	return;
>>>>> +out:
>>>>> +	/* Most likely the device is unusable and there's nothing we can do about it */
>>>>> +	xe_device_declare_wedged(xe);
>>>>> +	/* Drop local reference */
>>>>> +	xe_device_wedged_put(xe);
>>>>> +}
>>>>> +
>>>>>     const struct pci_error_handlers xe_pci_error_handlers = {
>>>>>     	.error_detected	= xe_pci_error_detected,
>>>>>     	.mmio_enabled	= xe_pci_error_mmio_enabled,
>>>>>     	.slot_reset	= xe_pci_error_slot_reset,
>>>>>     	.resume		= xe_pci_error_resume,
>>>>> +	.reset_prepare	= xe_pci_reset_prepare,
>>>>> +	.reset_done	= xe_pci_reset_done,
>>>>>     };
