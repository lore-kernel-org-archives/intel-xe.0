Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907EFE9D839
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 05:23:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C6E10E21E;
	Mon,  6 Apr 2026 05:23:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F5Q0EfB/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9725510E220
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Apr 2026 05:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775453013; x=1806989013;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AKZkG7YAzXIwapzXCqYZmDIT72wpo9MJndspeKTuIFY=;
 b=F5Q0EfB/qKt8C5rpTLmTLP9QqnmgXvCAFNS+yoI5HaRUoSzQgtBleg0K
 /rGg6LfBMcaOho2M+cVZjqPXRKKA9X2S/q92nrlFc6Y7c05NRnaRB7JfI
 4ZNmp5UKI5KAf6r7i2j0eAfmfWgxtTIGwHgNFhZ3jgwthNDXZRP4/CSNP
 S+BHS6LCJWp6mNyKgFbjIRoauaqcYqGnrrDVtCDkMnapAhSKFFmb98Eev
 WQfy+OTQ/wjggZCjRE2QpcSc4slb6Np/KkBqtPApAq3XFTuQiyycQ4JA+
 Hlk+0uxv7/IkhLFqROqhvCtmjB01K09fMjwFOWGcNwZcosU2aVRAX1f8M w==;
X-CSE-ConnectionGUID: hWDI2gk6QmOl07XOgB/JZg==
X-CSE-MsgGUID: ynYB8J7aSmqf1eoymLn9iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="76368174"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="76368174"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2026 22:23:32 -0700
X-CSE-ConnectionGUID: +HPv12TXTh+XzKvniUoDUQ==
X-CSE-MsgGUID: U4cEXq2GRuSGejnhXa225g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="231844475"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2026 22:23:32 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 5 Apr 2026 22:23:31 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 5 Apr 2026 22:23:31 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.28) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 5 Apr 2026 22:23:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HWiimM/CV95VB+lOtpRFGf0d+dtFNq+P/8E3ITMQuD0juaJcy14QKq3sT38dQI+hBYqJ8QWW3TaLO47sr8y+thTGJ4X+PZPg0zQp37yEue6jxXlKmBHbXl6RcbGb9loozlY/7DZEO/GR77T5TQSx/uOdxsA2lx5xF2xN4EsaCfJGFmhN3HUu5+rO0iA/0DhJnrU1r0vEZUQgfQ3VHIkPOU+YGkiw3jouKTfPc6Ik6h+P2lvatZfCExgYjTpExhpURgSHCyItizg2cWOWLOJ/IVAMnW4gGmtlSpe71ixrkHQRUu/OrX7Cu96k6LPz89MDY8qRH/swVtxb8Jo8+ad+PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aT/N3Ol9ic+gLmtsVjE8V6U/vONcgrqcAdPozngAC34=;
 b=FNzwVHhtavdWn4Zkq1eKzXKUxu7/wA6ILc/xoq0+6OaDjWX5RgRGFa8zF8Sh4fQ9vLmexpiSgutuRs+VMg+BZ8eBBgZSfr/uPq2mj/7666E1Drla3SisWTj9XR0oi63B+IZ7n9Ix7P/Ze/YMJGkBTvHue5DdAggzS7UjEpYRqrYt7dT00FJgYIByXIimo84dgguhpm1eT9p+ZfpOXBj4C2ZC4RlLf20xMg2X1N6SZQWQm2xly0h4rMxKWeJ3n/jJkiwI3pnnbVQtPpU1svcMkH85kB3jAnEL5J3UKZ6rF76/1ewC1Tiiho04pZ0XIkg46W+59c7UKqJHd9Hkvy9kKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CH3PR11MB7674.namprd11.prod.outlook.com (2603:10b6:610:12b::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.20; Mon, 6 Apr 2026 05:23:28 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9769.016; Mon, 6 Apr 2026
 05:23:27 +0000
Message-ID: <bf1fe076-deee-47b2-ba0a-682a664173d1@intel.com>
Date: Mon, 6 Apr 2026 10:53:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] drm/xe/xe_ras: Add structures and commands for get
 counter
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>
References: <20260320102607.1017511-1-riana.tauro@intel.com>
 <20260320102607.1017511-5-riana.tauro@intel.com>
 <aczQQLhRCPdifEpA@black.igk.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <aczQQLhRCPdifEpA@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0055.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::8) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CH3PR11MB7674:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e808ba3-3b1e-40a6-c6b8-08de939ca1f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: X1fw3G0EzQrGuVga5nG45Ya/asuCnyL/7VrRFFbmj8BPyMrOsHUKS6sxyEJ2UAtVvKmkS/8AoTmmPxiKJatxLPsuzAHvSBI+7jlhclSwhXj+zyfQhn/Z0H0XxxpehNSTmzoUipKLnMQfbMtQUEj7ydqMVk+uIouQDi3oBLJ6C4H1N7ZQfx8g+2uYzg7AbJE74L0M1ucE4zWuveil7dTwbtksMln/curs5t3IeiIcXhu9nfxCGt3phRwAm9dvh7W20CGw9+W1FQOaClgXaoubFwxoYZiRAca6wZvhOkzsKVczJt5IHhwZ0qhoA6pwvFzDBQ1Y/qQzqa+N2vHUKLxo7+5NWr4XX0pEucBDPgzkALhTO9dY8sQp6x72HQDe60Pa/3t0MeHkf+i8g3K1SP16AYZ9SdWHRxforwCaF9ERqpcbXxHnd0m3hJnHwoUGpV10bW7WpWwp9FGhdVOngViWA1GWuK7GWdlvP4lVuWXIkHLQqxGPsEvtDg+C2LOdETi3oBe4p2d/io8+QPedXM2FsHdxOJu0crOr3LqFz9wxsRLl7EtgLfRoqchJNWowc9ofOvDB5O1VtF0gHZTNnXqvokDYGuzXiA5ezRgq7mqgeQ0blCyWweHZ/ArMvAygIWjlTEzBMPf8S149/Tkb8Nebl5qBU50o25FYgBeZVgwVBGk3m92lFaY2alyUI4wYYM1K8WT9r5UHhYk5yPzOhi/7fdHPz9fkk+e1oODLpYkX/I0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1NZa0FCY1cvQktydjRScGFFdUF0VDhBUTdwLzBjdkRZRUdJQWxiSEFDZkhW?=
 =?utf-8?B?VnZZa0xiV3NycUVWZkdsNVk2OVZlakQvYVFKZU1oVkRpSnkxYVhUaGM0ZStw?=
 =?utf-8?B?WWM1WWJTVTVtU05SOGJsVGZXNXdRRjJNM0E4OHYxbU5WVm9MV0lFVS9zYk9a?=
 =?utf-8?B?dkdyckhzWkZhN2VuOVNzc2VsUkVldVR4NUxXZTFKK21aaXJQRVh6UDZ3cjJP?=
 =?utf-8?B?TkpmbGI5M1BUOFpuRUF4c1dEVWJMVkEwWkI0Y3pqNnM4cDJwVXhSeXp4RSs3?=
 =?utf-8?B?d3dONGFKaENsako1WlIyZnB6YjV4a210bzVrUWtPR2N1aVBQbnhZa3VkdUJD?=
 =?utf-8?B?VnlZWit3MXJjcTVaNVhWVmNsTEk0dktGSEdtZVB5dVNrSjFueFNVeWpHb3dv?=
 =?utf-8?B?ZEh1RGh6N3VBaFowZFY4UEt5U0NoYVR6OExwclVxQmxVczJ2TmdzQmNlakhy?=
 =?utf-8?B?VUdzK0dKaEMvUTNrb2loZkN1SFl0R0xNSzU2cTJlTHZJWVZ3ZlZ2cVhlTjFj?=
 =?utf-8?B?NVloU1IyWGVrYWw4Y21NSjIrYVFJM1pvQWRIeG01cVB6cFZ1dCtwQnhqTmRm?=
 =?utf-8?B?QXhYNkdXV0hwMWM3eHp4K0Q3bVpQaGQya3hJeGVrQm5hU1FVV2YxdTFsbzdx?=
 =?utf-8?B?Y3E3OUhGLy8vcm5RMkx1TXJsbFJGSFYvcUM3WVhoMmxxWTdOeWJaQU5DeWR0?=
 =?utf-8?B?dEFvVDRBbFNyMGxnOTRIcTVCZUdxRGtGRDJ4Z1kzRHF3SVd1dDhmU3JxbVps?=
 =?utf-8?B?Q3RtUUhrK2hYenFVYnQwcU1KQ0pvOWdhajdEa0VmaTQ2amRGZGlyM2UzYThF?=
 =?utf-8?B?dG1HelN2bTd6TjdVckhvRXQ3bzRMaExueE1QTFpIWHgrZXZxL2x0TGI3bmh0?=
 =?utf-8?B?TXJDS0JQa0hzckFLSVBVQnZTaUlCOU9CS3BGa2FCU2oxMC9nYjZvZStGTEhj?=
 =?utf-8?B?ejJjSjd5eUNjcTdOTVppMndsdHFrTnRuZ1RZMzhiYjNlOGRkWnEzRnNYTU5I?=
 =?utf-8?B?a1pGaktLQngxbHMzZU1LM0hyQjE5WlFjV3g2L1Q4ZU9naTlMMjRTY2FleWZz?=
 =?utf-8?B?UndKeFJNWmZXTFNveDRiM3VLbzRXYkp3ODMyS1V1V2lxdlc0bWlFZmdmeGtx?=
 =?utf-8?B?Tzc1bXFrZ3RCaUhNMXpuSFJrTDM1ZitrV0Z0Q3pGMlM2ak5aL1BYc3FzdWdh?=
 =?utf-8?B?eTVqanVHK09TZEdHWTd2S1N5WGVYVjVxN1NMVmQ0LzJ4VDZkS0tRUzVRUVdm?=
 =?utf-8?B?d0lNZ3JRaDIweTFia2lqM3dmM3YyVVpqZGFGR1gweEpiOUVRMFF4T0Vxbnl2?=
 =?utf-8?B?VDg3dlJlVXJiKzZ0M2xPZW5MTWpFV0lXMmM5MDJMUk00SS92MHZHdkoyM3Y3?=
 =?utf-8?B?WDFpMXVnRmNoR2pLM2UzT2J4d1pEdDd4VlhycjZlK0ZFdmNPcnpsakwxTmgw?=
 =?utf-8?B?bWhkSXVIanp6YXo1SFJEbXhMMGMvZFVrSFoxZlVmZHB4Z3UvWjRDcTM2OVF4?=
 =?utf-8?B?Y09iQVBGTmhjeFBJQ2ZnMHF0YVlaV1Q1aDBOVlNNQ0luZmxEbnpSaG4zOW5x?=
 =?utf-8?B?dXUyYVpXOUlhdFdUZStQT3JONXpkUDFZOFVxSDZ4cVd0WlBtL2ppbzRkM21X?=
 =?utf-8?B?dFAvdXlNR0ZXcXZUQVBoRHN3NkNwRDVhVVQ0dFh1MTdMMWZBVXlyem1ndVdL?=
 =?utf-8?B?M0dGaDZtNU5IM2h3Y2FvSDNYdXE1b0ljbHAxcDdiL3F1aUVTL1pJRTFmejVj?=
 =?utf-8?B?VnFJOXRUZHk1QXF0SDh4OFVGTTNnRkVIOHRuRnRPSDhZM2JMSlRzZ2NhVjlq?=
 =?utf-8?B?S1NFbWttbmpCS0wyYUlQdU1xNlMrVlRhQS9LVzErRUphaUZyWVY0cXVmUDlL?=
 =?utf-8?B?QTAxVDRad1hoM0JkMEJLSkRQZFF0a3hWL0tBajEvZUZ2bWdvQk1JazNNVmN1?=
 =?utf-8?B?eDhhY0E1RFdVTVBycjc4MVduTWNqTEtrc3pOYmIrNDZseGYxNThpbjhiZGZ0?=
 =?utf-8?B?OUFwMWJsV0EzRE95NXN6UHZpOW5lTTkzaDRZdUZtOXJ6eEFlS0xKRzAwOGZ5?=
 =?utf-8?B?U3BjZkFsOGZoS1VGTVp2L3loQ21MTnMyclRHT0x6ZWtEelNlOVNDUU8yV3pW?=
 =?utf-8?B?Znl1bnhOYnhyUytLY1R3Z2tHaXppY0IwR2hMc3lwZS8waEdxZ1hLaE5DcG0y?=
 =?utf-8?B?QWs1QkE2UlJEcXRiNDhyUnNQMDZUbGs4MWE1ZDY3L0VrM0NMSVR1VFFOeStD?=
 =?utf-8?B?cjhHN3FPYlRMbTJUYy9GYVJtMS9DUUJQZ1FpazNTaWcwM1dNeENLU1RCaDhn?=
 =?utf-8?B?blVqVmdGUCtaTWgrSHFOREhmaGMxL1BYZGtVNUcxelEwb1I2bHhCUT09?=
