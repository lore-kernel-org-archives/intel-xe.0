Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A30A2D132D8
	for <intel-xe@archiver.kernel.org>; Mon,  4 Nov 2024 14:47:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E50010E459;
	Mon,  4 Nov 2024 14:47:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B+gLyJcu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF11010E0AC
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Nov 2024 14:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730731636; x=1762267636;
 h=message-id:date:from:subject:to:cc:
 content-transfer-encoding:mime-version;
 bh=57wq52U4y4pBO7/kWMsF8WAgoufwy/2x419cq9Yd18I=;
 b=B+gLyJcuW9h/WUWM2065HJMaC07cCXsP/gQypxymwydQXaxf2NXYh0bl
 2IhyEdKX2vRUZkVaOeFo1+IO6TT0oN34fAFVci5r7p9xQ/58H9BelGkyV
 xQjSNmbtRhSfn9S4wKEzFjkjOAhLm3hS3NvLBTJOlwQGq21BkormL/iEd
 dSTqCPEDO49nb2JsPC8nPNB46pL7joK211lomJ6T2M9umn+fTEYHaddgD
 oHPiJ2aoPtn/+VvboAqQLwIGd+kD3/E5nekGhCJujK48FDl3xmUrBqDVv
 GHP5PJHT1rE2LAw9v9xJkcnmnW/uU5RTp2h8u4ynMgktgguqAFj9nwEI7 A==;
