Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0DF3C5B56A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 09:23:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 542AC10EF10;
	Wed, 12 Aug 2026 09:23:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JDTpySHx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2E1410EF10
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 09:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786526617; x=1818062617;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HfBM3d+clo1e+1Aoc5RWSUneoDZADJnM6vmmME+rsdg=;
 b=JDTpySHxo2rWYp5c8n7/Cyd9DCKJRp6i8vJajrMJuoQBB4lzHj9jIB3M
 QWKxt4kzioCqEiBBRveFhfWlzzLmDvtStdOHn8gTbLm7Zkf12J2N/asKv
 YHem/m8t1+AeUbLVJCqZbxHnxIYUzIPbpZv09UUGXqTpmU4Np/AfKomcO
 vf/GwFbai+tPAAIZvD1IxAHz+hZdc+/MRjMWuhqZuFMvjJi5b7bI0Kx55
 S3CcROee4QBwRWz/uy9Von8uVjGs7Xs8MVn7k0ys5seyk8ZRjlo9XAZog
 ZjtKo+KmW+9zm5EujVf+4Aowb12JUjpPMT9wDXfoMyq7hFlnSiB6Q5l7W w==;
X-CSE-ConnectionGUID: OyyzwH8FQEKyE2UVrOhYGQ==
X-CSE-MsgGUID: /MmV+vsnT/Cqi1QJixUPSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="86928694"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="86928694"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 02:23:35 -0700
X-CSE-ConnectionGUID: 8jATra3PTymC0sWvuJxgRg==
X-CSE-MsgGUID: zTbO6amNQlCSNK4gTElU8w==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 02:23:35 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 02:23:32 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 02:23:32 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.5) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 02:23:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eGTrKCBEWIuZqwQ3HU+HHCCY1jSeAIz8P6S8Gasay3ZBH8BPNvjXVfM8TKJukrujeyQ2vCHRNrb+t8AZq4XgfkNBIr7jo4wWbgfNKAwSI088vlhOK9lEuEdY43Xgb0BnoYdWdJDEIr3bs7kj0CIDOTqm372fvm5dno2XDnuQlDklT+aMhE5TjhDEucQkCRSdNtNvOv63WpzlGG7kmQ5XrGfcROM+QWsuEt1byt8Rao81KqjS4Qoq8ne3ItrcU1/8j2dPb1IKTAiAsZq/sotmLGNCRZujXydrNOx04qHyteZNFcTUic93TG/EdzV+UVwGR7fa/Oq4mHTsIpIVLzIwfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6LAL4byWsn3zDQ8BleUZYzgX/B50A7lfOv4GdsUsFxM=;
 b=JgPuyOxqmDV9ZYrxeARl5mF2Rh9FRZ/0RjgZ5cEGLQqUlP9wTKVRD0Q1kPRuPxMtztjjin17TXONOdUnz+DSj/r1FhnuW0/RfCnEOawwF2pdNITLMWYFAxI6T4tPpuo68bsvE3QvwKKlC/Z/28xqbmq/Y8MvAbOxmBa24sqDTaeOrWZAocuPWq3cvuhnBf6NEo2lrFd0ANupsVTlSsBJ8xTvwz3ybJO20iT6CbJ/xkdTrMAXzNqtVAyqAevXBQw8TpCxu9o0FQPz9I2cRzhiazWKrwVJ1WfagkG5XGDkH4tFmu3S7J/WwixuigSqr7bgNlqRfZLHDGXTAcIv33gWrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MN0PR11MB6035.namprd11.prod.outlook.com (2603:10b6:208:376::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Wed, 12 Aug
 2026 09:23:29 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0315.011; Wed, 12 Aug 2026
 09:23:28 +0000
Message-ID: <eebdc58f-ea74-4f98-8448-1b162d1d8611@intel.com>
Date: Wed, 12 Aug 2026 11:23:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 23/23] drm/xe/pci: Report 'cannot re-enable' error
 using SIGID
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Riana Tauro
 <riana.tauro@intel.com>, Aravind Iddamsetty <aravind.iddamsetty@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
 <20260730152121.576-24-michal.wajdeczko@intel.com>
 <138490b5-9fd2-4921-9287-ec0d4434d7de@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <138490b5-9fd2-4921-9287-ec0d4434d7de@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR04CA0106.eurprd04.prod.outlook.com
 (2603:10a6:803:64::41) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MN0PR11MB6035:EE_