X-Exchange-RoutingPolicyChecked: rgyXp84BoFxDbaOUPeAHYPWWnViJFivjUaraRecQGV/WXL2qckq/YJfGT6MG9EoAhj8MiQswVZQnhm0ej1N0RIFOxB7CWXAYqPPfj0G6vuhqo2JG7nQFEDHf88scYhMcen0xOTyTF5rwtE2ec42tw+Mn3GA5rq5SwftSD5OM5Gi+YmqjN8OOP18ZuLOYQRGgFM7IluDy1zhGE2JR0luEJAAFkYZg95YsUJrqMAZ5jqblSpMCu0NK+saBJsrC37HU3As216g1WE89i5fNHnB+rNu2ZP+gT4iuXU3Td1esk1rSbCXVhevdiQ6bdlHMtLUSnBEc9JjTU2czTIJjKZ50/Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e808ba3-3b1e-40a6-c6b8-08de939ca1f2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 05:23:27.8476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8VD+IlrjcXtWv19jwMyAOivt/eD+YDfTwtqqnWNDaZhVWo19cqqyFnuyeetWL6gJ67hVAWXFu/t4Ar69TO9dpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7674
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


On 4/1/2026 1:28 PM, Raag Jadav wrote:
> On Fri, Mar 20, 2026 at 03:55:59PM +0530, Riana Tauro wrote:
>> Add request and response structures for get counter command.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h |   9 ++
>>   drivers/gpu/drm/xe/xe_ras_types.h       | 151 ++++++++++++++++++++++++
>>   2 files changed, 160 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_ras_types.h
>>
>> diff --git a/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h b/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
>> index 4cbde267ac44..fd4248b82f69 100644
>> --- a/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
>> @@ -40,6 +40,15 @@
>>    * between driver and System Controller firmware.
>>    */
>>   
>> +/**
>> + * enum xe_sysctrl_group - System Controller command groups
>> + *
>> + * @XE_SYSCTRL_GROUP_GFSP: GFSP group for RAS commands
>> + */
>> +enum xe_sysctrl_group {
>> +	XE_SYSCTRL_GROUP_GFSP = 0x01
> I thought we can add this to xe_sysctrl_mailbox.h but it seems I was
> mistaken.
My bad.  Will align with other patches
>> +};
>> +
>>   /**
>>    * struct xe_sysctrl_app_msg_hdr - Application layer message header
>>    * @data: 32-bit header data
>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
>> new file mode 100644
>> index 000000000000..b3256a28221e
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>> @@ -0,0 +1,151 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_RAS_TYPES_H_
>> +#define _XE_RAS_TYPES_H_
>> +
>> +#include <linux/types.h>
>> +
>> +#define XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE	200
>> +
>> +/**
>> + * enum xe_ras_command - RAS Command IDs for GFSP group
>> + *
>> + * @XE_RAS_CMD_GET_COUNTER: Get RAS counter information
>> + */
>> +enum xe_ras_command {
>> +	XE_RAS_CMD_GET_COUNTER = 0x03
> We have commands like GET_PENDING_EVENT that are likely to be used for
> wider usecases, so not if this is a suitable place for it.
Sure will move it to sysctrl
>> +};
>> +
>> +/**
>> + * struct xe_ras_error_common - Common RAS error class
>> + *
>> + * This structure contains error severity and component information
>> + * across all products
>> + */
>> +struct xe_ras_error_common {
>> +	/** @severity: Error Severity */
>> +	u8 severity;
>> +	/** @component: IP where the error originated */
>> +	u8 component;
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_error_unit - Error unit information
>> + */
>> +struct xe_ras_error_unit {
>> +	/** @tile: Tile identifier */
>> +	u8 tile;
>> +	/** @instance: Instance identifier within a component */
>> +	u32 instance;
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_error_cause - Error cause information
>> + */
>> +struct xe_ras_error_cause {
>> +	/** @cause: Cause */
>> +	u32 cause;
>> +	/** @reserved: For future use */
>> +	u8 reserved;
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_error_product - Error fields that are specific to the product
>> + */
>> +struct xe_ras_error_product {
>> +	/** @unit: Unit within IP block */
>> +	struct xe_ras_error_unit unit;
>> +	/** @error_cause: Cause/checker */
>> +	struct xe_ras_error_cause error_cause;
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_error_class - Complete RAS Error Class
>> + *
>> + * This structure provides the complete error classification by combining
>> + * the common error class with the product-specific error class.
>> + */
>> +struct xe_ras_error_class {
>> +	/** @common: Common error severity and component */
>> +	struct xe_ras_error_common common;
>> +	/** @product: Product-specific unit and cause */
>> +	struct xe_ras_error_product product;
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_info_queue_header - Info queue header
>> + *
>> + * This structure provides metadata about large info queue data
>> + */
>> +struct xe_ras_info_queue_header {
>> +	/** @total_size: Total size of complete info queue data (bytes) */
>> +	u32 total_size;
>> +	/** @chunk_offset: Offset of this chunk within total data (bytes) */
>> +	u32 chunk_offset;
>> +	/** @chunk_size: Size of data in this chunk (bytes) */
>> +	u32 chunk_size;
>> +	/** @sequence_number: Sequence number of this chunk (Starts at 0) */
>> +	u32 sequence_number;
>> +	/** @flags: Info queue control flags */
>> +	u32 flags:8;
> Why not u8?

flags, compression type and reserved are part of u32.

It's in-line with the firmware definition.

Also it is not recommended to mix the types if the bit fields belong to 
the same type.

Thanks
Riana

>> +	/** @compression_type: Compression type used for this chunk */
>> +	u32 compression_type:4;
> Ditto.
>
>> +	/** @reserved: Reserved for future use */
>> +	u32 reserved:20;
>> +	/** @checksum: Checksum of the chunk data */
>> +	u32 checksum;
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_info_queue_response - Info queue response
>> + *
>> + * This structure provides the response for commands with info queue
>> + */
>> +struct xe_ras_info_queue_response {
>> +	/** @queue_header: Info queue metadata */
>> +	struct xe_ras_info_queue_header queue_header;
>> +	/** @queue_data: Info queue data chunk */
>> +	u8 queue_data[XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE];
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_get_counter_request - Request for XE_RAS_CMD_GET_COUNTER
>> + *
>> + * This structure defines the request format for getting RAS counter values
>> + */
>> +struct xe_ras_get_counter_request {
>> +	/** @counter_class: RAS error class */
>> +	struct xe_ras_error_class counter_class;
>> +	/** @reserved: Reserved for future use */
>> +	u32 reserved;
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_get_counter_response - Response for XE_RAS_CMD_GET_COUNTER
>> + *
>> + * This structure defines the response format for getting RAS counter values
>> + */
>> +struct xe_ras_get_counter_response {
>> +	/** @counter_class: RAS error class */
>> +	struct xe_ras_error_class counter_class;
>> +	/** @counter_value: Current counter value */
>> +	u32 counter_value;
>> +	/** @timestamp: Timestamp of the counter value */
>> +	u64 timestamp;
>> +	/** @threshold_value: Threshold value for the counter */
>> +	u32 threshold_value;
>> +	/** @counter_status: Status of the counter */
>> +	u32 counter_status:8;
> Ditto.
>
>> +	/** @reserved: Reserved for future use */
>> +	u32 reserved:1;
> Ditto.
>
>> +	/** @has_info_queue: Indicates if info queue is present */
>> +	u32 has_info_queue:1;
> Ditto.
>
> Raag
>
>> +	/** @reserved1: Reserved for future use */
>> +	u32 reserved1:22;
>> +	/** @info_queue: Info queue data */
>> +	struct xe_ras_info_queue_response info_queue;
>> +} __packed;
>> +#endif
>> -- 
>> 2.47.1
>>
