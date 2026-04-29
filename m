Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A32CCFA13
	for <intel-xe@archiver.kernel.org>; Wed, 29 Apr 2026 17:58:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3A2110E2E5;
	Wed, 29 Apr 2026 17:58:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ja/mftc1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B3BB10E2E5
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Apr 2026 17:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777485483; x=1809021483;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=F+OPcfKRY2mbOQii7HnBDViSs1zq2okdf8KRlEzYrkg=;
 b=Ja/mftc1pjYjTMFJ90BwMFxyIsURhvMFJmAottCoc+SVlZP/7/kPAANS
 uq0ebg/lVugzt6ZxhkWAsMJnxKzvQ07lTnv+nCgGtS9Yl2AmPZV9TNvTR
 1Tlzy0Ee64rzTja0f2Xt0VAbD8mpReXU5yCjwdg2CPw/395es5WC6kDZu
 AQxRQj/qX4KVjP+dbc4p63g+Dxrb6H4JyESGE+eFhDLEcjQZsObAh4h6U
 hBT3axY/Ful07KTxWN8u/CKOF1nvc+3Bu5GzLPvu8L51pLV5qOD6XVChy
 9lyYaRKFQVFuEhtC17Cibk45R94CbOnKFhAN+znmwnuH4Q3BWypSca/bo A==;
X-CSE-ConnectionGUID: DsIaLycmS1OiGdpe3gI6tQ==
X-CSE-MsgGUID: BAVvamLLSESQsDVVKIm8PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78443747"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="78443747"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 10:58:02 -0700
X-CSE-ConnectionGUID: 7W1Ji3ZQQBCCJSkZU9u2/Q==
X-CSE-MsgGUID: dCXvllS/TRSgbIw+HPMsvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="239362431"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 10:58:02 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 10:58:01 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 29 Apr 2026 10:58:01 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.32) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 10:57:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V9weTFDNg/koyJLT+AF7qyhsZg6O3hnxZp5fMlXWC7rFO9KFyi5XRegD/D8939l6Uj3Hjzr4d5MnjeDwMJF7/6mWE3TLYRNWqihP5v5Z3N3BRf9J0+KuuxDXRttTaTV4w+CaaUIJ7s/Z1gJzmbVboTi8zlKciNeP9mklhQF1MvDjPEHWaQE3/wakW+O3liGC+RxfAnGA9GuOvvmZCjJxpQMWBapn4mAk2fNYSk7vmmo6pz5JdVGh4o6YWoG4mX0DC9QmGLlSX4Gli+LEOzIrTdVneOKtNqO/qoWh5kMGATVGkoKpjswP12z+IJBQsG5g8wxldBrayIyI28d0GZc2yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h4uzg262CoWy4TmzagK9mQFaY/mSKsP/UqWf+5zz6ck=;
 b=jo6mG0qH+emjaysQkZnWjb1IfzjUM8jEPVAuA10DNWY0+yqYSOAM6Oe4asdHr5xF7owh7DJnBvxrxv1LwdrC15lCc20a80RCbqYCiEboul3ZZDbXMhfgpVkTaZ4gVaYmqQdAwtLQlHJNB8v+rGPkAWGmMfMvjwZDWiJZRb842FYLQ1pei+h9BngIXwFPG8ri94VCPEE8cjuaA76W/eNL+aa0CRkRg5CBPNhUtzbkMjEQrXjfyQyaRx1UeZpVrbRWBXbMxVse9H9RPNjPuohW0tjMky+lr1ie0k4ve1BGtHeOF2qj8ueqqtHJhdKVikQs1U+aKt/V3sQ1bKjIV9VBpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH0PR11MB5015.namprd11.prod.outlook.com (2603:10b6:510:39::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 17:57:56 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9870.016; Wed, 29 Apr 2026
 17:57:55 +0000
Message-ID: <16ed12a2-bcbe-4569-9be2-1fb3d3faa66d@intel.com>
Date: Wed, 29 Apr 2026 10:57:53 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 8/8] drm/xe/pci: Introduce PCIe FLR
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <michal.winiarski@intel.com>, <matthew.auld@intel.com>,
 <maarten@lankhorst.se>, <jani.nikula@intel.com>, <lukasz.laguna@intel.com>,
 <zhanjun.dong@intel.com>, <lukas@wunner.de>, <badal.nilawar@intel.com>
