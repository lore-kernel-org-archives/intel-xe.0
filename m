Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259ADCD342F
	for <intel-xe@archiver.kernel.org>; Fri,  8 May 2026 07:50:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F7B10F3A0;
	Fri,  8 May 2026 07:50:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d/iSeqk+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E17910E2EC
 for <intel-xe@lists.freedesktop.org>; Fri,  8 May 2026 07:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778226647; x=1809762647;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mqIeR9mw4t5TVcHgrBX4gMqCcaIP5smwtlI8oITBmfY=;
 b=d/iSeqk+244fGubaNBlWul0XAjS1QX5GscN9bC7yT3W9MnLfftd2pbXi
 j/ePb524lfb7+pwdiYZ2oFkKXbyhlsY00RYLuyjLEunsNEol0A1dIX2c7
 UGN/N9kZfQK2LiZFyHlY/0t8PSSN//kkRFtcRsC6A7BEKLIFsEjTjpz6O
 lKvhs+M6WefKvlfh4tbAFvsjSexCRtk7PfztRQPxV2EvVwdYjV9ypBF0X
 S6CeoQXvgvyox5g9VYhKfNkDpjtLbmkwzA8xabHa9awABGN0F4vFpeLT8
 BwRCihWu3dzN1vZbVTFE+5KUtNkpyzfJBvQVsSwwC6Dd7FI4ncUlAknfm w==;