X-MS-Office365-Filtering-Correlation-Id: 65428fdd-f521-4b60-e79a-08def8535e8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|18002099003|22082099003|11063799006|56012099006|6133799003|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info: zW2e7q0f8dSpEDuMTIZCfr7P2aKEFPQDfDfgmIKvnksH/LFSiJDeq3zVmBvtuMpvPE2VjWRoif2KueZ/gd3cssxAFcVz6x21+4eBd559EYV2qeptyDFBhhucFKtk1pJ/kaUpBXUCPBGiRkBO3pfb2eELeBLklrMM2fuCdjwzlJw1XD35NG72S4SfkxlsC3Uvaal60LJWwXBuUSsaxHrcvcN0iGcx2lNGhQ7d9+BXCuPbTDqXpbzWWfyGOZGP2MJgHpU5mQNcmuktfvUPUuKXYwUeLozmNjeUM60Ht4tASTYTzVHr94wTYTyDYLbMdGOENCcjNWzZxjmKeCWATADpd+MIAL3QnnbTxCRcL6mdThtWmFrB+My2QtanFVyrNXc/IvP2NBPPbE6DOWMvAxjxDoWO4bJ4XhSSUfmFd036dH4h1dtYdhG8RGCu80E3s41nRwx+2R34zP78/Lkvhft9GM1ymn1sbsdFX8/HJ6dw149uuA7jNvu8nLlKs6liUxrAf9046IBmFWKHDuEoqigGpxSxQc9rytEBkq768iQkJW0696gBNWV7ihPsSVuqord7u4BulVFvvjG6jsGT9F/OwOzf6fqz5wxs9ikt17n8/oBK9AK/ede4LsW0FlX0zzteQiLc6QMAwN9HC5E85W1gnKvgdk8y5KwkEZLGzjmpEhA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006)(6133799003)(10067099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0RmaUVrNkt4ckhrMGE4VnhwRlJ5aDNqS1loWjllWlpDTUpEUnZEMXE2OGE3?=
 =?utf-8?B?L0tYU3pVME0yM05VZEJmL0hFbUFNU2ZIbEh2WkkxQmwwa2pKN0dNTlVGZFJO?=
 =?utf-8?B?eHZPRTROMW5wRUFZN3BvQWt5V3REaUVtM3FRVU53NU9ZUDE3clpxUGhlWHp3?=
 =?utf-8?B?cStvVGRtZEJoQW1La2xaUTNoRW41bU1BZTRLaVBSd2ltLzk1YUZrOTlnQmJ4?=
 =?utf-8?B?cjB0KzVOeVdxQUIramNhTWtBR2JWK2luS1RKUnNNK2FpZkpyRHA3RGFyMUta?=
 =?utf-8?B?VmFmejNjbEhUZEJZM0hPcjFlNkVNTEp0akJHZnYzb21LTnZtdUtSKzFJOTEx?=
 =?utf-8?B?Qzd2L2tEZVE1ODNGb3NzTTFvcTBxYzBKRmtNbzI2Rm9HVmh2QUQxMTAvdGc3?=
 =?utf-8?B?S3QvVDYzVWdoYjlnb3YxbWtUbVp2YnQrbFZpNzJ2c2tKVVdvMFIwS1BKVCsw?=
 =?utf-8?B?V1k3TEtuREQrMVZCTE9yUkpWRDVyWWVlOE9kb0t2WVUycFhxZGozQ2hwZXFi?=
 =?utf-8?B?U010RjdGUGdacWRUOXUrMVlqSFhIcHNZZ2tVbHJJbVdiMEdqSDgyTmNWcE9n?=
 =?utf-8?B?bmd1NEQ0TVFVNUh3c3hWK0NobkdLYm1oa2NsM0tsYTgzQ1kzbnQvd2pZT1F4?=
 =?utf-8?B?WXRwSDVkWE1GblZGYVExdTZsM3lWajIvdkFMZS9nWmNqL0xvYWtjQmxYZ3Ni?=
 =?utf-8?B?OENvRytrbk9JZDhMQ0dQU2lPNW5NOVo0Q0RYZ3dvcmZsZ3YveHY5dmFjWDFu?=
 =?utf-8?B?SEpyL3hNTjBKZ3RjNktxQnFHUmxEd011ZXozcE5lSk4wQVdkV3g3YVlpSzB0?=
 =?utf-8?B?NnVOK0l3VC8vWDBzMk9sU3ZOaThSSHI2TmthRGo3djJ6MXZHZThHbDEvQzhW?=
 =?utf-8?B?WFBsbS9sWEhrQUtITHg4eFZWSFhRM3hhVHVZK1g4WVkvdzhiTjZoMzFLUFpy?=
 =?utf-8?B?Qm1NN1pQMk9OamNRWVVKamhXSENLSFdOWHd4R3NrbERHZkNuRFh4ejFuWVZ3?=
 =?utf-8?B?RG5aNVBlNmhxSytxekI0WXpFM2grclBPZVhVSkFpbG9YMUtQeXN4Y3NTSU8z?=
 =?utf-8?B?eFVIZUN3TXk4dURVTHVPWUdqaXQrV2ZtV2FsZ0FFak5jdkdQcFBRM0o0dlZT?=
 =?utf-8?B?blE3d1l0WDNKMmJ3U05FTGwrMnJZRUJaVnJGR2dhRU1HWkdWMEs4WFhkWnlR?=
 =?utf-8?B?eXJLdHhMOU02L2hCalJhMWN4aGtCV2hvc2xRT3BMWHBUNk5UK0Zkck9ERGU3?=
 =?utf-8?B?UVNWWFdGenJJZ09YMlRuMkhMRGRLNmI4VHUzN2QvZXNzTXdWRXFyZ25jNTR2?=
 =?utf-8?B?ek8zUHovcERKOHM0dElGbEJhRjYrVHl6QnVRdVRJL213L1ExNkNqM2htOFZ4?=
 =?utf-8?B?azZra1c0Vy9nNUZVeDF3SmJ2SnhBZFRhbkNPL0NVSG42NE1ER1NWZHpSSnAz?=
 =?utf-8?B?ZG1MTHFQU3AwVFdLU0FjZXU3N2NlS3RWWGJiMHpwY3Y5Q2FxQXBITmEyOEpj?=
 =?utf-8?B?ZGpITTJoZ3Zld3hyWFZwSkQrN2Nlc3hORy9YWHl6eTVQTno0ejZLcWxhS1Fh?=
 =?utf-8?B?cjlwOXFpZVJLcXFRZGp1b1ZGOTR0bXo0L2xmaEJPSlgxZEZpREpZZWNDK0xu?=
 =?utf-8?B?VTQ1WTkycDVMK0JJamR3VG9HMzFkaVF1Y3FaRFc4UW04VnB3Y2hlYmZHeWIy?=
 =?utf-8?B?R04rTEdJS2t3YUVJQTVLODZXY3hpbDJaMC93bWc3ZnBTQ1JHdklBWlFWc0FV?=
 =?utf-8?B?VmdlbmtUbVg0Ukc5eTJzMllGM0dUUkpvdmd4eWhlRDNOZHJ0MUY5VFFCWG9i?=
 =?utf-8?B?Z29DbWxjazBlWXVMN2paL2pCUUs0SHdxUE0wVkJBWW5UTEZXQnVCYnQ2RDBl?=
 =?utf-8?B?VEdidXNmaVl1N0R6bGtNUDhkcDZ0MDRzTWhCRFpjaTdwQXhBcGhrbk5TSnAv?=
 =?utf-8?B?R2NyL0V6bThWRndVTzNveGo0dHJUOVAzTldIZDRvUDJHUjZvdk80b3FEd0ZZ?=
 =?utf-8?B?WVZBS1o3LzlLMjdtOERWSHRhblNURVc3cXJmN0VXbWpSVWwzY3FYZk1yQ2Zn?=
 =?utf-8?B?OUVtaFFBUldsSElQWkpmTHFucGhISHljQUVlZUxDR2lpb3BWVDZGMDhnWlB6?=
 =?utf-8?B?UHNwSzVkbFBxNkc5eXF0Y1RGSUNtTkNJRm55NmhudEsxc3ZoVXh0cXdOcm5Q?=
 =?utf-8?B?UlNkUjUzNXhjM0tTdkdvMEdocW9XU1dLQjFQTXdHRnFSRHd0eGlzUHl1cVZl?=
 =?utf-8?B?K21ZdjMxdnUwSy8vM0FmRFM3dnExQ1FLUGFzVWtkYkRIZVk2d1U5V1RqL29H?=
 =?utf-8?B?Njk2NU5ZMXNTUGpvTi9FSWRKRE9GWjlFMTNWZ0JZTmw3NWt6RXZsNGFCMlBU?=
 =?utf-8?Q?cAocnovh4zNbPTFs=3D?=
X-Exchange-RoutingPolicyChecked: TCE2ckQWzdX59V69ihjmy/XeSMu9h0BitgVNcgDiLGMTQOj8Ta7jLbd6Om3M2h5dr/bCDbsNppHlRH++W28FlSV5LTIfpfueYCPROoFZY6LfS6Ifpk8x+1jikcij8rsTtp37fllTNYBRBAIbDzLBI8nkDCEJHZ+qBRpT1fpsp8sBRvjEB6w5JmMp5l9G4ml7oVx/C9V7lxFBfg0+MUZ7qGvMLWE/8oEnqw7Zw9SKnkIqwT4+5XBLK3m/0M9ZWjG3+0aC9X9pAr2rzB+N/LWrrTbvmnLZ/O5Ox7CcNDqdrIb/qyxQzIDIkx3MAPf6+LNHSI9iODeF/L1b4YoU/nz5og==
X-MS-Exchange-CrossTenant-Network-Message-Id: 65428fdd-f521-4b60-e79a-08def8535e8f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 09:23:28.7068 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9SF+TMy+0WnZiedinj0ybEsKBJRuKZLHuURS4HtgEDknk4IZlGyY1QhulOCB2jVD60MCPWwEOEZBBKXLU6FFF+7AKbPF2XcS9dqEPyrd/x4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6035
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



On 8/12/2026 8:58 AM, Mallesh, Koujalagi wrote:
> 
> On 30-07-2026 08:51 pm, Michal Wajdeczko wrote:
>> Report 'cannot re-enable PCI device' error using xe_log() helper.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Riana Tauro <riana.tauro@intel.com>
>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pci_error.c | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
>> index e41af2ac7f23..fb965f52be5e 100644
>> --- a/drivers/gpu/drm/xe/xe_pci_error.c
>> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
>> @@ -7,6 +7,7 @@
>>     #include "xe_device.h"
>>   #include "xe_gt.h"
>> +#include "xe_log.h"
>>   #include "xe_pci.h"
>>   #include "xe_pm.h"
>>   #include "xe_printk.h"
>> @@ -90,13 +91,15 @@ static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
>>   {
>>       const struct pci_device_id *ent = pci_match_id(pdev->driver->id_table, pdev);
>>       struct xe_device *xe = pdev_to_xe_device(pdev);
>> +    int err;
>>         xe_info(xe, "PCI error: slot reset\n");
> Please use xe_log_info.

but do we care now?

it's info only and I guess we should prioritize to convert
real errors into SIGID logs first

>>         pci_restore_state(pdev);
>>   -    if (pci_enable_device(pdev)) {
>> -        xe_err(xe, "Cannot re-enable PCI device after reset\n");
>> +    err = pci_enable_device(pdev);
>> +    if (err) {
>> +        xe_log_err_fatal(xe, PCI, err, "Cannot re-enable PCI device after reset\n");
> 
> PCI component used XE_SIGID_SW looks semantic mismatch, we can add DRIVER_HARDWARE with PCI 

but introduced in patch 3/23 component PCI represents the component
that is beyond our Xe driver (part of the SYSTEM) as we don't manage
that directly

and since our SIGID choices are limited, the generic SIGID_SW is
the most applicable IMO

if you disagree, please comment patch 3/23 as it is already
reviewed

> and make
> 
> a PCIe link failure that required active recovery right?

this code is already part of the HW error handling
maybe we should (or there is) declare wedged

but I don't want to make here any changes beyond simple
conversion from xe_err() to xe_log_err()

> 
> Thanks,
> 
> -/Mallesh
> 
>>           return PCI_ERS_RESULT_DISCONNECT;
>>       }
>>   