References: <20260423100017.1051587-1-raag.jadav@intel.com>
 <20260423100017.1051587-9-raag.jadav@intel.com>
 <2de7d34d-6f47-4327-9290-7cebfd47a69d@intel.com>
 <afGKM1bKyORzPzJ-@black.igk.intel.com> <afIwQWRZyZqM2lWl@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <afIwQWRZyZqM2lWl@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0002.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::15) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH0PR11MB5015:EE_
X-MS-Office365-Filtering-Correlation-Id: aea0891d-a045-4c86-d588-08dea618d730
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: qm2ARAzfQGjuimIHo9zGJ7N413d4WWjgiSmsC8XlR9itOwFz3tMKn3vS3H8mNB+bi+3LuQyxnfXLm8BUHmqd7gqt3l0Bu0ORHxqDF1jy1gbjnNzzBBZHQBEDS/OuBWunBIAycVwXDotuDLD/H3ijBBJSAXA3xyRevjmzezCTassvFhIjMbgm7hmpu8Dt42HO2SDDPOcdsl+A18Kxhie3+LNHQ9MoggblTrsGjldKeNny7bYB3IdLB9mlRhtp3paXc4JAb83NQS8o8WsCTrcChDlFrNVtPwW+nCgLB4eQPUuRLI8QrUjATFI7XMV+0jSABB9J4VsOEW5yB8A/d4DBuUGDgc01i4nTPZZFSUSvcvOoQ33qCyWauKDZ37y7jE2HmrkLYwO5fl33qtXQ0aA/crgSArw1l/7DeMusowNcX0CJWRvzGFvv3WI4YN2bqjgUz8aXy31KRokOmuJuwvK1CxH5jZamiS3skbSsesPQ0MSII2S1jKrcOLI/T+t/WBmTlBY4kqZ/LqQDdi3+dDOi0b+QdzZ16yQYWkYkwdbzZE+W/wpxBtvgaaxAvzWyiGhog6vAmE8kx87OOD2Utq9RjYYqTfmoayFuc7RvPnR8PS3gB84qfW89/K+jn/ZTz8b/tnsjrAW92tHpwW+uQe8DTy24qXNE+n4q5w7Ud+hrwRFRD0QxxvvC2ufOqE9m1iKleQxwlI6dpf74x9HFBv8Z46XL9nnf/3BVvScVTvbSmkA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cW00ZW9vRTRYb3lVV3ZIdCsvQUV0ZllDcnk0Q0F2ZUUvcEE4QW4wOXpCazV3?=
 =?utf-8?B?a1VDUUxQT015aEtScWdnMDQ0a21EQXFNc0hUbm54M1g2ZzdJVEU1cWtwU2Ny?=
 =?utf-8?B?TjNLQ1pFZ1lOWGxadXdQRk1MTVZJenBORW5PQjZEMkhVMXBpam1iOGlKYndD?=
 =?utf-8?B?WVpYcEkvMFUvL1NIL2oyOWhaM0oyVy9rVEtXNnhNUUZmelpDWk41Sm5FejVj?=
 =?utf-8?B?UnpCanZNcTU2Z0VmUmltRzh4ekJpZU1FYndRMDk2cC9sR0ROOTJ2MmwxTUNU?=
 =?utf-8?B?RUZuU2EzTHBMMEhzUjdGTCtadktHOTdwbnR1cVE2OGljVVRqMjJaN1NERXl5?=
 =?utf-8?B?eFF2U3Z5NnRsSXMwOHIyTUQrZS8rcEJQVXFwMXNDVy9vVFYyMjJ1emRFcEVl?=
 =?utf-8?B?TEE2bnRVN1BaMUM4UjRzS0hFVTRWTWIyNmZ6bHcwQzY1N0dVVTh2ZFZyU1FT?=
 =?utf-8?B?L29IcGhHVkk1RFF6Kyt4YUJxV2dUbUN4bmFtQUk0VFRyUTQ2cWxzeS9PYXVM?=
 =?utf-8?B?bjE1K2FTWUhWUmFiWlBRVytyWXlKZWpWZ3RnY05DWlhQRjZQZ3E4ZGJOd3dq?=
 =?utf-8?B?VFIybGpEL21FY3RxSEVNZk9rbHhUSnY5RllGZTBmT2c1dGoyNWtpTk9FcmVE?=
 =?utf-8?B?OEE5amU0dk5DVHJ5UmYvTWxBWWtJTjgrWEdhcFlNRU9wSm5xUnF5Uktjdjl1?=
 =?utf-8?B?Zk1oNHphUXcrQW40aks1eTdHQmlYS0RVc3lTbDhzWjk4UVNsWEt1eWxjU3E1?=
 =?utf-8?B?K2Y2eGVWWU9hdStNeXVtK1hvdTBuTFFyYkxZREMvc05ydTQraVVTSGwwQ2cy?=
 =?utf-8?B?eHN3K1B2a3VIQ1ZyY3BQa2ZZL2NCWVRTTFlJU2F3M3ZjMmtmTDdNRW1CVEZO?=
 =?utf-8?B?VThqWk5HV1B0clhhOWNveWZVTm9IcWdJSVpWU2RoT0hKVDUwQ2hiRGVNZnBa?=
 =?utf-8?B?TUs2eVRSSHNnb1hGbVpuNXJtSllIbGFjNHIrbXFaVmdnbVJ5QVNzbklrUlR3?=
 =?utf-8?B?ek5EYXJKeG9uejVTbCtoVHBNYW5nS0s0M3huMzVLMkhpYStvWk9iOUNSQU1P?=
 =?utf-8?B?QkIrbEFTSTB5NXRZT2ZzMCs1WVIxdlhSYnhEVGt2a1JCN0tsK0hOc1BZMjNQ?=
 =?utf-8?B?MDZkb2FYNW1IeEg0VjgydnJNcDFTWkhWMVFvOVhjalhudUhLSW00YW1nNU9F?=
 =?utf-8?B?ZVgvV2RFWGlRZjY3WjVBWjUvSWdoTE5Zc0lsTmY5ZFE3TUNrUUIwek5CNUtC?=
 =?utf-8?B?WVZxQXdwRUN5Wnp5VFRUTE1LZkw2cHJ4M2xlN09rdm1PZUR5L1pxNzBNWWNi?=
 =?utf-8?B?OHUwWjlmTTBPeGNpWmNNUHBYcHMzSGpvRWZpVlVoc0Qyd1Fjb2YyU1kzcXFv?=
 =?utf-8?B?TjEwZGFKNlRweHl6aG8wQnF5a1owVEpKbHBDM0x6b21mV0lQSTdMMENBNUV1?=
 =?utf-8?B?Z2tuWE0xdGdMekZiak5iT3ptR0Z4ZGUzN21SK2Q5TmNEQlJKWmVOWWkzeFli?=
 =?utf-8?B?ckx2a2N6OGY5bGtrTjhVd0ViSVZUcEZCMTFtcFFvd3dueFppQ1hNblNVNER2?=
 =?utf-8?B?ZDJLQnhwVzU3dHJqU3VSUFcvMldQY3g0MkhWMkFXMGd0T29BZzVhUnN5Sjkx?=
 =?utf-8?B?WTllNFFGN3d0cWhGUnkySHUyZEpwQm9mRjcxR1FJZFEyOUVlM015VU4wd3hj?=
 =?utf-8?B?T3RUMGRxLzFjcEc3NnNjTCs5eXhabEFieCt3QUxEL2owNENFbkxETnhCcWww?=
 =?utf-8?B?SVhMWTA5VkY5N3p6L21hQm8xTlNZVS9ORFMwU3V1RkpEeEpwbFdCOFJGOVpi?=
 =?utf-8?B?cDhrNCszYy9SUUh5cHg5NjJ5NkNKYVU5bHdlYkJMeVluWTVUeDJ6RUF5YmY5?=
 =?utf-8?B?cWxKaUpINlQ1WGJzaWxMVksrWGVSWk5nTkRCYWJydFFOVGNiaEdZNXhqOU90?=
 =?utf-8?B?K2FyNWtONWxJNXc2ZjArdVNBMTQ0V0d6SnJRYVJCbVlxNVBmL3c1RE5wbXg1?=
 =?utf-8?B?K3p4YW9RNjJXbjFJWEl0U3g1NTBLUk9BQXEwWFlZdWw1bDZCRHBJaVZGbVBD?=
 =?utf-8?B?ekh0ZzRUSWtvRVNUWkRVaEwyRWk4L2RlUzkrOEJpTVlpNlBkdXZRMVlqd3V2?=
 =?utf-8?B?MHEvNHhNNTU0U3hRRjNoc2hzOHQwMlkzN2pmZGNoYWNYd01UdllITldVa1ZS?=
 =?utf-8?B?cjAwWkRCdmt0M2dFbjV4RWtPUXZOdUI4aVJUS3hBbVZRZldRWVk4ZzFOdmpm?=
 =?utf-8?B?RUdoTzliVzBUcVN1Ri9rSGo0VjRxWC85c1loVUxMVVZJTGtpWW5KNjl0R3M4?=
 =?utf-8?B?dk5WYWVic3FlTnBuSnVnMnoxQitqNXdTTmVUZVExTTZCQWswOUN0OWNsUXkz?=
 =?utf-8?Q?5uIZUHkd7UeTbjVU=3D?=