X-CSE-ConnectionGUID: MJXb0n4TRKSgLPBqgUBIKA==
X-CSE-MsgGUID: XShJvi4XTYi9jBRH0T1WeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30283847"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30283847"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 06:47:16 -0800
X-CSE-ConnectionGUID: 1FCA6Wb5T+ajgX86HjAvYg==
X-CSE-MsgGUID: 6t/BYHGBRjGIYeSP+s0c4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; d="scan'208";a="83196872"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 06:47:10 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 06:47:09 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 06:47:09 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 06:47:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HhcZ30rOdrNupYywRXTvpEDVpRQvhh2Yx3dh2gOzUbm+b0KLh6JbKhY2hISJZk/iRKRCtPYxLoUGLktdYdbtWfyUBJ536QJjUL76I1DHaDfwivABw+kLXy7HgXp75T4l0FppdG1Mw+LJUWAGzd9MliYmn268TYb0AFiZ28/GibWwFUUBeC7I4HU+prK2PAgTOOncwgUD/9EPuq91+I/93QG/REd3SPdvT/ssnzBZkGwpGf+Eg9aLYMMYBzfLFAOcqKZRTNlwOzQdW3JqNjk2pxhYgRXUQ13OQz3+uAE8AuWK282gAvKJ/0Rszj/HwHezVDA9XgvjqUDxAHJiZBFUTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t276gfZOehMel2BBFD1NIQ/uUajLPH+P0l/xJ/p6CKs=;
 b=wFjsETNwUaCFFccQeeBEvRbdOddOB5xBoZAeT+W9wqk5GM6CBxmedOoe54lwyT9KNE1ltNASWQaFHDDELAt4vAI4GChMS+68LVrsJdAGBh91eksLhGHfGZhfKyRBbHqcC50iiaYlEN0eyLZu7TQd6/ZCRHW5P+TZXsSLl41LALaTOoP9sAlDyT9L9jFyZ1ZY55KljR8X9N6n1LRes801FAYNrsG56CfQFOme4hJDO50lpi3oyE5DcetUW/c1uGb9s9kPhkxKOQgoqbNsqEnVTLXGtG+J1CmDqTzEZfzwcWr0NEH8OjCnr/ENNeYcaKrMDuFk4nj/PC4lSZ5vWDsDMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7014.namprd11.prod.outlook.com (2603:10b6:806:2b9::15)
 by DS0PR11MB7971.namprd11.prod.outlook.com (2603:10b6:8:122::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.28; Mon, 4 Nov
 2024 14:47:04 +0000
Received: from SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::e707:2d60:2891:a02]) by SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::e707:2d60:2891:a02%7]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 14:47:04 +0000
Message-ID: <57d8600d-d048-4819-868e-fc09105c80b2@intel.com>
Date: Mon, 4 Nov 2024 16:47:03 +0200
User-Agent: Mozilla Thunderbird
From: "Levi, Ilia" <ilia.levi@intel.com>
Subject: [PATCH 2/3] drm/xe: Manage MSI-X interrupts allocation
To: <intel-xe@lists.freedesktop.org>
CC: <ilia.levi@intel.com>, niranjana Vishwanathapura
 <niranjana.vishwanathapura@intel.com>, <koby.elbaz@intel.com>,
 <yaron.avizrat@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL2P290CA0028.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::10) To SA1PR11MB7014.namprd11.prod.outlook.com
 (2603:10b6:806:2b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7014:EE_|DS0PR11MB7971:EE_
X-MS-Office365-Filtering-Correlation-Id: 776ae270-70b6-4e1c-f3ad-08dcfcdf8c70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bEk0Qy81c1ZhUFhsck40VmxmMTVWbnJaajArMUV1K01CaTV1Vko4VE9TTllk?=
 =?utf-8?B?Vlo4S295QSs0TGlDb2xmWElBZStnQWpYbGVhRTVvREwvRVlpclBTdlJSNkZ0?=
 =?utf-8?B?MVFZV1hXY2VjWEI1eGNQYjZ1SHZycXZzc01oQjFkQ1l5WmJEaHFTWERRbU9X?=
 =?utf-8?B?eW1LdlMvcDdzMWNZLzA1TlBjTEdoNk1CUlBrWHVwVkZvQ1RLYUZMRkYraE90?=
 =?utf-8?B?TVRkVER0eHpvMmV2bjNUbTV0MzdDdC9OZHdlTFhtaER0aVZDaFVZa2NWRDY5?=
 =?utf-8?B?cmtTeGJFNE1kekQ4cFZmelFhcTEySEdOSlRRTGFjSDFjY1NtZWRRclRYV0tH?=
 =?utf-8?B?YWdlLzg1ZUVVZjNkMWFoVlNCWlc0c2hUOWxWTkdXS0NKd21oME1JUlVzNGtY?=
 =?utf-8?B?cVN6ZWFaZlA4ZTVWZWhDd25sUW9ZSU56dUVoT2xMTENERzNML1lhbk9xbnNs?=
 =?utf-8?B?ZDFIYndwTXoweFFUdmpCOXprdzJUcDFRSFRhc0sxSHBKbjRoY0p0UitDbUxt?=
 =?utf-8?B?SDJGbVBTYmF2L1hRdXZabE9UemQ5ZlRUajByOGc4c1U3VHlxejVJenlzR0lO?=
 =?utf-8?B?WXh0MWZRUXhwdUJERkRmK3dRNnV6d1p6L3RSc3JYdHg1T2t4cHRDc3p5dGJO?=
 =?utf-8?B?empYZ1JMdEUzdndVaE96N3dGMGNrSGxVV21najRNSUlLMk9HU1RDS1NFYzU0?=
 =?utf-8?B?UGhrMXZtZ1Z3QjdyWmdEOG8zcnVDNnUybklnbWxSRDNPcmJmbmN6SVdEd2Jq?=
 =?utf-8?B?NGRwZG04YnZSU0MzZkZWbkdlUzRXbExNU3ZCc1lOb3cxV0hQOGpSVUludGc3?=
 =?utf-8?B?a0E2S1liSjU1YmUrak53bCtEcTZONzltTHlEQ0lERzczWkRQaGZnQ2NDLzJ5?=
 =?utf-8?B?NkJGRzRBdkVaOXJWYzRteHJOUjBocW9Dd2IwSDdxRHdhalZvenk5T3l0M29o?=
 =?utf-8?B?d0l6UmtBQytQRkkweFpzeXNkdk52ck5vbUw4bVZacGd5WjQ5empRNjVrZXRO?=
 =?utf-8?B?dHNQTk5uMFBvUXBIQzAwSldUQktJNW43SGE1bXJ1R011Z0hqb1Fxb0RLTmZv?=
 =?utf-8?B?V2JsdG9EV2ZMT1owTWhyQUhVWUd1Tnp4MnpMMXhnMHdtVlMrdFpWRENJUklr?=
 =?utf-8?B?SDFIR2lOaTFVYUlsWE5TNTF0NVcvbUdOeEIwKzR1RHptbWkzSEQyVFFKU3dN?=
 =?utf-8?B?dmJnblpPTElzYnJRRWI4bkNUMHErV2RJQzRzQXJzNVBFRElIK3g3emRMWTgr?=
 =?utf-8?B?N0gxWVNtWkRnSjIvM1Z0bkxkNUhOcVpQOVVHakxHMWlkVkJ2ZGxiQXZBckpQ?=
 =?utf-8?B?UlI0clZJVG1Ob0dDQ0VNOW1WVU5UNU5MMWNxTzVaQWl1cFNuWmJNUEErSGFz?=
 =?utf-8?B?ZnVlbllUNlhQSHZsL0RmQ2Q0Vm8yS2wxQ0JYWFpXbXVoOCtrTEJVTjJTRWlh?=
 =?utf-8?B?YWxXcE1rTnhzMXE4ZUx3SE1sTWhtNWRYN1lPM1FnUnN0aDU5cU5NbGdwZlU2?=
 =?utf-8?B?dzNIZE9QQzloeHlORldLT2JLaXhhTkRXU2U0ZjZCell5OTUvMnIzczFwbnRi?=
 =?utf-8?B?M09BNzRqenFQTHJLSFdCRDlxQzJGY3J5S1Y0VVRBQ1FaSDEyU0Q3OURqRFNQ?=
 =?utf-8?B?QXNKTjVhSmszRTliV0xtditMMzQvWVkxNVlrOXZOYWtjTW5VNXpZdUMycUhR?=
 =?utf-8?B?Kzd1djdKTENwdDUzTlZsYXl4czZkVlk4TFFMbWV3aFlIbTZCSnlWcW5tVWh6?=
 =?utf-8?Q?kBJWkFY266lW69Bae3x4XXNCgrXE5rUV/LrIFwc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7014.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEZ4UFJFVGc2ZGVleHdwVHNUdU1pQ1dJWXIyK0RKVkVhYWVUNU1IbndNV1RZ?=
 =?utf-8?B?QkkrdUdaZ3VROXJnYmVkRjRBaXRiMkV4eUdaNGVmU3FBaExxcEhpTkV2S2Jk?=
 =?utf-8?B?Yy9uNE5abWl2RVZMVmt4dnZCYU85NElCQm5udGFqYkhzOC9hRnM5SU1ESnhC?=
 =?utf-8?B?NWg4VmNGRVNvc0pGSUtBQmw1L3YvZWZPZU96bUY0a3J3NkdCRUIwM0RrSWtJ?=
 =?utf-8?B?cktiTjVKbWZuUjBxRk5QdzBZQm9qKzdMZDZKM2l4UmdtMFVzVk8ycGVpQWc3?=
 =?utf-8?B?VzJIeGQ2ZXREblVhdVloVzcrMXNrd1J6amRWaHV5bjc3djlqWFBVallLcUtN?=
 =?utf-8?B?Q00ycTNieTM0SjgxRnhHalhSdkVLVy9BWFRhTlprdXQrOUFHYWdhbllyTElF?=
 =?utf-8?B?YVM2OFhmRkNDQzhXNzZraUtGbGd2MDlwMVd6b3VhdnJoUkl6MVRTcU5ZaURC?=
 =?utf-8?B?VHJFdEpjcCtwUFFrQmV6UlNjVGhtYjF1dmU2TXF5eWNuYlFxUUgzb2U1MThv?=
 =?utf-8?B?cS9DcFUrdmllUG1oQW9MMGlsNnJGOE5hbDBXTUNVS0ZIdTFwNTJoYkY1VXQ3?=
 =?utf-8?B?bG9Xa29JakhMSWRsMjdubUowZ281c0xSdlo5aGlDUSt5NjA4ZzlqQksyVzdI?=
 =?utf-8?B?WUlHNGdRYVJoSld0ODQrekJFOVQzeGFIUEd2VlJzOHVydm5wZlBlL1lnZWZJ?=
 =?utf-8?B?RXRTVVl6dUlYNkZqZHdVNmNRWnhMS2cweXNMUXFQTUsveDNTV2MrNEEwdkVx?=
 =?utf-8?B?NG5ROHRHWFloczNyeU1LTzE5Rys4cThtMXV0alI3S0R3cnJ6bVRyMEZaMXBk?=
 =?utf-8?B?dm9xc2pZeHBTb2xkOWNtK3BObFFnWjdONm9SUHhjT2sxTS9SUlErNHFhbnM4?=
 =?utf-8?B?VzU0TmhHWDNHRnlIbjh4NFZzWFZYMERFVGkvSWlQelRYY0VmU1RWNStzaTcz?=
 =?utf-8?B?SThCa2FRdll3K3ZrVGFVVlZQV3d0NWhwRzdyNXJTRFpCdjNTaTBjRzM3VkZX?=
 =?utf-8?B?RlVwMkZPWXlLdEh3UXNkNlJOSkt2WVJNSi81ak9RbXlYOVBPcnF4QkgyYklK?=
 =?utf-8?B?VTQyVnZPNE1VTWtjamh2YVJ3bU5QVTRFU0Z5Y00rYU42VkNJbEgvNE04UWRQ?=
 =?utf-8?B?NmI3MnlqS3hGaTNwVkV3NVU2R3l2ckh3Q1ozVEZHQjJVRnhQVEJoUkpOeVpo?=
 =?utf-8?B?OC9iQ0NSZnh3ZWw2OVpCVDg1Qk5MKy9nNFJJYTk1U0lnS2t5Wm5KQnVRWm5S?=
 =?utf-8?B?RmtKV2dienBiTGxiaDBtY3kxRkgreCtZaVdNSEEyQ2d3ZndpMWs4c0c1L1RV?=
 =?utf-8?B?VlFQVlRuOVN3UE5jS2RTdnhJUHQrb1hWZXZ3SkM2b3NQWnEzUC9qZCsvampH?=
 =?utf-8?B?UDV0UGp1dDJkb21qZVEyQWM5S29uTFNVVG1oSnRNaDRDbXpxNmZjYzJicGQ4?=
 =?utf-8?B?UHpTZ0hGc2MwWFFiQ1kxZVdMaWdQdGZlVzhTK2RzZUR2YkJsY0Z2azd0T3pp?=
 =?utf-8?B?aS8vVWM0RkV4ZlEyY2MzYkpxUDYxS1gvZjdkZVZvNEpiVDdDdExjV1cwUXhE?=
 =?utf-8?B?SEhJVGdHZ0t2TWZPUG4xMmdpRzJLQjVNcDZYb0V2eVlXVDY3Q2FlUWo2Um5M?=
 =?utf-8?B?bG05TXVTSFM4cVgzNFJzZDJIdmxUbkhzc0FyTU9UcHZJZ1B1dlFiT3hFVEFI?=
 =?utf-8?B?SHRLZlM4cFIrSnltVERubnQyZXl1bmdwVmdFYnFHSUxuUDcyc3A4cTU0dG5G?=
 =?utf-8?B?dEloOG9mMDhzaitDVFpmaWNmTStLMzZhVk1iNzBhakFJNEU2SERUTUtjZnJq?=
 =?utf-8?B?WW5LK05CMytqVlFId3ptMzFneU9Va0pyNDd5MUpWaTNFK3FJWjFSbkZQWVZh?=
 =?utf-8?B?V284djhXYStRWGJxYjZiQ0hSMDR1Rlc3NXFiOEttS2t0MkFQdDBMRVJiWkJE?=
 =?utf-8?B?Q2pGV3NQT2FZaHFrTDlKU1RnYlNqaG9hSE9SSDlDR1FOenRUaHJqeUc2U3Er?=
 =?utf-8?B?ZmRiU2dabnBzS2oveWZmNnZ2SlVOTXU1WDRwUXZISlh1KzBPbkpXTklVU2NS?=
 =?utf-8?B?TGpRNEhBWkk3SC9YejVFOUY4QU5tVGZkVklBR0wzWWhSQTJWRWw4WXVhcmh6?=
 =?utf-8?Q?ZDUQdkR2QcI4Y+E2lfatwMEY6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 776ae270-70b6-4e1c-f3ad-08dcfcdf8c70
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 14:47:04.6485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ITTB4GAjB6H8/UZJHTTIegGLTTcGpijErr5/NOtxLoskKfF1mjpLpEBC5hauRFGiStKQYqsIcID9Qj8qOSc6Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7971
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

Expose functions to request and free MSI-X interrupts.

The request has two flavors:
- Static MSI-X allocation, for known MSI-X interrupts (e.g. GuC-to-host)
- Dynamic MSI-X allocation, which uses the next available MSI-X interrupt

Signed-off-by: Ilia Levi <ilia.levi@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  2 +
 drivers/gpu/drm/xe/xe_irq_msix.c     | 90 ++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_irq_msix.h     |  5 ++
 3 files changed, 80 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 8237bb1474c6..c7a695741feb 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -355,6 +355,8 @@ struct xe_device {
             u16 num_of_interrupts;
             /** @irq.msix.default_msix: Default MSI-X vector */
             u16 default_msix;
+            /** @irq.msix.indexes: used to allocate MSI-X indexes */
+            struct xarray indexes;
         } msix;
     } irq;
 
