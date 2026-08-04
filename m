Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9CAC55822
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 15:19:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15EE110EAE5;
	Tue,  4 Aug 2026 15:19:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KqeJ9+2u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FF1910EAE5
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Aug 2026 15:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785856785; x=1817392785;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=f4PF/mI+O4avenwNOJROWTycihnEJM+eYbPx2A531h0=;
 b=KqeJ9+2uw+CR1rxpRI4YdvbjNotGNwULVgCaKNvNa968Okno+8jjSvbg
 v9vYNVIFy1JlpAU+Oc5Uy1KSbt9yjV3Q5DBAIklQFUcmYnnQgfR0ivssd
 NyE4qpVSNDdQhtJ1sDsTeKtzGM0/ZsbSpEL4TiO44Ng6lC38y6uUsLKb6
 CTpT7eYukWZrG8mHUd04S13RxTphUpgxNe1H0hkbdsmfHRFfl3emdp6if
 Rtu2XrPhiHTatR5aqy7wL5TxcFffpxkI27b4ZPkV1tl4GnEbGFs3CY/7m
 nrQ+pT/ospAooIjnLLIcfEeothjVvOUjuMxmIIOG0iN63k7mtZHMOuFj+ Q==;
X-CSE-ConnectionGUID: OEK/r+bCRrOPmkdlEPjNhQ==
X-CSE-MsgGUID: OQPCR4MsQKeZMMz15GGR8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="90221171"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="90221171"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 08:19:24 -0700
X-CSE-ConnectionGUID: /8Vzv518QZqQK4ACAN9wgg==
X-CSE-MsgGUID: dp5mOmq4QciAcDv6A6V7sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="260275673"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 08:19:24 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 08:19:23 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 4 Aug 2026 08:19:23 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.25) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 08:19:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nPoAVb7tuhEqj8CHTJFQmcrj7Op3pPcvQEedQWhGaXEjGt2pPzom19y5RZYANXaLTjPTIpOxZE4AKu0JN4p2BxMIQrSi7RHe3XCZBHCN4ZdZsfEoxpjfNhYqjLHwOi8ImYDQSox32H0S9uIAIu2ThnLdXXHDT/wu3kSdLkpMZ20tp0TJb20apWryVnSmqywWEiLFcbwlmhEsV73wtucJPtfYEw1IJIJl9QPwYzlyfCwlc9vJtHDsTgQLZcIgV3Yp/FYud0L+82NI8vqLnihNgqy+fIfYf0/yVSGh7E9jjqwIwjEigOIU9vQIT46GlnJzeiVmMsafjadUsCjXO3LrGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8eiFF6IrzDtAoUVQvuErLJ4GrcaEieucCiIHV5if8+o=;
 b=T8knZO9qRRNnzj4AYwciyP1N5RTn32QvGu7zVup1NqL4ugn+OQGYK6BDQrCs8VRAoz1TLqKqucSNZ9t6wMhXguCx/u4VdygycXX0aE+XsYzNyPLWYZdoNylkLHfaEahqjFV7lnyGj62vTe/Jn5afsUPf8XwM1oPhK0gPlav5OeJoMSyEMcGQ9qUzw16mlFY49O+b2c5jOhjw72p8nurlJuxnB4+uSaAwTXo2enNo5wWjmeogutkvGpC6MdLPAqZ4Vf0TqUoeJv9c4MOPtclTCQ5FzrR/Q9rO898DzOj9eQUfu66DOiTP+4rODOr7i41hoBgiG+E4qVzZTE2OjL4O+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SJ5PPFBD6B1667A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::84f) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 15:19:19 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0292.015; Tue, 4 Aug 2026
 15:19:19 +0000