X-Exchange-RoutingPolicyChecked: G4LCmGfVN2mQhXRe0QlXcBwIJ/+gdsv+yrfPW0A68G+A1fcisH3REPOrezEp4dmGt+Ho76QJSLwIwnfcSrk4+JXpcTaocbiRYx2tdaatN+EVB2VSDkNGPGn7wgXs3ASAKq0qshdHS8jPyLg7tWVrWDY9zUSSFdeeoBGeDk/9ePx7E5W3lKziWYSg8my31W0Cj/zCZkSxOMby+xLoqr5mjI6eZbU7k3Tp/9AS5XORqMUEH/DXMZdYmPzORuFMZ8qgrIdRbeuUT+EDKtq6i2rNxrFunJpJAbF6LjqNPZKV4rN8i8OvVBXLxpZmS8ZtXkpq63U7gV72d6I035TELBBOqw==
X-MS-Exchange-CrossTenant-Network-Message-Id: aea0891d-a045-4c86-d588-08dea618d730
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 17:57:55.7873 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d40vgj+sK3WX3rxbLLzG3AdCMsuV5a8i/up/9+psNjfwZQvVqCnWxo2N2i393o6dfVO8J5aRpTSbgR8FTdQ+Iqco8TUQkT5IzMjXTkdHhKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5015
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