diff --git a/drivers/gpu/drm/xe/xe_irq_msix.c b/drivers/gpu/drm/xe/xe_irq_msix.c
index dac339ba5ed2..f873bcfe5283 100644
--- a/drivers/gpu/drm/xe/xe_irq_msix.c
+++ b/drivers/gpu/drm/xe/xe_irq_msix.c
@@ -24,6 +24,7 @@ void xe_irq_msix_init(struct xe_device *xe, int nvec)
     xe->irq.msix.enabled = true;
     xe->irq.msix.num_of_interrupts = nvec;
     xe->irq.msix.default_msix = DEFAULT_MSIX;
+    xa_init_flags(&xe->irq.msix.indexes, XA_FLAGS_ALLOC);
 }
 
 static irqreturn_t guc2host_irq_handler(int irq, void *arg)
@@ -66,8 +67,32 @@ static irqreturn_t xe_irq_msix_default_hwe_handler(int irq, void *arg)
     return IRQ_HANDLED;
 }
 
-static int xe_irq_msix_request_irq(struct xe_device *xe, irq_handler_t handler,
-                   const char *name, u16 msix)
+static int xe_irq_msix_alloc_vector(struct xe_device *xe, void *irq_buf,
+                    bool dynamic_msix, u16 *msix)
+{
+    struct xa_limit limit;
+    int ret;
+    u32 id;
+
+    limit = (dynamic_msix) ? XA_LIMIT(NUM_OF_STATIC_MSIX, xe->irq.msix.num_of_interrupts - 1) :
+                 XA_LIMIT(*msix, *msix);
+    ret = xa_alloc(&xe->irq.msix.indexes, &id, irq_buf, limit, GFP_KERNEL);
+    if (ret)
+        return ret;
+
+    if (dynamic_msix)
+        *msix = id;
+
+    return 0;
+}
+
+static void xe_irq_msix_release_vector(struct xe_device *xe, u16 msix)
+{
+    xa_erase(&xe->irq.msix.indexes, msix);
+}
+
+static int xe_irq_msix_request_irq_internal(struct xe_device *xe, irq_handler_t handler,
+                        void *irq_buf, const char *name, u16 msix)
 {
     struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
     int ret, irq;
@@ -76,17 +101,41 @@ static int xe_irq_msix_request_irq(struct xe_device *xe, irq_handler_t handler,
     if (irq < 0)
         return irq;
 
-    ret = request_irq(irq, handler, IRQF_SHARED, name, xe);
+    ret = request_irq(irq, handler, IRQF_SHARED, name, irq_buf);
     if (ret < 0)
         return ret;
 
     return 0;
 }
 
-static void xe_irq_msix_free_irq(struct xe_device *xe, u16 msix)
+int xe_irq_msix_request_irq(struct xe_device *xe, irq_handler_t handler, void *irq_buf,
+                const char *name, bool dynamic_msix, u16 *msix)
+{
+    int ret;
+
+    ret = xe_irq_msix_alloc_vector(xe, irq_buf, dynamic_msix, msix);
+    if (ret)
+        return ret;
+
+    ret = xe_irq_msix_request_irq_internal(xe, handler, irq_buf, name, *msix);
+    if (ret) {
+        drm_err(&xe->drm, "Failed to request IRQ for MSI-X %u\n", *msix);
+        xe_irq_msix_release_vector(xe, *msix);
+        return ret;
+    }
+
+    return 0;
+}
+
+void xe_irq_msix_free_irq(struct xe_device *xe, u16 msix)
 {
     struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
     int irq;
+    void *irq_buf;
+
+    irq_buf = xa_load(&xe->irq.msix.indexes, msix);
+    if (!irq_buf)
+        return;
 
     irq = pci_irq_vector(pdev, msix);
     if (irq < 0) {
@@ -94,24 +143,25 @@ static void xe_irq_msix_free_irq(struct xe_device *xe, u16 msix)
         return;
     }
 
-    free_irq(irq, xe);
+    free_irq(irq, irq_buf);
+    xe_irq_msix_release_vector(xe, msix);
 }
 
 int xe_irq_msix_request(struct xe_device *xe)
 {
     int err;
+    u16 msix;
 
-    err = xe_irq_msix_request_irq(xe, guc2host_irq_handler,
-                      DRIVER_NAME "-guc2host", GUC2HOST_MSIX);
-    if (err) {
-        drm_err(&xe->drm, "Failed to request MSI-X IRQ %d: %d\n", GUC2HOST_MSIX, err);
+    msix = GUC2HOST_MSIX;
+    err = xe_irq_msix_request_irq(xe, guc2host_irq_handler, xe,
+                      DRIVER_NAME "-guc2host", false, &msix);
+    if (err)
         return err;
-    }
 
-    err = xe_irq_msix_request_irq(xe, xe_irq_msix_default_hwe_handler,
-                      DRIVER_NAME "-default-msix", DEFAULT_MSIX);
+    msix = DEFAULT_MSIX;
+    err = xe_irq_msix_request_irq(xe, xe_irq_msix_default_hwe_handler, xe,
+                      DRIVER_NAME "-default-msix", false, &msix);
     if (err) {
-        drm_err(&xe->drm, "Failed to request MSI-X IRQ %d: %d\n", DEFAULT_MSIX, err);
         xe_irq_msix_free_irq(xe, GUC2HOST_MSIX);
         return err;
     }
@@ -121,14 +171,20 @@ int xe_irq_msix_request(struct xe_device *xe)
 
 void xe_irq_msix_free(struct xe_device *xe)
 {
-    xe_irq_msix_free_irq(xe, GUC2HOST_MSIX);
-    xe_irq_msix_free_irq(xe, DEFAULT_MSIX);
+    unsigned long msix;
+    u32 *dummy;
+
+    xa_for_each(&xe->irq.msix.indexes, msix, dummy)
+        xe_irq_msix_free_irq(xe, msix);
+    xa_destroy(&xe->irq.msix.indexes);
 }
 
 void xe_irq_msix_synchronize_irq(struct xe_device *xe)
 {
     struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+    unsigned long msix;
+    u32 *dummy;
 
-    synchronize_irq(pci_irq_vector(pdev, GUC2HOST_MSIX));
-    synchronize_irq(pci_irq_vector(pdev, DEFAULT_MSIX));
+    xa_for_each(&xe->irq.msix.indexes, msix, dummy)
+        synchronize_irq(pci_irq_vector(pdev, msix));
 }
diff --git a/drivers/gpu/drm/xe/xe_irq_msix.h b/drivers/gpu/drm/xe/xe_irq_msix.h
index 9c36d11f05fc..a9c8ce18172e 100644
--- a/drivers/gpu/drm/xe/xe_irq_msix.h
+++ b/drivers/gpu/drm/xe/xe_irq_msix.h
@@ -6,11 +6,16 @@
 #ifndef _XE_IRQ_MSIX_H_
 #define _XE_IRQ_MSIX_H_
 
+#include <linux/interrupt.h>
+
 struct xe_device;
 
 void xe_irq_msix_init(struct xe_device *xe, int nvec);
 void xe_irq_msix_free(struct xe_device *xe);
 int xe_irq_msix_request(struct xe_device *xe);
 void xe_irq_msix_synchronize_irq(struct xe_device *xe);
+int xe_irq_msix_request_irq(struct xe_device *xe, irq_handler_t handler, void *irq_buf,
+                const char *name, bool dynamic_msix, u16 *msix);
+void xe_irq_msix_free_irq(struct xe_device *xe, u16 msix);
 
 #endif
-- 
2.43.2