Message-ID: <e84496d6-d47f-4319-b2ed-c0a862d1b80c@intel.com>
Date: Tue, 4 Aug 2026 17:19:16 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/23] drm/xe/log: Introduce structured
 component/location identifiers
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>, Raag Jadav <raag.jadav@intel.com>, "Riana
 Tauro" <riana.tauro@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
 <20260730152121.576-4-michal.wajdeczko@intel.com>
 <e58bf20d-6583-44ad-83b1-69950b766c45@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <e58bf20d-6583-44ad-83b1-69950b766c45@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIUP296CA0088.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:35c::12) To LV2PR11MB6024.namprd11.prod.outlook.com
 (2603:10b6:408:17a::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SJ5PPFBD6B1667A:EE_
X-MS-Office365-Filtering-Correlation-Id: dbac4a9f-264d-4781-e244-08def23bc116
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|6133799003|56012099006|11063799006|10067099003|4143699003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: kNGLeeNJYDKQxs2m0VPIchq2lCBtzbY2spt80Q3EPwKTOeQF510WMHJ95wv1bdbLHKG7WenJtTsB7tRiMoU3vpG39sWn8r6/b97oIJy6JjmUTRrSrCe38ePsGg7EGrL0i6d9L3fiDZExXhsg/N0m+lOM0rRHkYTdz9DcsJHZGsLBbiJqnqOFrtXQqYYOeKq8MMVNJMv3jxnMmZe0f099ocYkGkI0ViwkcOPCPmwGeko2yV/4iqip2tICdOd7a8CNIZOLu9Vf/ncgth6a00vy86JUzevQT7VaE2ImzBfQEJYgUKGtF0mQrd6V9XdCIl/1Z03A5NyCdKYmuU6wx//8WbSrz/1dmsxwx6fOou0Ui6lM9UXiTWVsHaP6TGcPTb9fj3BWhBCbd9LSU8mX4wMxcEU73PV6GVILB7tUw8jyPYnMdryBNm7GmE1QSl8RyzaEy9ScUe60uJShqMkEGHq6FqZoqypYu7Sci0c0OeCG/OvuGVzAOr223fbfeRUXYVIAIfGGFj792APyI4ey1VLo9e1chuQPWXmHSQmHf0cCnfFo8CwC6GHnj+C0kVpVELQXaRAH6wnzQHUJj5A/pGgecmlRUWXg6O3uvVJGjb0TLh8MvWcwGNHeufriKBlMuBXS5S6aj5ypZyYtVY7sNHg+w9NWuJGgpRYoqO9OUCvaxvw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(56012099006)(11063799006)(10067099003)(4143699003)(3023799007)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SW85YW5EamF5OVBYL1dpVmN3VDAwNTdxN241d0pnLzViOTFaOXdKbURiR1g2?=
 =?utf-8?B?b2ZNMGZFemN3OVZkc1R4QmVUOG1NRy9md0tUL0hxVmdGVFlUYUkvQk13NE9H?=
 =?utf-8?B?YVdCdWNiNWhmcE5NZHRLZzErNk84ZlNJeDFXdzJhVjl4dGk3L3pIRktZRUwr?=
 =?utf-8?B?V1hGSGZPdmxpaFE0TDNZWXhibW9McU9YTC9HVHM3UWJyMTY4WlR2d2xTaWgx?=
 =?utf-8?B?UjIwMjVpdC92WjQ3SVE3czdZYXZVT1Qza2RZK1RKdHkrdDFYSmVyMU9Lb3Fp?=
 =?utf-8?B?U3VKd1hGUng1NlJqeDhYcFVOS3RFN3pBQlBORGI0ZGJoV08yZWRhK3M3UHEr?=
 =?utf-8?B?dkFWcWp4TUdVWGkxTzJ2Y1hpM1VmcWxoRFFDOThFbVZMKzR3UjZieTlLLzY2?=
 =?utf-8?B?WTlMcTVpODFjU2dFQzMvek9xdHhVKzZUK2ZQT3dPdWt0ZldWMnVMRTlHK1k4?=
 =?utf-8?B?a1pMbmthY3pnWHc0Vy81djlWZ3BOb21zSVQzZG9IMWNwcU5lWE1jZHNEVDFQ?=
 =?utf-8?B?WW16dmdjSy9BWDVCS3dWaWxQaDdMNzhuRnEzL2R1S0VlS3Ruc3dDR1JtQnRp?=
 =?utf-8?B?MS9HcjdET2FwQkw3ZTNYN2xNOWdFUU9KWDlQR2dLcGVqNUg2TG5EemIxOTBT?=
 =?utf-8?B?Z0EwaHpGYllYNFlMUXk0UndoWTR4UjB2alc4MzlIVmlHM3ZMTnpuZWRaSXNn?=
 =?utf-8?B?QmZXZ0QxWHFrRVFyOGRmNFdrNFRqT0JpeG1pT0NpNlA4TmRGMU9Ma3h5cDR5?=
 =?utf-8?B?YUhRK1ZJVmZoOXF0aWxIVS81Yk9RUmRqTGd6VUQ3WEZrVjRwN0lDMytRUjNO?=
 =?utf-8?B?MTB2NVJqd25JSE54ZXo4UXdrTVpxZXdmcTFhWlBWN1pydCtTRFVjRmdjeXVE?=
 =?utf-8?B?T0dkcWxHaFZnVzdxNWRGTHRWUjkreW5mOE1QNUx3SkR6SUloUHBXL1U2bmZV?=
 =?utf-8?B?MlZ6ODBVQnNpZUV3cFl4eHpwdjNIRnJOWkRYdnFQNjRQMFpxVlg5VmQzSXh2?=
 =?utf-8?B?SUtBKzlTWW9HNjlROTlydmQ3VEU2T2V6REh2MUw0MXptUVVyQW1uNGNUTDJQ?=
 =?utf-8?B?MDZOc3NFL1NnYUxjTnBwWDJaeWxBckpCckV2S0Mycm9TdUVxT0dJQnRGdWR5?=
 =?utf-8?B?Z1R1eTloWUZDQnl5d3N6YW1RNUZLVFhBMFlKQjhFQVhhY0VnWDNlZXpjY1J5?=
 =?utf-8?B?QjN6M0xzbEJGSlNwU29RdXBUb0R0K0VkY1NWRzJvZTN3SEptdy9meWpmL2wy?=
 =?utf-8?B?eFFXcDM0NW9GcUg2cjY3K1J3OVZUNktEMVhaSVkrSHRUUUc1ZlV3OFpmZTZ6?=
 =?utf-8?B?elF1NzBlUWFZMkNhZ0RJNEs0NVN5RWpmSC8zN0hSMzQyZHJKZ0RGRWVJR2tY?=
 =?utf-8?B?T0xaYXZ6WGU5TXhpdUZaVWdsRGd4Myt0QVBVV1A1cGdiY1FCVG5JR0M3aXF6?=
 =?utf-8?B?dGpBN0lzL1Z2K0ZDTnRkRHhPUGpiMVZ5cGJGNjJXblUyR3ZERkpIZ0hlYm9t?=
 =?utf-8?B?RG9ud1VpOVRJYzE0Z0lFN3ZsRHdsU1FwZk82a2RJNlYxSHUzTjFkditaQ1VT?=
 =?utf-8?B?YzN2cHA2MlNEU1RJRTVIYnA1MUFSM0FnZ2hFN3EydytaUWQ1TkxxMDRZWmxQ?=
 =?utf-8?B?OGFJTjhWMUVuQ1VjaEw3V0dTQmpsSVlKS2kyVEZYelhrVTlFZVRJeE1sb2pG?=
 =?utf-8?B?Z05FQ3F3K2M3ZVdCMnBYS2pkUjcya01tSWhVbEhFZkRWT2VDTExhVTYra2cx?=
 =?utf-8?B?VHhka2ZqUURpaUF5RG93dXR5cU9ja1hub0hMeElLaXhZTzhDcVBSYWhoakVL?=
 =?utf-8?B?ZlVjczVBSWJaVy9wNEFXUTJlRVFzSGpnNWNsajVVeHVoNU5MbFJDNnlXK2RI?=
 =?utf-8?B?RG1ibHdFbU82dW1XU1hnT3lHdWlJQUY3ampEVlgvM2pONXBidUtmTDVrcUR0?=
 =?utf-8?B?YmhCSi9hVVo1LzVtdmsxQ0dJKzhhei8rWFVnSkRwOWNsOU16M1FVYlhDTzgr?=
 =?utf-8?B?QzF6NGMyUUNmbHFUVU16OVFLSzNUaGRiWXcraE9DeHNYYVY2YmliZmNMZ1Zz?=
 =?utf-8?B?WThuZ0JHYkxPWk45YlRvaHVvQlE2eUVXN0hEaDdESXFxdWZWOXd3QWxZc2Vz?=
 =?utf-8?B?YkVCMVVBc3lrQ0tjZ0REdU9lQkpseFh3WnpySEs5dm1PWDlWcnB5RjJOamdZ?=
 =?utf-8?B?T2pCaitmNWlYMk5UOTI4cEdaR1dNb0VsNWtwOHFCZ3VoSUFsY1NHRzNsZlow?=
 =?utf-8?B?OTdpa0tOeVNHdTRBQkgzYlZ2K2VHVG8xZ2R6SDJmSmkxQitMYWkzcFNqd1l2?=
 =?utf-8?B?dUNUSHJyMCtiS1l6ajlCZUhFekN1Nm85Ly94d3hWZ0crbkdQS3UwQ3JoQ1BI?=
 =?utf-8?Q?3j3pzMPDCHzqTNZo=3D?=
X-Exchange-RoutingPolicyChecked: oalbNA52HAOnxOx5K1/xWtT9FAGmusUZMr+CoQGnFOAutL3hyT/dRnfYVfeg64aspjmJKzInqXOCmMPf/Lt6DmGnlMO1RRIbE7AHh3k5bOFqSqTkLxe6izGMXA0vND+apKUb3shZn9hIZCEBzJztYcaueB88LgrloHE/fmQcmi37BJqw3uvslHjr148BgVkwDrV+Ia2Y/WsGx/XjFpuctDuuLLMiA4sC3jQP2WoyFHtSqFXYrGcDBXNKRzNgeRecOeMbeKms6nwM19uBjQKiGRg4M8DHBjJ0nVrFiwGpnhjsLDkeSqaSi0ihY7+HtXlmdFBSseZR+neAgzW2CV77dg==
X-MS-Exchange-CrossTenant-Network-Message-Id: dbac4a9f-264d-4781-e244-08def23bc116
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB6024.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 15:19:19.5265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Lq1rRmxkWHyd/KEjdlXTSlLaM98dhU76PPIMVgysdifFAmfGZe7r1AASrjeW55ClMud6p8NXG1ROP8hDgKIGfw7sEzXYAI8iDMrvhUjtzI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFBD6B1667A
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



On 8/3/2026 10:00 AM, Mallesh, Koujalagi wrote:
> 
> On 30-07-2026 08:50 pm, Michal Wajdeczko wrote:
>> Introduce structured identifiers for each component type that
>> could emit a SIGID log entry and for their locations. We plan
>> to store those IDs in the CPER records for better filtering.
>> Define also structured identifiers for the supported locations.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> Cc: Raag Jadav <raag.jadav@intel.com>
>> Cc: Riana Tauro <riana.tauro@intel.com>
>> ---
>> v2: fix typo, define reserved ids (Michal)
>> v3: fix kernel-doc to match code (Sashiko)
>> ---
>>   drivers/gpu/drm/xe/abi/xe_log_abi.h | 186 ++++++++++++++++++++++++++++
>>   1 file changed, 186 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/abi/xe_log_abi.h
>>
>> diff --git a/drivers/gpu/drm/xe/abi/xe_log_abi.h b/drivers/gpu/drm/xe/abi/xe_log_abi.h
>> new file mode 100644
>> index 000000000000..4861a5b58c10
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/abi/xe_log_abi.h
>> @@ -0,0 +1,186 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef _ABI_XE_LOG_ABI_H_
>> +#define _ABI_XE_LOG_ABI_H_
>> +
>> +#include <linux/bits.h>
>> +#include <linux/bitfield.h>
>> +
>> +#include "abi/xe_sigid_abi.h"
>> +
>> +/**
>> + * enum xe_log_component_bits - bits for components structure definitions
>> + *
>> + * Component identifiers are structured based on::
>> + *
>> + *     COMPONENT = CLASS(8b).TYPE(8b)
>> + *
> 
> Are 8b sufficient for CLASS and TYPE?  In future we need to increase that.

we can make it 16b and 16b (as component parameter is already u32)

but ...

are you sure that we will define anytime soon more than 255 component types per class, or have more than 255 classes?

> 
>> + * and the structure looks like this::
>> + *
>> + *     ├── SYSTEM(0)
>> + *     │   └── ...
>> + *     ├── DRIVER(1)
>> + *     │   └── ...
>> + *     ├── FEATURE(2)
>> + *     │   └── ...
>> + *     ├── FIRMWARE(4)
>> + *     │   └── ...
>> + *     └── HARDWARE(8)
>> + *         └── ...
>> + *
>> + * Examples::
>> + *
>> + *     COMPONENT(0.type) = SYSTEM.type = system component
>> + *     COMPONENT(1.type) = DRIVER.type = driver core component
>> + *     COMPONENT(3.type) = DRIVER_FEATURE.type = driver feature
>> + *     COMPONENT(5.type) = DRIVER_FIRMWARE.type = firmware driver component
>> + *     COMPONENT(9.type) = DRIVER_HARDWARE.type = hardware driver component
>> + *
>> + */
>> +enum xe_log_component_bits {
>> +    /* private: */
>> +    XE_LOG_COMPONENT_CLASS_MASK = GENMASK_U16(7, 0),
>> +    XE_LOG_COMPONENT_TYPE_MASK = GENMASK_U16(15, 8),
>> +    /* private: component classes */
>> +    XE_LOG_COMPONENT_CLASS_SYSTEM = 0u,
>> +    XE_LOG_COMPONENT_CLASS_DRIVER = 1u,
>> +    XE_LOG_COMPONENT_CLASS_FEATURE = 2u,
>> +    XE_LOG_COMPONENT_CLASS_FIRMWARE = 4u,
>> +    XE_LOG_COMPONENT_CLASS_HARDWARE = 8u,
>> +    XE_LOG_COMPONENT_CLASS_DRIVER_FEATURE = XE_LOG_COMPONENT_CLASS_DRIVER |
>> +                        XE_LOG_COMPONENT_CLASS_FEATURE,
>> +    XE_LOG_COMPONENT_CLASS_DRIVER_FIRMWARE = XE_LOG_COMPONENT_CLASS_DRIVER |
>> +                         XE_LOG_COMPONENT_CLASS_FIRMWARE,
>> +    XE_LOG_COMPONENT_CLASS_DRIVER_HARDWARE = XE_LOG_COMPONENT_CLASS_DRIVER |
>> +                         XE_LOG_COMPONENT_CLASS_HARDWARE,
>> +    /* private: reserved identifiers */
>> +    XE_LOG_COMPONENT_NONE = 0u,
>> +};
>> +
>> +#define MAKE_XE_LOG_COMPONENT(_CLASS, type) \
>> +    (FIELD_PREP_CONST(XE_LOG_COMPONENT_CLASS_MASK, \
>> +              XE_LOG_COMPONENT_CLASS_##_CLASS) | \
>> +     FIELD_PREP_CONST(XE_LOG_COMPONENT_TYPE_MASK, (type)))
>> +
>> +/**
>> + * enum xe_log_location_bits - bits for location structure definitions
>> + *
>> + * Location identifiers are structured based on::
>> + *
>> + *     LOCATION = TYPE(8b).ID(8b)
>> + *
> 
> Are 8b sufficient for Type and ID?

we can make it 16b & 16b (as location parameter is already u32)

but ...

do you have any new location candidates in mind that would require more than 255 IDs or that we would need to define more than 255 location types?

currently we have:
	TILE	max ID = XE_MAX_TILES_PER_DEVICE(2) = 2
	GT	max ID = XE_MAX_GT_PER_TILE(2) * XE_MAX_TILES_PER_DEVICE(2) = 4

even if we add:
	VF	max ID = 63

still everything < 255

unless we would like to use someday:
	PASID	-> 20b 

but then 16b/16b wont work either

I can change location bits to TYPE(8b) and ID(24b) if you think it is required now

> 
> Everything else looks good.
> 
> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> 
>> + * and the structure looks like this::
>> + *
>> + *     ├── DEVICE(0)
>> + *     │   └── MBZ(0)
>> + *     ├── TILE(1)
>> + *     │   ├── Tile0(0)
>> + *     │   ├── ...
>> + *     │   └── TileN(n)
>> + *     ├── GT(1)
>> + *     │   ├── GT0(0)
>> + *     │   ├── ...
>> + *     │   └── GTn(n)
>> + *     └── ...
>> + *
>> + * Examples::
>> + *
>> + *     LOCATION(0.0) = NONE
>> + *     LOCATION(1.0) = DEVICE.0 = "Device"
>> + *     LOCATION(2.1) = TILE.1 = "Tile1"
>> + *     LOCATION(3.2) = GT.2 = "GT2"
>> + *
>> + */
>> +enum xe_log_location_bits {
>> +    /* private: */
>> +    XE_LOG_LOCATION_TYPE_MASK = GENMASK_U16(7, 0),
>> +    XE_LOG_LOCATION_ID_MASK = GENMASK_U16(15, 8),
>> +    /* private: location types */
>> +    XE_LOG_LOCATION_TYPE_DEVICE = 1u,
>> +    XE_LOG_LOCATION_TYPE_TILE = 2u,
>> +    XE_LOG_LOCATION_TYPE_GT = 3u,
>> +    /* private: reserved identifiers */
>> +    XE_LOG_LOCATION_NONE = 0u,
>> +};
>> +
>> +#define PREP_XE_LOG_LOCATION(type, id) \
>> +    (FIELD_PREP(XE_LOG_LOCATION_TYPE_MASK, (type)) | \
>> +     FIELD_PREP(XE_LOG_LOCATION_ID_MASK, (id)))
>> +
>> +#define MAKE_XE_LOG_LOCATION(_TYPE, id) \
>> +    PREP_XE_LOG_LOCATION(XE_LOG_LOCATION_TYPE_##_TYPE, (id))
>> +
>> +/**
>> + * DEFINE_XE_LOG_COMPONENTS() - Define log components.
>> + * @define: name of the inner macro to expand.
>> + *
>> + * Use this super macro to define custom code for the log components.
>> + * The following parameters are available for each component::
>> + *
>> + *     define(CLASS, ID, TAG, SIGID, NAME)
>> + *
>> + * where:
>> + *
>> + *     @ID is the unique component identifier within CLASS.SUBCLASS.CATEGORY
>> + *     @TAG is unique component tag (across all components)
>> + *     @SIGID is the default xe_sigid for the component (without the XE_SIGID_ prefix)
>> + */
>> +#define DEFINE_XE_LOG_COMPONENTS(define) \
>> +    /* */                                    \
>> +    define(SYSTEM, 1, PCI, SW, "Linux PCI Subsystem")            \
>> +    define(SYSTEM, 2, DRM, SW, "DRM")                    \
>> +    /* */                                    \
>> +    define(DRIVER, 1, XE, SW, "Xe Driver")                    \
>> +    define(DRIVER, 2, PROBE, PROBE, "Driver Initialization")        \
>> +    define(DRIVER, 3, WEDGED, WEDGED, "Device Malfunction")            \
>> +    define(DRIVER, 4, RTP, SW, "Register Table Processing")            \
>> +    define(DRIVER, 5, WA, SW, "Workarounds")                \
>> +    define(DRIVER, 6, PAGEFAULT, MEM_FAULT, "Page Fault")            \
>> +    /* */                                    \
>> +    define(DRIVER_HARDWARE, 1, REGS, IO_BUS, "Registers")            \
>> +    define(DRIVER_HARDWARE, 2, GGTT, IO_BUS, "Global GTT")            \
>> +    define(DRIVER_HARDWARE, 3, GT, GT_TDR, "Graphics Technology")        \
>> +    define(DRIVER_HARDWARE, 4, LMTT, IO_BUS, "LMEM Translation Table")    \
>> +    define(DRIVER_HARDWARE, 5, MEMIRQ, IO_BUS, "Memory Based IRQ")        \
>> +    /* */                                    \
>> +    define(DRIVER_FEATURE, 1, PF, SW, "SR-IOV Physical Function")        \
>> +    define(DRIVER_FEATURE, 2, VF, SW, "SR-IOV Virtual Function")        \
>> +    define(DRIVER_FEATURE, 3, SURVIVABILITY, SURVIVABILITY, "Survivability") \
>> +    define(DRIVER_FEATURE, 4, RAS, SW, "Reliability, Accessibility, Serviceability") \
>> +    /* */                                    \
>> +    define(DRIVER_FIRMWARE, 1, GUC, RUNTIME_FW, "GuC")            \
>> +    define(DRIVER_FIRMWARE, 2, HUC, RUNTIME_FW, "HuC")            \
>> +    define(DRIVER_FIRMWARE, 3, GSC, RUNTIME_FW, "GSC")            \
>> +    define(DRIVER_FIRMWARE, 16, PCODE, DEVICE_FW, "PCode")            \
>> +    define(DRIVER_FIRMWARE, 17, SYSCTRL, DEVICE_FW, "System Controller")    \
>> +    /* eod */
>> +
>> +/**
>> + * enum xe_log_component_tags - TAGs of all supported components
>> + */
>> +enum xe_log_component_tags {
>> +    /* private: */
>> +#define MAKE_XE_LOG_COMPONENT_ENUM(_CLASS, _ID, _TAG, _SIG, _NAME) \
>> +    XE_LOG_COMPONENT_##_TAG = MAKE_XE_LOG_COMPONENT(_CLASS, (_ID)), \
>> +    XE_LOG_COMPONENT_##_CLASS##_##_ID = XE_LOG_COMPONENT_##_TAG, \
>> +    /* eod */
>> +    DEFINE_XE_LOG_COMPONENTS(MAKE_XE_LOG_COMPONENT_ENUM)
>> +#undef MAKE_XE_LOG_COMPONENT_ENUM
>> +};
>> +
>> +/**
>> + * enum xe_log_component_sigids - SIGIDs of all supported components
>> + */
>> +enum xe_log_component_sigids {
>> +    /* private: */
>> +#define MAKE_XE_LOG_COMPONENT_SIGID(_CLASS, _ID, _TAG, _SIG, _NAME) \
>> +    XE_LOG_COMPONENT_##_TAG##_SIGID = XE_SIGID_##_SIG, \
>> +    /* eod */
>> +    DEFINE_XE_LOG_COMPONENTS(MAKE_XE_LOG_COMPONENT_SIGID)
>> +#undef MAKE_XE_LOG_COMPONENT_SIGID
>> +};
>> +
>> +#endif

