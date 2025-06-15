Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D544C61CE8
	for <intel-xe@archiver.kernel.org>; Sun, 15 Jun 2025 03:48:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34C1410E04A;
	Sun, 15 Jun 2025 03:48:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A29e1dDT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7780010E04A
 for <intel-xe@lists.freedesktop.org>; Sun, 15 Jun 2025 03:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749959307; x=1781495307;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Mf7N60fWeDtR9Veu8lFMjt2MpI2CCqelJoER0HSatP8=;
 b=A29e1dDTlzYZaBAk4azqT0duqiN2oShA/FZwOJxCe5+EmADXMIRZHH31
 xw93vmD1uTvoZa6wbXd9LIgSZg4Eqg3jfVFIl2KHvo8O7npSOCK7nPOlt
 YVH0FJvLL5sQO3qGVk20MgMCSDW3zE0Bpkfw8BZ9koN1eQzBfw8YTAfFV
 RqMfaJZ+gVolnnORN9Gr+oOpDgObdhY3/zMaAzIujMjhnReu/8NNsbf8V
 wgmkgkcvAp2MGaRYQbJ9FaNs8Z5uuXISj6l5uhm9inPwGxlYw3IYAJ+s0
 L+wh+UHJOl4mdW9d/Jjy9YbQVpOL1C1kKiDdvWmXzJ3H/UhP3tEs6qmOz g==;
X-CSE-ConnectionGUID: VsBlv7yKQVih5Qpr3i7xqA==
X-CSE-MsgGUID: gxJC7NTxR8qA5HJyncPhkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="52000588"
X-IronPort-AV: E=Sophos;i="6.16,238,1744095600"; d="scan'208";a="52000588"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2025 20:48:26 -0700
X-CSE-ConnectionGUID: PniQlW9dS/qE1Xa94O+L4w==
X-CSE-MsgGUID: Mdzz8qgISLmaxxCx53QqXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,238,1744095600"; d="scan'208";a="153054662"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2025 20:48:25 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sat, 14 Jun 2025 20:48:24 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sat, 14 Jun 2025 20:48:24 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.58) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sat, 14 Jun 2025 20:48:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LP7ztLaOrgJ0VrZJdwIYJbhIFU/s2Kx4zg+2J1h8M6zr1NYqVl+KH+qln7o/UvFOQI9ZPwewngUNTk6eGRwgAmUmAwb5SVKgvTlgTnThNuVI+DahEtyaSNk4QLsMoASDnxmDOdr3gQ7zWp9jgWEGNd2M5cGtpISLZ0ybwUl6J0+GEEGnzIPTU3CP6H4YVzc1jXWeTqq8es9Ud/50wgOV7c3cxHf/yF7E6VNQOjLUgkN54nbySPN2+O2+H2s2kOtMmvLvdP3tBTnJ0Y6zUUvNj4iyXap9EHguadeWhLt6tEn8ziJet7tY/VdHo8QgZyS0JKJUW4QTg6pePC6Ch2cZvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j6Pf5YtX+dZmigIQUcmkuMKLWw7gpRVkbDJSp4pk98o=;
 b=m2vg10+nI3W9oP8eeJ0ESipjxRcJl8yewcGPYkCjUZwS0wrLHuzRXT/vtTZbiOZ8KxNE+ChxpG5uPFBa/MHTD9ibnKMwAPrQtPlHsIiXBOjeoI6QgSNCiNgXD248WHCiqfV4UkDGKeMnSat7Nhp8jLzeKOq34D+ZDj36PANEj3GNk22Yccw6/u7wlEYgX8vjcnZp473dKEBkrbVPeBlQ6OgyEcMbHauIiplV1YNBy+5tpaO7FFst00pcI8bd09EtL0M/u8uOtYqj5Wsnwz8tnfGTs1v4CjA/kZd25L7n2jZam3PcOyzTKh5+QTrDjr8D4OqpD1fhiqiy+OakHmqdaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB6915.namprd11.prod.outlook.com (2603:10b6:930:59::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.24; Sun, 15 Jun
 2025 03:48:03 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8835.027; Sun, 15 Jun 2025
 03:48:02 +0000
Date: Sat, 14 Jun 2025 20:49:38 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <francois.dugast@intel.com>,
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH] drm/xe: Use TLB innvalidation context for invalidations
 issued from bind queues