On 4/29/2026 9:22 AM, Rodrigo Vivi wrote:
> On Wed, Apr 29, 2026 at 06:33:55AM +0200, Raag Jadav wrote:
>> On Tue, Apr 28, 2026 at 04:28:15PM -0700, Daniele Ceraolo Spurio wrote:
>>> <snip>
>>>
>>> I haven't gone through the code yet, but I wanted to ask some questions
>>> regarding the approach first.
>> Sure.
>>
>>>> +
>>>> +/**
>>>> + * DOC: PCI Error Handling
>>>> + *
>>>> + * Xe driver registers PCI callbacks which are called by PCI core in case of
>>>> + * bus errors or resets.
>>>> + *
>>>> + * Currently only PCI Function Level Reset (FLR) callbacks are supported. Since
>>>> + * most of the Endpoint Function state is lost on PCIe FLR, the flow is pretty
>>>> + * much similar to system suspend/resume flow with a few notable exceptions.
>>> IMO we need a couple of lines to describe what the impact of FLR is on the
>>> HW. Something like:
>>>
>>> "PCI FLR clears VRAM and resets the state of all the HW units. Therefore,
>>> the contents of all exec queues and BOs in VRAM are lost and the HW needs a
>>> full re-init".
>> Makes sense.
>>
>>>> + *
>>>> + * Prepare phase:
>>>> + * - Temporarily wedge the device to prevent userspace access
>>> I'm not convinced that wedging is the correct approach here, because the
>>> expectation from the apps POV is that wedging is permanent, so they won't
>>> try again later. Maybe we can have a separate flr_in_progress flag and
>>> return something like -EBUSY or -EAGAIN when the FLR is in progress?
>> This was my initial plan but during implementation I realized that much
>> of the code paths that need handling based new flag are already handled
>> by wedged flag. Like IOCTLs, dummy page faulting, GT reset worker, GuC
>> submission, GuC PC and TLB invalidation corner cases, SRIOV races and so
>> on. So I decided to reuse it here.
>>
>> In my understand wedging is permanent only when we choose to send the
>> uevent and expect device recovery from userspace, which IIUC we're not.
>> So I hope that's okay?
> Right, it should be okay.
>
> But we have 2 different users on top.
>
> Runtime (NEO/Level0-core and Apps):
>
> UMDs will send DEVICE_LOST to application in the case of any kind of reset.
> Nothing prevents App to go and try it again. It will just receive error.
>
> Admin (Level0-sysman and XPUManager):
>
> As Raag told, to them it is only permanent if we ask for help through the
> wedge uevent hints. Otherwise they should still be able to re-enumerate
> the devices whenever needed.

Those are very specific to server use-cases. While that's what we're 
currently implementing FLR for, there might be other use-cases in the 
future that require us to implement this on the client side (there is 
already at least one case where we wedge but we could instead recover 
via driver-triggered FLR), where the apps can be less curated.

I'm a bit lost on how a random app is supposed to tell the difference 
between temporary and permanent wedges if they get a DEVICE_LOST error 
in both cases. Are we expecting all apps to register to the uevent? Or 
are the UMD drivers expected to return a different code if the wedge is 
permanent? Because I don't think that an app should just keep trying 
again non-stop.

>
>>>> + * - Stop accepting new submissions
>>> This is done as part of the above step and it isn't a separate one, right?
>> We explicitly xe_guc_submit_disable() inside flr_prepare() so I thought it
>> was worth spelling out. Will drop.

Maybe instead of dropping it, reword it as "stop all submissions to the 
GuC".

>>
>>>> + * - Kill exec queues which signals all fences and frees in-flight jobs
>>>> + * - Skip memory eviction due to untrustworthy VRAM contents
>>> Note that the VRAM contents are not necessarily untrustworthy at this points
>>> since the FLR hasn't happened yet. However, if the admin is triggering an
>>> FLR it is likely that something is broken (whether memory, GuC, GT or
>>> something else), so we shouldn't try to touch the HW anyway.
>> Yes, that's what I meant here but your phrasing is better. Will update.
>>
>>>> + * - Remove all memory mappings since VRAM contents will be lost
>>> Dumb question, but what happens if a userspace app has an object mapped and
>>> they try to access it from the CPU after this step?
>> I'm not much familiar with MM parts but from what I understand it'll
>> cause a fault which should be redirected to dummy page. I've tried to
>> handle it with commit c020fff70d75 but I'm not sure if that's sufficient.
>> This is why I've marked MM corner cases as TODO.

AFAICS that patch only redirects to dummy page while the wedged flag is 
set. What happens after the FLR is completed and we've removed the 
wedged flag? If we've dropped the mapping to the memory, where is that 
access going to go?

>>
>>>> + *
>>>> + * Re-initialization phase:
>>>> + * - Recreate kernel bos due to skipped eviction in prepare phase
>>>> + * - Restore kernel queues which were killed in prepare phase
>>>> + * - Reload all uC firmwares
>>>> + * - Bring up GT and unwedge to allow userspace access
>>>> + *
>>>> + * Since VRAM contents are lost, the user is expected to recreate user memory
>>>> + * and reload context.
>>> How is the user expected to realize that they need to re-create their BOs? A
>>> queue can be killed for different reasons and normally that doesn't imply
>>> that any associated BO is now invalid.
>> We return -ECANCELED if wedged flag is set and the dummy page data will
>> read all 0s. This would be the indication to the application that it needs
>> to recreate user memory and reload context.

Applications don't usually check their memory to see if it is still 
good. Are we expecting them to start doing this? or are we expecting all 
memory to get thrown out every time an application gets an -ECANCELED error?
In either case I'd like an ack from the UMD teams on this.

Daniele

>>
>> Raag
>>
>>>> + *
>>>> + * TODO: Add PCIe error handling callbacks using similar flow.
>>>> + *
>>>> + * Current implementation is only limited to re-initializing GT.
>>>> + * This needs to be extended for a lot of components listed below.
>>>> + *
>>>> + * - Proper re-initialization of GSC and PXP for integrated platforms
>>>> + * - SRIOV cases which need synchronization between PF and VF
>>>> + * - Re-initialization of all child devices of Xe
>>>> + * - User memory handling and MM corner cases
>>>> + * - Display
>>>> + */
>>>> +
>>>>