X-CSE-ConnectionGUID: nx6G/mOFSrKGPqsUrR+2xQ==
X-CSE-MsgGUID: LvIN7Lg2TcKqdHkqCBMnNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="83038081"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; d="scan'208";a="83038081"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 00:50:46 -0700
X-CSE-ConnectionGUID: pBS8aA1rSPmsnosxpDbAeQ==
X-CSE-MsgGUID: Kh7ZEX3TRvC/VmUkvISOAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; d="scan'208";a="236636321"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 00:50:46 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 8 May 2026 00:50:45 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 8 May 2026 00:50:45 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.6) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 8 May 2026 00:50:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hkuCgixYGt2+sX7dKTaRc1nvAihv8BQwBDXHUDvNMUyd/+jQp4gPPdJ6PfgG2jTmmCijt4MkaI9HfsNkfeNQm2JzI2E669tEPbO8n5b6tya3KM4NxZUlMJi7OrBiORXppMJaVYlzj5EJCf/mR1lFE624LX6kCKuNKnmOxjDfdOHd37PHzYKGZX3747a6UaksKI2UoniQ3yj4c37ZoH0aWsuoTITjPuB6swYKDZ84whn009MFeWtzZZAFKZ+XbsX82pCh2NuD4iczw983JFTHHQCT6Ew9b3X0PxJ+VTaQomW7PbbkHEcs6AUMj4Z/mm6WdNTJ83s+jmP15I/TRu9NrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u19ZeB4ZFm5WAJzTfVVgFswQBVmqtxebCw2brmmKr7s=;
 b=Z5V8VKyVWREGzRO9LO358wpD3G9RiJ9Qa2afNLktn/+pl5tnh1H+bFseKKhAaBu/y99Igcjn/Hf/DiZGs3SO4ztkR13nQkaTqgywB7XoHZ6cldu68eAddkDU2/bDzXA7gmR1rxq72heFnHeZiphUYrkeWs0L85ULaqKwCR0r6jzL8mCvF6j+vgPEWcZbVgbpWCzq4WNOpJ9UV4RzFzZGvr5HSNfGLLiM9O3s1I8L10WJ6+cfMpn6E4ZmdOsbcfeR3pcocKEl14mRXzqrpuFaWjarH8kagtm8fUJTMhIlAua0p9gdM022mOBaur0MdqDTL3IGNhII4+9FbDDONs0emQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by SN7PR11MB6899.namprd11.prod.outlook.com (2603:10b6:806:2a7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Fri, 8 May
 2026 07:50:43 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.20.9891.008; Fri, 8 May 2026
 07:50:43 +0000
Message-ID: <c4df83de-8203-4b2d-b0f8-c8076fcadac6@intel.com>
Date: Fri, 8 May 2026 13:20:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/6] drm/xe/xe_ras: Add helper to clear error counter
To: Riana Tauro <riana.tauro@intel.com>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <soham.purkait@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260504065614.3832331-8-riana.tauro@intel.com>
 <20260504065614.3832331-11-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260504065614.3832331-11-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0234.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::8) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|SN7PR11MB6899:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e7dec21-5e14-429e-d364-08deacd68174
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003|3023799003;
X-Microsoft-Antispam-Message-Info: QLzuiAXJAA23C5oNFVuNoaYAcW2PEfFalE3YIdD45qAn9dwUkn2xYOwPW9/+6hl2JJgPVEthxDDgqMe0ezkfxLkwRa2d7932jhomlbRlyKXfo5JCBWAARJbOhGJnyvXl9cYw7p1CxBptA55Hcfi8NJXgtePDy1Wc05NsQfXEKVDx/98u/25XrSSTWvw87KBA8aZ/l7wMSYS9cyPV+6nMoDrXrnqX7AgC4orEFFQyroXVKZI4e9AIo853w6h2+RzEKYjZCy72IhXAr1BIDO1aD9rROFp9nzHgoSQ0HoYZByWYnWFhDvEIOtbqPyGh3jsfeclRz9BQEd8iX+sZUjGW4CTwOdcXFy8g30+2ff4hV2PaFH0IL8HR7FFUca4eD8vR40oxSkIa7ILs6rQ+KO/0W8k5p09Rj3/6U62M2N7rUKKnBpz8aIshTzu3NIw7Dgg31qC6HTEKCEF6xTRUaMcd7iZc+ot3zk5Rk6H1NCUoD2BMQIXJHZoRve+giI5wk8Zek+YxnlzKgp6y7G1JdTY0THX9BIm6MaFGKmtfKTxrKvyox3oPDJ3s07goSZs+7r5cJviETTUn52xvNVK9QHne8E0jIoQCCcNE5/IVvkDSUcphJb9hz83wz9pHdMAT9tIHUR6kxuazYsLBeVTxJWFHFhz4Hs6crzP+lSsSKY0sWwy+3cIxV0NjldnoTBg3lIsk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003)(3023799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3Iyem9mVm1pcFQ3dG0rOFNKSllMVHk2SWFJREhHNTYrWlpINXlhbFd0QUJ0?=
 =?utf-8?B?SlNqM2diVWdCeFpFcmE3VDZscEhRSWMyREhUZlVuZmc3WGNsSDJVbkxORFoy?=
 =?utf-8?B?cXBMcHhUOGRZdGpIQnBLa2dZSTZhdU9ya1hsQmtaQllXTE9LZ0NqMjhMK2l3?=
 =?utf-8?B?czdTVzF2SDBKWXpaQlgyMkVXK3Npbm1BcERXMnlkOTlDczMvOXNrQjdiSWxI?=
 =?utf-8?B?WXV2V2NFTGVUYWZudHEvcGEzekdCS0FocGFXek5EL2liQjU5MFFmS1NlUjY1?=
 =?utf-8?B?Y2c1WUFCQmplRlRXRHBQUjdxRlZGVnN1Rys1QUhwOCs0czdyMUh2cDBjQTdS?=
 =?utf-8?B?TlEvZVFOT0FlKzE3TWMwd2YzMFJmVFhGWFdkcnFMSVlDZVFZUTQwQWk3ajEy?=
 =?utf-8?B?bUdXTjhiZCsvYUczTmtlTG5NajFNWHpCcTdqL2RzVzZuMTVROWVIV2d3VWln?=
 =?utf-8?B?RmNjYzE1Y2lsd053R2o2MUl2azVWUThIS3B3UU03UnFHKzIwWjZENUJqWHJT?=
 =?utf-8?B?bGROM1FYWURoUC9QaDFkbUJMYldVNytFNkhQY2lUNTV2TTRZT3JqaFArbUFQ?=
 =?utf-8?B?MXpPZ2QyeDFNelVMYTlUcHhNM0l0dUpPUGtkME5xQnE1Nll6Q1p4eHVHaHlm?=
 =?utf-8?B?ZEFJQlMxTE9NLy9tSlc2SlF3YXRpNGdPZWJjanpUVk1HdEoyNWxGMUFLaldG?=
 =?utf-8?B?c1Y1cktDRmd3UGFSTFAyZlROWU9CeENSMWJOcGQxclU3ekVPbmFZQ1ZmaHNR?=
 =?utf-8?B?ZDdvdHl5dXdFaW92eUJpb0VpelFxN3BFdkFkdy9GWFRPSzdxeVNrclFxVCtz?=
 =?utf-8?B?WWdjYks4RDJjWThUa1FESkdQYmcxTEpwMzJBZVUydmE5KzZFNzBXaUM0WWw4?=
 =?utf-8?B?eXZ2Y2ZXdlpVOWU4UWtIS1lhTGdQemtPR1pGdXl1OTN5dmxpWmtvMUo0TnhM?=
 =?utf-8?B?anBaajNzeVIyTXNnWHlDUVlWazV1Qy9PQTVJU2dOaEtjQUs1ZDZKLzF5TzYz?=
 =?utf-8?B?MllTTTBZWUFKOGFyeTBsb0xTZlgxaEZnTUtXYzM3OXZheTQ4OUJTdU9GZ3ls?=
 =?utf-8?B?WnpydDFUNTE1STJDSkIxOUJIN0k4bHFXdlBYdmZMUERiSWFzWmRMVWp2QmVS?=
 =?utf-8?B?R1FPalhHbENZeGZvU1IwYUcvWlJRSll3S3RjNjhGK2FkUTdCb3NFb0pQNDB4?=
 =?utf-8?B?dmdNdDVHOHJJek9jVExEL05jdmRsVWF2WUV2Z3pMaUl6S1l5VmZHTFFFV0Mw?=
 =?utf-8?B?djc3eDZSbm4zNm1JeS9xREpJaFZ1WXJmUmtrYjRVZGovMktDWmdjcGFmT1lZ?=
 =?utf-8?B?RHJ2YUF6N2RZZy9XYXgwcUVLWkkzTU9qb3FQb3NTSGNaUUhKUkVQVTJMZGdy?=
 =?utf-8?B?QzMxK1R4S29Qd08reDhlNWpxU3B1M2UrZWZFVHV1KzVmM0dsL0NOUXhndnNB?=
 =?utf-8?B?QVM3M2JxQU9hUjl1NEhraEt5WnltdUFTcU5XSGdOM01DY1dBUE9Dc3MvRzdX?=
 =?utf-8?B?Z2RqUUcwSEUzcWVLSnU1ZitRWmNHRlVJeFR0MTkwSlE1OVdlL2w4bEE0T2Jz?=
 =?utf-8?B?b2VtSWxBbzNYaGVBOWNUT2NYSWd6NTR1T1NRMjVKTXdoZGN2aGtFNzhWSzN6?=
 =?utf-8?B?NWxYWms5N1A5TURxWUJvb25hTjZ2QXZEZDFlT2ticHNlZFhmTEFZUVBaSG1H?=
 =?utf-8?B?ZitpS2hYTDFraTBoYTgreHRINGFCNXRYTXVjMjhkWEhWaUZTRjE5N3N4SHBr?=
 =?utf-8?B?VkM0TVZQNk10aW9QMVI4NkJqdFJqVkJIMTV5cUZpT0tDNkYrQmVKN3lzUUZN?=
 =?utf-8?B?ci9jaG9pVWN6cnR5bGNZSmdUdURFbnJ4NVBHWGI5WlVET1oxbXliL0U3Qmtw?=
 =?utf-8?B?d2tNMVdjOTdrdXVNMUtzUm5GWWZ4alpSZEpBamdZRFFDUXl6eUxjVGZmSkVB?=
 =?utf-8?B?TGc4NVFhWmtYdERRaFI0SUVFa0hYdXhkQitPSDAwSlUvaHpJYWlYOGZWTWpQ?=
 =?utf-8?B?b3hWWmZNNjlkczFkNmNNNXdiQjQrbFk4cjZYRWw4ejB2NVVScE1NRmhGL2x3?=
 =?utf-8?B?NC93SFZYM09LV1gxd09Qajg5b1FHdG95ZXZ2bGF0Z2IvYUFZT2d3K1JEM1lC?=
 =?utf-8?B?WVZyQjV2eFVjZ2oyY0pEVkVMb1hxUFU0UkdqN04vRXE3czV1Zk9QZ1ZuSHdP?=
 =?utf-8?B?WTREZjlsOXgzdERhbUw1YTVhQldIeHFBZTRITzRvVWJ3U2pDbEt2RVVyd1NN?=
 =?utf-8?B?WEg3ZXZSY0dxQ3UwVFIyZTF0VytNQkljSUFpVTUrTFFyMU9WQjFMdTVQZHlh?=
 =?utf-8?B?d05SNUk3Q2RmelZYczlGS01OL3dORjQra2tzVVJJTGtGV2R3OHRCSkdmbHlp?=
 =?utf-8?Q?IxWYSHhE3opPXrh8=3D?=
X-Exchange-RoutingPolicyChecked: HTCgOP2rcahdB2JvtaUnoQimP2KoRyx7YHPeNpvHJpCt2ZSATRYm5YLLEH0vP6Leno5CDHXtg4fF2A7DrJgm3V5o9OIi9nwKJ81yPa6Mk3WnzhmEkvX3omwGqP5Yx3isbscWg43cLl5c2EDF/7xAUYXPQ4ESBzHHjSQBuhkRIjSurRyOHOASmVEAnA45J5v1W4W8GjdHLpWbbY6HxMQZN+kGajCo1pdgHOusOBQUNHnp64hrWXBMaro0zx+6LxoEYqWwx8rwggZ8Q940lGTTvINfxDuadR9qFDt23Jn52AeJji4uvL0KEH+nOKhGZDLE0dNVIY0EkxUW/QUZM5kqDQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e7dec21-5e14-429e-d364-08deacd68174
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 07:50:42.9863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TATzMUhO8qYWMN7KUmhvRV25Df8tnnhHdkgs6Fp5pdOgk3G+eKGDx6NC77Akzsp0A+IxLsJaHjXR1t5XnD0/GgfAdcpwioFDLX/srj+QFYo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6899
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


On 04-05-2026 12:26 pm, Riana Tauro wrote:
> Add structures and helper function to clear error counter value.
>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
> v2: add status codes (Aravind)
>      fix log message
>      squash structure patch (Raag)
>
> v3: rename function
>      add comma to enum members to avoid
>      redundant churn
>      align with tabs (Raag)
>
> v4: rebase
> ---
>   drivers/gpu/drm/xe/xe_ras.c                   | 76 +++++++++++++++++++
>   drivers/gpu/drm/xe/xe_ras.h                   |  2 +
>   drivers/gpu/drm/xe/xe_ras_types.h             | 25 ++++++
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  2 +
>   4 files changed, 105 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 47a58ce3b3ca..07f6837694e7 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -34,6 +34,17 @@ enum xe_ras_component {
>   	XE_RAS_COMP_MAX
>   };
>   
> +/* RAS response status codes */
> +enum xe_ras_response_status {
> +	XE_RAS_STATUS_SUCCESS = 0,
> +	XE_RAS_STATUS_INVALID_PARAM,
> +	XE_RAS_STATUS_OP_NOT_SUPPORTED,
> +	XE_RAS_STATUS_TIMEOUT,
> +	XE_RAS_STATUS_HARDWARE_FAILURE,
> +	XE_RAS_STATUS_INSUFFICIENT_RESOURCES,
> +	XE_RAS_STATUS_UNKNOWN_ERROR
> +};
Add XE_RAS_STATUS_MAX right
> +
>   static const char *const xe_ras_severities[] = {
>   	[XE_RAS_SEV_NOT_SUPPORTED]		= "Not Supported",
>   	[XE_RAS_SEV_CORRECTABLE]		= "Correctable Error",
> @@ -53,6 +64,16 @@ static const char *const xe_ras_components[] = {
>   };
>   static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMP_MAX);
>   
> +static const int ras_status_to_errno_map[] = {
> +	[XE_RAS_STATUS_SUCCESS]			= 0,
> +	[XE_RAS_STATUS_INVALID_PARAM]		= -EINVAL,
> +	[XE_RAS_STATUS_OP_NOT_SUPPORTED]	= -EOPNOTSUPP,
> +	[XE_RAS_STATUS_TIMEOUT]			= -ETIMEDOUT,
> +	[XE_RAS_STATUS_HARDWARE_FAILURE]	= -EIO,
> +	[XE_RAS_STATUS_INSUFFICIENT_RESOURCES]	= -ENAVAIL,
> +	[XE_RAS_STATUS_UNKNOWN_ERROR]		= -ENODATA

Are ENAVAIL(No XENIX semaphores available)/ENODATA(No data available) correct errno choice?

> +};
> +
>   /* Mapping from drm_xe_ras_error_component to xe_ras_component */
>   static const int drm_to_xe_ras_component[] = {
>   	[DRM_XE_RAS_ERR_COMP_CORE_COMPUTE]	= XE_RAS_COMP_CORE_COMPUTE,
> @@ -70,6 +91,13 @@ static const int drm_to_xe_ras_severity[] = {
>   };
>   static_assert(ARRAY_SIZE(drm_to_xe_ras_severity) == DRM_XE_RAS_ERR_SEV_MAX);
>   
> +static int ras_status_to_errno(enum xe_ras_response_status status)
> +{
> +	if (status > XE_RAS_STATUS_UNKNOWN_ERROR)
> +		status = XE_RAS_STATUS_UNKNOWN_ERROR;
> +

Check status against XE_RAS_STASTUS_MAX, if it failed log in and provide 
-EIO and return.

Thanks,

-/Mallesh

> +	return ras_status_to_errno_map[status];
> +}
>   static inline const char *sev_to_str(u8 severity)
>   {
>   	if (severity >= XE_RAS_SEV_MAX)
> @@ -182,3 +210,51 @@ int xe_ras_get_counter(struct xe_device *xe, enum drm_xe_ras_error_severity seve
>   	guard(xe_pm_runtime)(xe);
>   	return get_counter(xe, &error_class, value);
>   }
> +
> +/**
> + * xe_ras_clear_counter() - Clear error counter value
> + * @xe: xe device instance
> + * @severity: Error severity level to be cleared
> + * @error_id: Error component to be cleared
> + *
> + * This function clears the value of a specific error counter based on
> + * the error severity and component.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int xe_ras_clear_counter(struct xe_device *xe, enum drm_xe_ras_error_severity severity,
> +			 u32 error_id)
> +{
> +	struct xe_ras_clear_counter_response response = {0};
> +	struct xe_ras_clear_counter_request request = {0};
> +	struct xe_sysctrl_mailbox_command command = {0};
> +	struct xe_ras_error_class *error_class;
> +	size_t rlen;
> +	int ret;
> +
> +	error_class = &request.error_class;
> +	error_class->common.severity = drm_to_xe_ras_severity[severity];
> +	error_class->common.component = drm_to_xe_ras_component[error_id];
> +
> +	prepare_ras_command(&command, XE_SYSCTRL_CMD_CLEAR_COUNTER, &request, sizeof(request),
> +			    &response, sizeof(response));
> +
> +	guard(xe_pm_runtime)(xe);
> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +	if (ret) {
> +		xe_err(xe, "sysctrl: failed to clear counter %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (rlen != sizeof(response)) {
> +		xe_err(xe, "sysctrl: unexpected clear counter response length %zu (expected %zu)\n",
> +		       rlen, sizeof(response));
> +		return -EIO;
> +	}
> +
> +	ret = ras_status_to_errno(response.status);
> +	if (ret)
> +		xe_err(xe, "sysctrl: clear counter command failed with status %d\n", ret);
> +
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
> index 74582c911b02..bbb9d42bd128 100644
> --- a/drivers/gpu/drm/xe/xe_ras.h
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -15,5 +15,7 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>   				      struct xe_sysctrl_event_response *response);
>   int xe_ras_get_counter(struct xe_device *xe, enum drm_xe_ras_error_severity severity,
>   		       u32 error_id, u32 *value);
> +int xe_ras_clear_counter(struct xe_device *xe, enum drm_xe_ras_error_severity severity,
> +			 u32 error_id);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> index 74d85875cd63..44369fc8ef03 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -100,4 +100,29 @@ struct xe_ras_get_counter_response {
>   	u32 reserved1[56];
>   } __packed;
>   
> +/**
> + * struct xe_ras_clear_counter_request - Request for clearing an error counter
> + */
> +struct xe_ras_clear_counter_request {
> +	/** @error_class: Counter class to be cleared */
> +	struct xe_ras_error_class error_class;
> +	/** @reserved: Reserved for future use */
> +	u32 reserved;
> +} __packed;
> +
> +/**
> + * struct xe_ras_clear_counter_response - Response after clearing an error counter
> + */
> +struct xe_ras_clear_counter_response {
> +	/** @error_class: Counter class that was cleared */
> +	struct xe_ras_error_class error_class;
> +	/** @previous_counter_value: Counter value before clearing */
> +	u32 previous_counter_value;
> +	/** @clear_timestamp: Timestamp when the counter was cleared */
> +	u64 clear_timestamp;
> +	/** @status: Status of the clear operation */
> +	u32 status;
> +	/** @reserved: Reserved for future use */
> +	u32 reserved[3];
> +} __packed;
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> index b315847cbf64..6e3753554510 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -23,10 +23,12 @@ enum xe_sysctrl_group {
>    * enum xe_sysctrl_gfsp_cmd - Commands supported by GFSP group
>    *
>    * @XE_SYSCTRL_CMD_GET_COUNTER: Get error counter value
> + * @XE_SYSCTRL_CMD_CLEAR_COUNTER: Clear error counter value
>    * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
>    */
>   enum xe_sysctrl_gfsp_cmd {
>   	XE_SYSCTRL_CMD_GET_COUNTER		= 0x03,
> +	XE_SYSCTRL_CMD_CLEAR_COUNTER		= 0x04,
>   	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
>   };
>   