Message-ID: <aE5C0n0JF+PXfht2@lstrano-desk.jf.intel.com>
References: <20250612214041.235258-1-matthew.brost@intel.com>
 <8beb96d239da664ecb2289ec6ae4369fd6c92685.camel@linux.intel.com>
 <aExNNmqE8eoem00O@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aExNNmqE8eoem00O@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR04CA0246.namprd04.prod.outlook.com
 (2603:10b6:303:88::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB6915:EE_
X-MS-Office365-Filtering-Correlation-Id: 17b2c3dc-2992-4297-9427-08ddabbf6dc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WHVlamlITW1BUDJGUkJFNDEzcTVnMlRJU0NPOFhIbVNrcVJ2dXdsdXZuWjh2?=
 =?utf-8?B?U3B4Z1d2VHozb1lZRytHbmExM2N2dnd2c1ZUaktZLzhSeGZHamRrNXU4bEZj?=
 =?utf-8?B?alhDZ2FqU2lMQ3orbnZQMnd5bjEwdytlOHlGOUJEVTh4eDNPc04xMjlrQ0VN?=
 =?utf-8?B?d1o0VDhaOWMzTHEzOU5Eb09aZzl1ajZ5eGNtOVpmOTBoOEJZZXIreW5WeTgr?=
 =?utf-8?B?a1BmTWlnR3FFTDR4WWJKcTFET3lqSVdQNSt5Y0ljVzkrTjd3a3ViV2dScytZ?=
 =?utf-8?B?MXVkUzNLcUtkMWdRS0paOCtjK2g2TXcyWlkzbEhnVUR5NTEvODQ3OFhZYmd6?=
 =?utf-8?B?NVkvM2R0M3FNM21QWnZPVzhKbUlIM1JTeDNuaFJEYnYwOUNBR25GZXQzVDcr?=
 =?utf-8?B?eWowYkZBdXphTlNuSWJoOGpsM1MyTDJFcVhvVkMrMjJnajZXbTV2OHhwb0VN?=
 =?utf-8?B?TGl0dDUyQ0sya3hjRzZBa3c3RWxVa2o4Y2xoWTRXdklZZVlVS1JHYWhpQWx6?=
 =?utf-8?B?S2h2NkQ4b1AwaEI5M25yb1IxMDlNMXQ0cnNqaWNOVVlVM2VzeVI2N1FXUndM?=
 =?utf-8?B?dVBEOHZIRGRtOS9ieWlldVdNbUNRN0U4cXMyczlkL1ZrR1RZR3N3c090b3BD?=
 =?utf-8?B?ZFFJSXVlSlU3MTltc214bHEzL3VVYjFaa3k3cXVOSTM5eHBsRXo4VEw4Snpk?=
 =?utf-8?B?bHllU0N4V3pjdUhMNmplZVQwYWxGSUs1YTR6MmlLazN2RG5pTXhOUjRDVzd2?=
 =?utf-8?B?M1VTZmpuNU1GTjFaNjRXbnQ0eUJtZUF4UjNFcXVQQmZFRGV1a3FzTmE1Wmgv?=
 =?utf-8?B?V25XcUJ6MlQ0RThqWWEvTVQvdUZZbmVmOWoxSDhDTGE2WGZ5WnNHbU4rZmFy?=
 =?utf-8?B?QlA1UWNzbCt0SzQ2MTkrUG1KWFF2dkdBaGVpOExnUHJycGRvaER6M0U4R2dR?=
 =?utf-8?B?YllGQXVtRmIraGZ3eFl2VnRMSVE4endHMUFNY2lEcndOcDhVZ1JqNFV1YXRy?=
 =?utf-8?B?WGFsNDNWVVpyYW5aQ2RLQ0JOWkk2YUxFSHdlU2htM0srZzVLdmNiNGlxcGRH?=
 =?utf-8?B?Y3Z5Vk5NTFhjWko1YlJIUlF4RGdVWmhsWndzbURKd2o5ZW5zOEJYZ0p2V3o2?=
 =?utf-8?B?dk9XdkFjUlJSc1NMQmd6Nk9ReXFzb3duRGMwVDN1VUdBWFdHN0tPU0k0V2Vq?=
 =?utf-8?B?SmR1NHhGaHZ1WkdaOTdwTlkzbGxFaEF4U1JvMks3R2dnRnR4UG9DVDhXMzhx?=
 =?utf-8?B?dmdraEppYk1UUU8vbDA5V3BZTHpZSHJNc0tqb3JlbTM1RUhKSnVVdmJJZFk5?=
 =?utf-8?B?ejNUL284d0c2N0hNb29rZkVLaW50UE95SVUrMC9NNkg3cVBWZ3kxMGJEL285?=
 =?utf-8?B?dUlMN2NEUkV2MUpqOGo5ek1SMU52R2RYUUI4bURjZXJIKzUzZTAvVkhlVE1S?=
 =?utf-8?B?TlhYKzdOZC9xeW1CWXVIK1ZEbjZKTis4QmVuYlRjN0pnSVpVMGI1MERwRGVt?=
 =?utf-8?B?TWJBRWtOd2dIUlpuTXJKYTF0M0h2MUZPYzZZWjBncUJ3dVVPUVdXS3RKV2g2?=
 =?utf-8?B?Y0QySnJPL0k5aGpqbEkwd3l0YStpRTNGTmsrZzFVZ1FSaXYxWkFFUmV2alJj?=
 =?utf-8?B?TjVEY1N1T0dmVXQwQXRON3ZJeTExWDJNUlgwYk15TXE1Z1ZGcUJteEQ3L1RY?=
 =?utf-8?B?eFhkbXd3WXhHOXdiUjR4OWVQNEFDSncwSTUzaW03ZmFuOUQ3MmhqQXQySVhT?=
 =?utf-8?B?UjFSOHc5NHRpdUpFdFFFNlgzVmNJVjlIQzE0VDlFT2k2cmRxalJvV1I3SnZN?=
 =?utf-8?B?VytIZGRNWVJZQjBwM3IwQ1lLdTYyeXVJZDlsaFR0Z3Z4RS81S2dDcW1wbWhB?=
 =?utf-8?B?RUdmUUQwT0dPWGFqSXV0MVhYTUdkY2lsb3lZK25wa29wYmNGenFDeVhFUFp4?=
 =?utf-8?Q?N0WAZGUOAvg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUdEUkNFVXZ0enNqdFB1TWxQbmNLbGZUZFpoTGtuV3M2anpHMlNKOG9zcGZi?=
 =?utf-8?B?elpFUVk3Q1JsZnRIaHgvUWNWVThKeHNpZkMrZ1JDL0dCZFRsdlR4SUdhS000?=
 =?utf-8?B?VElkeUVRMnpQcXp3aStWTVA2VUU1aThOZnhQR3Ayc05Nd2pUNkd3NG8wZy9Q?=
 =?utf-8?B?TXNXbFJ6eHFjVThKaGUwYnJGSjlRdVBUekJydHE0SXg0RFlQMy9zUk9mMmRY?=
 =?utf-8?B?RFpwNDdpTjRBWU5WdnZ3eVhjVzlzTmZ3VjBXai8yWGdCRVExalFpQUE1ZVp2?=
 =?utf-8?B?ME5GbW1xSlJEOFNnNlRGdWIyT2RuZHE4cWl6UUVUeFgveGRmQ0FXaDI5eU5w?=
 =?utf-8?B?dGl2OEt0cFZOOVUzQlZEQm1WZHU3anh1Rnp5T01rajhWVWdjVmlNaWdoRklr?=
 =?utf-8?B?N2RVVGJNeU9jTERmOHdsVG01ZXlqUlp4NEV6MXNQTStqRHpLSzI0VXNERHh3?=
 =?utf-8?B?TzUzUU9zZUttQVN5NlRpYnIxb1dISlBTUkxuNkxiZys5TzV3Yk5MaTNQaklp?=
 =?utf-8?B?ajJQU2FxMmN0RTBVUzFNT0c0S0JSTkMyLzlGdEZSR0VZSkErcjUwS1JqbERp?=
 =?utf-8?B?bnZRaWxoWG5hV3I4blRwUW1RSnRZUllvWDNtZUhScGM4Zk13empOSmdVT1NJ?=
 =?utf-8?B?TDR0WVZ0cWZWdE5iM25Ea2srQ0FadjY4TXlGeHZOWThEUWlQZ0VhOFFTUUgy?=
 =?utf-8?B?dEFEQ0NlZXVISmZlcnZQRDJPdTVkNUF5eFhGWTZ4Ym1jZEpvdXpnVDA4V3Zo?=
 =?utf-8?B?WkY4alBjWi9lc25aeWJhQXdEVk9Bd3JhNE5DdXBYNUJnSEVtcWdHeU15dS80?=
 =?utf-8?B?K2w4cEtNV0JhSWwzZlppTk5BNVlUWldPNlFDampQQ0lpT0p6S3VDMS9zTzRm?=
 =?utf-8?B?T3k2bjJXMWYwYzlqb0svTlcrS09EUDRYRGsrUXdhMkVaVUxVa2ZmL3RZYkVh?=
 =?utf-8?B?OFhiUDJtVWlUcUZBQTRGZWh5eXdNRCtxN0JtNDVxeklRWWxsZlEranJxa1Nl?=
 =?utf-8?B?TzJZSlVWNTRpZDlHS0JOVHg3ckhsUVB1Q2FMK2V4R2Q2cHc1b0dtQjZyZU13?=
 =?utf-8?B?dW9ZWVZkWTlaT1pNVmtLeVJrWWR3b2txeDl2cVBsdkN5VmxzcFFUb2FhL2Zs?=
 =?utf-8?B?YXdKUDYxRXJMNHJPS0d6am0vd3kyWm1jYzZicld0NTBTeUxzUGdoSnJmdzds?=
 =?utf-8?B?eVRFdE43bUFZWk9EWEJUanV1TVdXVS9oemxUUVBaY0huL2pWaGc0QkxFbzBC?=
 =?utf-8?B?TW5lQjkrTG92TjBQelZxOUR5KzlkZEYxc3V2Y3ppMTlCQmxmakl0MWI4YVZY?=
 =?utf-8?B?cGZyZENGMnpwUmJ6cGt1SGN4ZVEwUFErSDY5WG1HWWdMSUhCekI4RGVLQUIv?=
 =?utf-8?B?M1dIaFg2N2t1R1RYeExVQlVycHFkd3QwUlpIaVF4RDlFWW1rSlJUVjllck45?=
 =?utf-8?B?TVB4UlQ4K1dnbVhQSHRKZm56QTAvOUtIbnV2TUtNMUdPOHJUZkxCbWZqalpW?=
 =?utf-8?B?eDhxeFRjUFB1VC9OQm5iYTBFcEd3R2dhNUpTVVJUSE4xYkgrSENxK0ZNSTJa?=
 =?utf-8?B?U1RsTW5zcmt6M292c2w2bHNsdEtLSktOSXBOeUMxVTBVcmsrVWJ0WHloc3JM?=
 =?utf-8?B?RGRjemx0dDNMLytnUGlXd291ZHJ2WXZuOHlNTHg5VG04MUVFTjMzODE4MzE4?=
 =?utf-8?B?QXduWFhwdktFZittMGVabDVWcHhEMjN6WHpXM0pCLzM3MkpCOC9tVjdiL2ZW?=
 =?utf-8?B?Q3FCaHFKV05nT3VkOTcwaDFYYVpxNWFTYnpHN1FwZy9NREp2azQ1QzRhS245?=
 =?utf-8?B?ZW9YbTFmUk1rZlRMb1YzNG5hOG40SEk1ZG11N05MUUpKR1hJOTFqOHQ0blFs?=
 =?utf-8?B?WG5CVFc0SzNiS0xMM3hmYndlNUh2enB2ZW9HSkgwMUh3QUFqUGVWZzVIRUpB?=
 =?utf-8?B?bVNxOFFZeUQ3eGp4L2paRzA3UnlLUGc5MkZyNHB1Ym43R052Qkhwbnpqa3dP?=
 =?utf-8?B?ekdSb1lTbnMvREFQcGhQakNiaXhzK3k0YVRmNml4VkZERFk3d2xWakpYRG5D?=
 =?utf-8?B?UlByK3BNZTVUS25kZEpaVEcyUWE3MW8xRTFTNk44anl0dE9Sb1R1MUVTa0dn?=
 =?utf-8?B?a3ZaYTBoRWVaVW1rVmMxa3h0cUttRGZhRWJla1hWOHlVOXdLUFd4ZmNHdzlV?=
 =?utf-8?B?T1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 17b2c3dc-2992-4297-9427-08ddabbf6dc3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2025 03:48:02.7212 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: srw4sZafKNxGnV5cc0kMQyNGCpowpPvaAw9fYp83XTS/0Vhan0vPlzsFRSKvfKGAWygQGeLj5qt94tw7i4HmLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6915
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

On Fri, Jun 13, 2025 at 09:09:26AM -0700, Matthew Brost wrote:
> On Fri, Jun 13, 2025 at 10:40:19AM +0200, Thomas Hellström wrote:
> > On Thu, 2025-06-12 at 14:40 -0700, Matthew Brost wrote:
> > > In order to avoid adding tons of invalidation fences to dma-resv
> > > BOOKKEEP slots, and thus jobs dependencies, when stream of unbinds
> > > arrives (e.g., many user frees or unmaps), use a dma fence tlb
> > > invalidation context associated with the queue issuing the bind
> > > operation.
> > > 
> > > Two fence contexts are needed - one for each GT as TLB invalidations
> > > are only ordered on a GT. A per GT ordered wq is needed to queue the
> > > invalidations to maintain dma fence ordering as well.
> > > 
> > > This fixes the below splat when the number of invalidations gets out
> > > of
> > > hand:
> > > 
> > > [ 1661.638258] watchdog: BUG: soft lockup - CPU#2 stuck for 26s!
> > > [kworker/u65:8:75257]
> > > [ 1661.638262] Modules linked in: xe drm_gpusvm drm_gpuvm
> > > drm_ttm_helper ttm drm_exec gpu_sched drm_suballoc_helper drm_buddy
> > > drm_kms_helper x86_pkg_temp_thermal coretemp snd_hda_cod     
> > > ec_realtek
> > > snd_hda_codec_generic snd_hda_scodec_component mei_pxp mei_hdcp
> > > wmi_bmof
> > > snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_hwdep i2c_i801
> > > snd_hda_core i2c_mux snd_pcm i2c_s      mbus video wmi mei_me mei
> > > fuse
> > > igb e1000e i2c_algo_bit ptp ghash_clmulni_intel pps_core
> > > intel_lpss_pci
> > > [last unloaded: xe]
> > > [ 1661.638278] CPU: 2 UID: 0 PID: 75257 Comm: kworker/u65:8
> > > Tainted: G S                  6.16.0-rc1-xe+ #397 PREEMPT(undef)
> > > [ 1661.638280] Tainted: [S]=CPU_OUT_OF_SPEC
> > > [ 1661.638280] Hardware name: Intel Corporation Raptor Lake Client
> > > Platform/RPL-S ADP-S DDR5 UDIMM CRB, BIOS
> > > RPLSFWI1.R00.3492.A00.2211291114 11/29/2022
> > > [ 1661.638281] Workqueue: xe_gt_page_fault_work_queue
> > > xe_svm_garbage_collector_work_func [xe]
> > > [ 1661.638311] RIP: 0010:xas_start+0x47/0xd0
> > > [ 1661.638317] Code: 07 48 8b 57 08 48 8b 40 08 48 89 c1 83 e1 03
> > > 48 83 f9 02 75 08 48 3d 00 10 00 00 77 21 48 85 d2 75 29 48 c7 47 18
> > > 00
> > > 00 00 00 <c3> cc cc cc cc 48 c1 fa 02 85 d2       74 c7 31 c0 c3 cc
> > > cc
> > > cc cc 0f b6
> > > [ 1661.638317] RSP: 0018:ffffc90003d9b968 EFLAGS: 00000297
> > > [ 1661.638318] RAX: ffff88810459b232 RBX: ffffc90003d9b9a0 RCX:
> > > 0000000000000006
> > > [ 1661.638319] RDX: 0000000000000009 RSI: 0000000000000003 RDI:
> > > ffffc90003d9b9a0
> > > [ 1661.638320] RBP: ffffffffffffffff R08: ffff888197a0a600 R09:
> > > 0000000000000228
> > > [ 1661.638320] R10: ffffffffffffffff R11: ffffffffffffffc0 R12:
> > > 0000000000000241
> > > [ 1661.638320] R13: ffffffffffffffff R14: 0000000000000040 R15:
> > > ffff8881014db000
> > > [ 1661.638321] FS:  0000000000000000(0000)
> > > GS:ffff88890aee8000(0000) knlGS:0000000000000000
> > > [ 1661.638322] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > [ 1661.638322] CR2: 00007fc07287fff8 CR3: 000000000242c003 CR4:
> > > 0000000000f70ef0
> > > [ 1661.638323] PKRU: 55555554
> > > [ 1661.638323] Call Trace:
> > > [ 1661.638325]  <TASK>
> > > [ 1661.638326]  xas_load+0xd/0xb0
> > > [ 1661.638328]  xas_find+0x187/0x1d0
> > > [ 1661.638330]  xa_find_after+0x10f/0x130
> > > [ 1661.638332]  drm_sched_job_add_dependency+0x80/0x1e0
> > > [gpu_sched]
> > > [ 1661.638335]  drm_sched_job_add_resv_dependencies+0x62/0x120
> > > [gpu_sched]
> > > [ 1661.638337]  xe_pt_vm_dependencies+0x5b/0x2f0 [xe]
> > > [ 1661.638359]  xe_pt_svm_pre_commit+0x59/0x1a0 [xe]
> > > [ 1661.638376]  xe_migrate_update_pgtables+0x67f/0x910 [xe]
> > > [ 1661.638397]  ? xe_pt_stage_unbind+0x92/0xd0 [xe]
> > > [ 1661.638416]  xe_pt_update_ops_run+0x12e/0x7f0 [xe]
> > > [ 1661.638433]  ops_execute+0x1b1/0x430 [xe]
> > > [ 1661.638449]  xe_vm_range_unbind+0x260/0x2a0 [xe]
> > > [ 1661.638465]  xe_svm_garbage_collector+0xfe/0x1c0 [xe]
> > > [ 1661.638478]  xe_svm_garbage_collector_work_func+0x25/0x30 [xe]
> > > [ 1661.638491]  process_one_work+0x16b/0x2e0
> > > [ 1661.638495]  worker_thread+0x284/0x410
> > > [ 1661.638496]  ? __pfx_worker_thread+0x10/0x10
> > > [ 1661.638496]  kthread+0xe9/0x210
> > > [ 1661.638498]  ? __pfx_kthread+0x10/0x10
> > > 
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_exec_queue.c          |  8 +++++++
> > >  drivers/gpu/drm/xe/xe_exec_queue_types.h    | 17 +++++++++++++++
> > >  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 23 ++++++++++++++++---
> > > --
> > >  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |  4 +++-
> > >  drivers/gpu/drm/xe/xe_pt.c                  | 10 +++++++--
> > >  drivers/gpu/drm/xe/xe_svm.c                 |  9 +++++---
> > >  drivers/gpu/drm/xe/xe_vm.c                  |  6 ++++--
> > >  7 files changed, 64 insertions(+), 13 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > index fee22358cc09..71e354c56ad9 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > @@ -94,6 +94,14 @@ static struct xe_exec_queue
> > > *__xe_exec_queue_alloc(struct xe_device *xe,
> > >  	else
> > >  		q->sched_props.priority =
> > > XE_EXEC_QUEUE_PRIORITY_NORMAL;
> > >  
> > > +	if (q->flags & (EXEC_QUEUE_FLAG_PERMANENT |
> > > EXEC_QUEUE_FLAG_VM)) {
> > > +		int i;
> > > +
> > > +		for (i = 0; i < XE_EXEC_QUEUE_TLB_CONTEXT_COUNT;
> > > ++i)
> > > +			q->tlb_invalidation.context[i] =
> > > +				dma_fence_context_alloc(1);
> > > +	}
> > 
> > Hmm. If invalidations are ordered per GT, why don't we just allocate
> > one invalidation context per GT, rather than one per GT per exec_queue?
> > 
> 
> TLB invalidations are only ordered per bind queue and GT tuple. Consider
> the case where two queues issue binds and TLB invalidations—if two
> individual binds submit jobs with no interdependencies, the order of TLB
> invalidation can vary. This breaks the assumption of using a single
> dma-fence context per GT.
> 
> The fence for the TLB invalidation needs to be allocated and installed
> in the dma_resv or as an out-sync ahead of the initial bind job
> submission. Allocating it on demand at a later time is not an option.
> 
> > Also, moving forward, this seems like a fit for a one-per-gt
> > invalidation drm_scheduler?
> > 
> 
> I think this is a good idea. xe_pt.c essentially duplicates the DRM
> scheduler functionality through open coding—delaying the TLB
> invalidation until the associated job signals, then kicking a worker to
> perform the invalidation. This closely resembles the DRM scheduler’s
> dependency tracker, run_job worker, and run_job vfunc.
> 
> Let me see if I have time to refactor the TLB invalidation code to be
> job-based, using a DRM scheduler with a backend that issues TLB
> invalidations. I suspect this approach will be cleaner + pay in in the
> long term. As mentioned above, we’d likely need a scheduler per queue
> for optimal usage.
> 
> For now, I think we should land this with the correct Fixes: tag to
> ensure a stable code base.
> 

Ok, so this patch by itself doesn't work. I believe the issue arises on
the migration queue, where two different threads could issue binds
concurrently. The TLB invalidation seqno is assigned outside of any
lock, which could lead to the actual invalidations being reordered
breaking a single dma fence context.

In the case of the migration queue, we need the job_lock for this
assignment (user queues are fine since they hold the VM locks). Given
that, I think we’ll have to live with the stack trace in the commit
message for now — the lockup eventually resolves itself, whereas
breaking a DMA fence context seems considerably worse.

The proper solution, as you suggested, is to use jobs and the DRM
scheduler—but that would require a fairly large change, which we can't
backport. Fortunately, SVM isn’t widely used by customers yet and to
trigger this stack trace, lots of memory needs to be freed in a very
tight loop.

Matt

> Matt
> 
> > Thanks,
> > Thomas
> > 
> > > +
> > >  	if (vm)
> > >  		q->vm = xe_vm_get(vm);
> > >  
> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > index cc1cffb5c87f..81d240e561ee 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > @@ -132,6 +132,23 @@ struct xe_exec_queue {
> > >  		struct list_head link;
> > >  	} lr;
> > >  
> > > +	/** @tlb_invalidation: TLB invalidations exec queue state */
> > > +	struct {
> > > +		/**
> > > +		 * @tlb_invalidation.context: The TLB invalidation
> > > context
> > > +		 * for the queue (VM and MIGRATION queues only)
> > > +		 */
> > > +#define XE_EXEC_QUEUE_TLB_CONTEXT_PRIMARY_GT	0
> > > +#define XE_EXEC_QUEUE_TLB_CONTEXT_MEDIA_GT	1
> > > +#define
> > > XE_EXEC_QUEUE_TLB_CONTEXT_COUNT		(XE_EXEC_QUEUE_TLB_CONTEXT_MEDIA_GT +1)
> > > +		u64 context[XE_EXEC_QUEUE_TLB_CONTEXT_COUNT];
> > > +		/**
> > > +		 * @tlb_invalidation.seqno: The TLB invalidation
> > > seqno for the
> > > +		 * queue (VM and MIGRATION queues only)
> > > +		 */
> > > +		u32 seqno[XE_EXEC_QUEUE_TLB_CONTEXT_COUNT];
> > > +	} tlb_invalidation;
> > > +
> > >  	/** @pxp: PXP info tracking */
> > >  	struct {
> > >  		/** @pxp.type: PXP session type used by this queue
> > > */
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > > b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > > index 084cbdeba8ea..0a2fcaaf04fc 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > > @@ -7,6 +7,7 @@
> > >  
> > >  #include "abi/guc_actions_abi.h"
> > >  #include "xe_device.h"
> > > +#include "xe_exec_queue_types.h"
> > >  #include "xe_force_wake.h"
> > >  #include "xe_gt.h"
> > >  #include "xe_gt_printk.h"
> > > @@ -294,7 +295,7 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
> > >  		struct xe_gt_tlb_invalidation_fence fence;
> > >  		int ret;
> > >  
> > > -		xe_gt_tlb_invalidation_fence_init(gt, &fence, true);
> > > +		xe_gt_tlb_invalidation_fence_init(gt, NULL, &fence,
> > > 0, true);
> > >  		ret = xe_gt_tlb_invalidation_guc(gt, &fence);
> > >  		if (ret)
> > >  			return ret;
> > > @@ -431,7 +432,7 @@ void xe_gt_tlb_invalidation_vm(struct xe_gt *gt,
> > > struct xe_vm *vm)
> > >  	u64 range = 1ull << vm->xe->info.va_bits;
> > >  	int ret;
> > >  
> > > -	xe_gt_tlb_invalidation_fence_init(gt, &fence, true);
> > > +	xe_gt_tlb_invalidation_fence_init(gt, NULL, &fence, 0,
> > > true);
> > >  
> > >  	ret = xe_gt_tlb_invalidation_range(gt, &fence, 0, range, vm-
> > > >usm.asid);
> > >  	if (ret < 0)
> > > @@ -551,7 +552,9 @@ static const struct dma_fence_ops
> > > invalidation_fence_ops = {
> > >  /**
> > >   * xe_gt_tlb_invalidation_fence_init - Initialize TLB invalidation
> > > fence
> > >   * @gt: GT
> > > + * @q: exec queue issuing TLB invalidation, if NULL no queue
> > > associated
> > >   * @fence: TLB invalidation fence to initialize
> > > + * @tlb_context: TLB invalidation context for exec_queue
> > >   * @stack: fence is stack variable
> > >   *
> > >   * Initialize TLB invalidation fence for use.
> > > xe_gt_tlb_invalidation_fence_fini
> > > @@ -559,15 +562,25 @@ static const struct dma_fence_ops
> > > invalidation_fence_ops = {
> > >   * even on error.
> > >   */
> > >  void xe_gt_tlb_invalidation_fence_init(struct xe_gt *gt,
> > > +				       struct xe_exec_queue *q,
> > >  				       struct
> > > xe_gt_tlb_invalidation_fence *fence,
> > > +				       int tlb_context,
> > >  				       bool stack)
> > >  {
> > > +	xe_gt_assert(gt, tlb_context <
> > > XE_EXEC_QUEUE_TLB_CONTEXT_COUNT);
> > > +
> > >  	xe_pm_runtime_get_noresume(gt_to_xe(gt));
> > >  
> > >  	spin_lock_irq(&gt->tlb_invalidation.lock);
> > > -	dma_fence_init(&fence->base, &invalidation_fence_ops,
> > > -		       &gt->tlb_invalidation.lock,
> > > -		       dma_fence_context_alloc(1), 1);
> > > +	if (q)
> > > +		dma_fence_init(&fence->base,
> > > &invalidation_fence_ops,
> > > +			       &gt->tlb_invalidation.lock,
> > > +			       q-
> > > >tlb_invalidation.context[tlb_context],
> > > +			       ++q-
> > > >tlb_invalidation.seqno[tlb_context]);
> > > +	else
> > > +		dma_fence_init(&fence->base,
> > > &invalidation_fence_ops,
> > > +			       &gt->tlb_invalidation.lock,
> > > +			       dma_fence_context_alloc(1), 1);
> > >  	spin_unlock_irq(&gt->tlb_invalidation.lock);
> > >  	INIT_LIST_HEAD(&fence->link);
> > >  	if (stack)
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> > > b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> > > index abe9b03d543e..8440c608a0ec 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> > > +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> > > @@ -10,6 +10,7 @@
> > >  
> > >  #include "xe_gt_tlb_invalidation_types.h"
> > >  
> > > +struct xe_exec_queue;
> > >  struct xe_gt;
> > >  struct xe_guc;
> > >  struct xe_vm;
> > > @@ -29,8 +30,9 @@ int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
> > >  int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32
> > > *msg, u32 len);
> > >  
> > >  void xe_gt_tlb_invalidation_fence_init(struct xe_gt *gt,
> > > +				       struct xe_exec_queue *q,
> > >  				       struct
> > > xe_gt_tlb_invalidation_fence *fence,
> > > -				       bool stack);
> > > +				       int tlb_context, bool stack);
> > >  void xe_gt_tlb_invalidation_fence_signal(struct
> > > xe_gt_tlb_invalidation_fence *fence);
> > >  
> > >  static inline void
> > > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > > index f39d5cc9f411..feab4b7c7e70 100644
> > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > @@ -1529,7 +1529,7 @@ static void invalidation_fence_cb(struct
> > > dma_fence *fence,
> > >  
> > >  	trace_xe_gt_tlb_invalidation_fence_cb(xe, &ifence->base);
> > >  	if (!ifence->fence->error) {
> > > -		queue_work(system_wq, &ifence->work);
> > > +		queue_work(ifence->gt->ordered_wq, &ifence->work);
> > >  	} else {
> > >  		ifence->base.base.error = ifence->fence->error;
> > >  		xe_gt_tlb_invalidation_fence_signal(&ifence->base);
> > > @@ -1551,13 +1551,15 @@ static void
> > > invalidation_fence_work_func(struct work_struct *w)
> > >  static void invalidation_fence_init(struct xe_gt *gt,
> > >  				    struct invalidation_fence
> > > *ifence,
> > >  				    struct dma_fence *fence,
> > > +				    struct xe_exec_queue *q, int
> > > tlb_context,
> > >  				    u64 start, u64 end, u32 asid)
> > >  {
> > >  	int ret;
> > >  
> > >  	trace_xe_gt_tlb_invalidation_fence_create(gt_to_xe(gt),
> > > &ifence->base);
> > >  
> > > -	xe_gt_tlb_invalidation_fence_init(gt, &ifence->base, false);
> > > +	xe_gt_tlb_invalidation_fence_init(gt, q, &ifence->base,
> > > tlb_context,
> > > +					  false);
> > >  
> > >  	ifence->fence = fence;
> > >  	ifence->gt = gt;
> > > @@ -2467,10 +2469,14 @@ xe_pt_update_ops_run(struct xe_tile *tile,
> > > struct xe_vma_ops *vops)
> > >  		if (mfence)
> > >  			dma_fence_get(fence);
> > >  		invalidation_fence_init(tile->primary_gt, ifence,
> > > fence,
> > > +					pt_update_ops->q,
> > > +					XE_EXEC_QUEUE_TLB_CONTEXT_PR
> > > IMARY_GT,
> > >  					pt_update_ops->start,
> > >  					pt_update_ops->last, vm-
> > > >usm.asid);
> > >  		if (mfence) {
> > >  			invalidation_fence_init(tile->media_gt,
> > > mfence, fence,
> > > +						pt_update_ops->q,
> > > +						XE_EXEC_QUEUE_TLB_CO
> > > NTEXT_MEDIA_GT,
> > >  						pt_update_ops-
> > > >start,
> > >  						pt_update_ops->last,
> > > vm->usm.asid);
> > >  			fences[0] = &ifence->base.base;
> > > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > > b/drivers/gpu/drm/xe/xe_svm.c
> > > index 13abc6049041..2edd1c52150e 100644
> > > --- a/drivers/gpu/drm/xe/xe_svm.c
> > > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > > @@ -227,7 +227,9 @@ static void xe_svm_invalidate(struct drm_gpusvm
> > > *gpusvm,
> > >  			int err;
> > >  
> > >  			xe_gt_tlb_invalidation_fence_init(tile-
> > > >primary_gt,
> > > -							 
> > > &fence[fence_id], true);
> > > +							  NULL,
> > > +							 
> > > &fence[fence_id], 0,
> > > +							  true);
> > >  
> > >  			err = xe_gt_tlb_invalidation_range(tile-
> > > >primary_gt,
> > >  							  
> > > &fence[fence_id],
> > > @@ -241,8 +243,9 @@ static void xe_svm_invalidate(struct drm_gpusvm
> > > *gpusvm,
> > >  			if (!tile->media_gt)
> > >  				continue;
> > >  
> > > -			xe_gt_tlb_invalidation_fence_init(tile-
> > > >media_gt,
> > > -							 
> > > &fence[fence_id], true);
> > > +			xe_gt_tlb_invalidation_fence_init(tile-
> > > >media_gt, NULL,
> > > +							 
> > > &fence[fence_id], 0,
> > > +							  true);
> > >  
> > >  			err = xe_gt_tlb_invalidation_range(tile-
> > > >media_gt,
> > >  							  
> > > &fence[fence_id],
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index d18807b92b18..730319b78a0a 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -3896,8 +3896,9 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
> > >  		if (xe_pt_zap_ptes(tile, vma)) {
> > >  			xe_device_wmb(xe);
> > >  			xe_gt_tlb_invalidation_fence_init(tile-
> > > >primary_gt,
> > > +							  NULL,
> > >  							 
> > > &fence[fence_id],
> > > -							  true);
> > > +							  0, true);
> > >  
> > >  			ret = xe_gt_tlb_invalidation_vma(tile-
> > > >primary_gt,
> > >  							
> > > &fence[fence_id], vma);
> > > @@ -3909,8 +3910,9 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
> > >  				continue;
> > >  
> > >  			xe_gt_tlb_invalidation_fence_init(tile-
> > > >media_gt,
> > > +							  NULL,
> > >  							 
> > > &fence[fence_id],
> > > -							  true);
> > > +							  0, true);
> > >  
> > >  			ret = xe_gt_tlb_invalidation_vma(tile-
> > > >media_gt,
> > >  							
> > > &fence[fence_id], vma);
> > 
