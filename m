Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 529EF106B504
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 21:01:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02F9210E19E;
	Wed, 25 Mar 2026 21:01:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UfRcIG2V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F5D610E19E
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Mar 2026 21:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774472465; x=1806008465;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=OB6rQIftn+ii9OpwnY8lVon7OEGSxim8rHzzPx/gvbs=;
 b=UfRcIG2Vi3bHBmkWBmkQCmQg0t0BMHeocSxGT5uu++sG8OZezZMkydAg
 m0B0Erx5/rf5U9eQ87kgJgWVNouGvUJETO0pLNG6tI/02X3yWQPIZRos/
 hjm70/K3hCna+oNRxG+3NMxf2P7dlfhB2Shxto+v0LubKW249LiZCjI6I
 +DCb6H4axLFsu2HBoduVzaCUJH8xT/2wwviuK6j8zBXjxVJe/G+mHQZDj
 Nijl7XUK4osi/kiCfOQf6J7qieSuvQZwBkoWhLeuqv1u7tvyoDcdzFRK9
 L/XZHHywjkoXJJura/hjIi67sUZjL+hUckcs2RYPMLXMMK9oxseU45HCq w==;
X-CSE-ConnectionGUID: kFaUPmLWQZ+FFrhEqFgCNg==
X-CSE-MsgGUID: Pqk8Ep+sQm2WciCjHB1JEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="78119606"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="78119606"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 14:01:05 -0700
X-CSE-ConnectionGUID: G2VMxinXSiqGiShtKJgUzQ==
X-CSE-MsgGUID: WIbuJLSrQzmb6ZfETTetww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="223992812"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 14:01:05 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 14:01:04 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 25 Mar 2026 14:01:04 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.6) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 14:00:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C6sm/fbPFHlvpwQV4tuQ0W++WIot3zQz9cZeYq9og++L5fzcZnDUSq9pDt2KawokRqhEHuA//QlD2bTgTXRJGr4URjBkA0NfLTTvtU3LpIxigsjNlP1IdJzVomVr1z8u1YmzI9nBsYEOwZ95nkXROZ5y1Q+4bwSaQRFDFZznAzM6aHWnuyG4rqaRPBxEb4zjTnZo7x/gEnADABuEBuN8gdgdA3CrjVRBZ1BhCTNkUPwY9AkTHmMm0EWdTWZCs1knkXkshutu+31s2/a8Ur6hshmG7sH3vs5Q2jHxcmeqSvfW/xXYb0UMY4fHjTD6aP9ZPPPjrqm+QIHAIOSuQPMbWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OB6rQIftn+ii9OpwnY8lVon7OEGSxim8rHzzPx/gvbs=;
 b=oe1sSCkWhdrHV5bVt983p6qRy1Z6WVN2pb5bmoX8yNBTaG7uRAUpGPtnsZMtMJ85rRHOJi6sGYcEberi8DU1UKu7r4OeJ4Nu46y8MErTqu8nhG/pcysYPaYvlUMqsblFPcwAM1/bMFm6mI73mCW6tj21Jm6U+wI+D1mvFLqiUlYCioi+LdoB/QeUE3MNsquH6JcLN7sEsCqxhXHMqa13jCJzMObgHS8WbKHQxsIbNgEoHFqDrkiof7Vrz6sCWfhtUtsVCN6Z69jdpC5GA9fsJr1M9Co4joodp7b3QCUdNKvsVNXln59sumNHH7Ui0fydta2bCOfo0JuRGErQs7iGvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by LV2PR11MB6022.namprd11.prod.outlook.com (2603:10b6:408:17c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.6; Wed, 25 Mar
 2026 21:00:57 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%3]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 21:00:56 +0000
Message-ID: <e2671e9a-9c34-4531-a686-1c01e92127a0@intel.com>
Date: Wed, 25 Mar 2026 14:00:54 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] drm/xe/pxp: Don't allow PXP on older PTL GSC FWs
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260324153718.3155504-6-daniele.ceraolospurio@intel.com>
 <20260324153718.3155504-10-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20260324153718.3155504-10-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P222CA0003.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::8) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|LV2PR11MB6022:EE_
X-MS-Office365-Filtering-Correlation-Id: dd22e6ae-e39b-4206-4046-08de8ab19c33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: 8TPwYvRVGAF4DxuLRSyUR8iXlSBwtgL95zDFmvLRMBLZbWEhninodwrsBsKkGxMlmgZTUehKCz5wLvDGDj7WbIYGg6nBWGPCwtQJM+H1Sj4kda/NlKGhsO0TObn65Rt4xsApUJFOJuMXPp+Fw4mqJIxzzy/GsORVduuu0njJn6O20w9pgqAIS+yfcX7r8iWCnOtQnvtPKq8Q2y0lCWzOm+mHI2iXYEm//ao1TDmDDyho3njegMF1m+vkIr5aManez0mbMLLNZJjnfJQqvSQvM1c7N9GZq4Ah7UUDLqiyhV4EWnmLrByOLARXxXrelwbhU0TWFe8KUTacRkwyH66X4FuMgNxRFqp6C5c4vfk2YaKJqqZYphIataCnRkCZsrNaPVKRvXjsFCS3jYFHXCwGisPSk1kc1KD5LZpw8zF28ZGPjPcryEy7qIuvJA1JsdPiThuNx4MDvZDTMVlfd9b/as4ZJF1tuALYKRQFM3c4POG2JCBYGcZjU29xSY2XHwxEjIRVNzwBkTe/iyAtxx6IHyHQyKOuCOm82/8Y1kpJS/B8gMYD52WvTsf97Dn9S4vRtFpFD6zVh9wMYO4hFHwqPX3bc9TCLIpSo01CxO+yHb29gXW9ldU254Sqk/N4CyPPCCjz39VAHGV6/M6UAEzJpprs67rSU50hlNzxOwnPYrJ0c0Z2+VNIuntgwjOtoyldR8PR1n0UuCTR28hcg/eRbedzw4EWYzMJAcQAEQJWOz4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGZKN3cwNG9Sc0V5WGNlN2g0U1kveXFDVHN3ZXJma3dMbDE5MjU3MFp5b3Vp?=
 =?utf-8?B?c2UzOUtuVVI2bmhxOFE4VUhVK0laZ3p1N0JxRkVSTkpYU2ZHcEVBeDhqT2lF?=
 =?utf-8?B?angvREdYOHhCbjRVc1lnWnVwU0h6aUlkU0xTZUNneWVjNnlDWXZZeVhZRGdE?=
 =?utf-8?B?QnhzTDFlRnlnckZLMk5wWWNZRlhtbEV0a0orUmJyb3FEd2I0NDZFRWEyUGp3?=
 =?utf-8?B?ajdsRDhkajNHS1RGSEsvUnB1bmtDdFhwZjhER29hK1J4a3Y2Wll6VkFSampo?=
 =?utf-8?B?RUZKL3YvRmxzajlnVmIwWTJMRUVML1huY0VmQ3JHblRFLzRVcmhpVGEyK043?=
 =?utf-8?B?ZlM1QkpGR0Z3NnVic0t2bjBieCsyT2REY09oYzQ5WDVtZGRnYzZ0V3B4eHZo?=
 =?utf-8?B?VnB6ZW4vSGl3UGZxTVZlSy8ycnRFdHNxVGhmN2ttS1dQVlhBN0FLam1QOUsx?=
 =?utf-8?B?SGJyRGhrK1p0WFRPQmtWOUJIMHpBOCtvdHVMZ2d3NVcxMTAvZ3h5SGR1OTJI?=
 =?utf-8?B?aWgvc1FIMmVLUmN2T1orSFhYU1Q3YUNCVGptd3htZVUvT09YZjVxeGNoVzRS?=
 =?utf-8?B?QTVZQTZBQnRmRks4K1JmSFFiUm9wYURTUW1PUU9hdzcwMFpnUERPQlR0czIr?=
 =?utf-8?B?Rzd1U1NwbWYrUTlSdUxCOTRGbEJQMHVaWGxkYWxac0NURGh0dW5kYS9Ga1p6?=
 =?utf-8?B?Q2JkVjNkQnBTNVZtN0s3dXNKRjJIYUpHdjJKWnlGMUlvTTNnblpaUkJnRXpw?=
 =?utf-8?B?Q05zdGcrL3REZFdZNHQ4cWxnVzBGWE1YbmliOWZid3VjYUpUdENvd2lZTnpp?=
 =?utf-8?B?Q0l1b0hkVUo0TzhiSkVsQzdwQlJYTU9wUkZnTlBqbzZJR1BHUWgycjNOUWY0?=
 =?utf-8?B?WkNTSlJ4TFpZWjgvbEliMlJVemZBSTNNM2VHdUE5bDZRTUc1WkhtSkFHN1lo?=
 =?utf-8?B?aG81VFN5akI2amg5K3dkQyt5Ym02MzlUamJ6NjhseGZicXBqeGhjYnNib3lk?=
 =?utf-8?B?ZkZKSENTOHJJS0w3Mkx5OU13UVBEdS9DWUpGYnh6aU56OUsrVWlRak5pUzZR?=
 =?utf-8?B?UkdjK2NQZHhCZTh0UlJqeTlrTk9pUERkaU1GeUc1WlRYNGF3cnBSdDZUTGxm?=
 =?utf-8?B?NUtWTHBOSmhaamtETEswd21XeFlOWit1bDd4cnRtUVJUeUV5L01HWlQvVUxS?=
 =?utf-8?B?NDR4aE1xcDNQSjRDSzZwaHd2cFVUWlhldnR1TUJDSTg1akhOaTNNWEhZTVJl?=
 =?utf-8?B?ait1a2RTZ09admMxZFd0QVA3RmlVSDFRQnI5U2Ewb2FiUVVFS1NYbHRGM2Yx?=
 =?utf-8?B?ZVN5bmpWN2xhdzdpYlNXQkNDK0l6cjFyMEZlNURZbytFQXQrMEUxWHdSOE5H?=
 =?utf-8?B?a2p3ZFFhTHFoWmprTVdLY3NtajV3WTJESzNNdm91SG9zMWVBOVpmZ25jVHR4?=
 =?utf-8?B?bitsNnU0ZVBXaVo2Zyt6OVVMTWJzcEZVV2VySWM0K2hSbC9DNUFVQ3crR1l6?=
 =?utf-8?B?SlR4eCtQM2t6T1oxRFJ2bUk4bmlsZUN5RG5nSUgxNjF3WlNjUUVpd29FbTh2?=
 =?utf-8?B?aHVUc0x2ZSs3OFVzcGFzckI4dEd5dnBERjdjQXBuL1grb3I1c0dlVUQwczlK?=
 =?utf-8?B?Q3FhN1FRMmhMdGdOVnluVFk0c3l6TVpNZlAvMVZ0UVBLMkcwL3ZvLzQ0ZWNB?=
 =?utf-8?B?TTc0ZXhFVUhScGE4MUVaelhkWUtObG9oemhnN0ZDeE5qZ2xFemJNaFBselFa?=
 =?utf-8?B?US82WElpN2Y5V0lkbDNCaFNnYWpRRms2NHJFbmIwRWl1VGFsejF1TUJ4RXlX?=
 =?utf-8?B?amhXd2Y3WHBMalFOY2NEVUs2VlZHYlAxS2xFNGczT0ZaVEs0eEE2SXhoTWZj?=
 =?utf-8?B?QjFsR25iajRTSVdDb280eGxJSW5IZzh6UjFHanI1Z2NGajZCRUlhSkZ3Q2Fa?=
 =?utf-8?B?eVU0ZVpRSjczNnRoYUNJRjJRSEE4TDZMcThlN3RDWE1GV2pRU0xnM2ZKVitH?=
 =?utf-8?B?Qis4RWlVNHlGWDNjYWVveXJsdjFzOEFSRE10TDNOUThheUJTdjJtZnJSWFdu?=
 =?utf-8?B?UHQ4d21CUVNpbUowc2hmc1M1U3RsSFRhbVRDYUtrRkl4TVNYanRnTlprKyts?=
 =?utf-8?B?NWluSG96aWxtZ1Y1bmZGSm9Lc0RPcEdwemxFWHZvZWNheTVlUENIWkttaWFR?=
 =?utf-8?B?UTZVbDRKWXFrSXo4OFdoWGtSUUhvNXlPOWEwSUhTNjcvSnpiS0J6eGtNNVJJ?=
 =?utf-8?B?TkxVV3Zad3F3SzJCZlNzc21CRVJHaXNJVG12dW9WS04xL0VyYWhqcDJIVzlm?=
 =?utf-8?B?MFRxYVFJUWx4dElTMWpzTXBHNzJUdXpLT0Mwbng2b0dxRHdwclpqMHRBU3la?=
 =?utf-8?Q?ad/w2auXcO9raCo8=3D?=
X-Exchange-RoutingPolicyChecked: amI9l8++bVEiOz6zMzhMBC4kwR92Paby7FOaMquz3gJUBO5N9wZe2ijxSxv4tud2GJ2oAAPWRFVjX3dmwtUdBtx2S/yzQwv5Wv27fB4MK2k7vd09yUZlwul7OhJdwxic2WEbppiz0mZiQI/Qr7x8jefl5WSUak8mg/nKWwz80LnlZKGrLN4+LGA7PjEJoJriK6ADmhOFapM4kDpAhTIqeMHcFRv26wEpNtm36ajYOXjJ11YDl4aENGxrmIkgecR6iy3fv3FzAzCUa5g2sWz60Yf2V2FKnzy47gbp+oA/xDVDqRhXkH9zZY5ZD/QI/qyV7p3xvVml0JEV82spC8wOoQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: dd22e6ae-e39b-4206-4046-08de8ab19c33
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 21:00:56.9071 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ebIGB69Jj7kyWJK0WuhaBMSAwrvw8Liwopo9vvtGjxIpR+9EERZ3X6DUS1fnY2Pdl6qYgvnO71FAn2NqGgF4pBrZbRaJObRt+ppyVDreWE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6022
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

Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
