Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE143C531F8
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 16:17:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B3B110E5C7;
	Thu, 23 Jul 2026 16:17:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zydke821";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B39E810E5C7;
 Thu, 23 Jul 2026 16:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784823418; x=1816359418;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dm5j6N28eVuNPbO94lmkKAVZ2cU5XdVYEU4yzLfpAGs=;
 b=Zydke821lMntuPQiMQxJ7TYL+gl/BYvBq370y6G1F35BML0ho3yBxmY7
 ueGLZ0fwovkO09+uzxIZQMaH7xmxXIVfz4z8Ai/BIapp0ab0aPomjmn5E
 i5JknfSQ8qnDxCO9WuwT5RbMDqqwi8twD9u6HevHglVV9emwh3kFx3tc8
 2D8arMGFI40jVNotI8WSrBM43uKySkofXe2bk2RFuZ8mq+NxwQ8oASQ0e
 zRxqLREtVBSlvUNA1ZhzEv95eTrQvvr2pvk1fQkwaUW6aIPz5o8iw3v4y
 c1u9gDY3Z1x2wmBxhIhnPUiIK4nW9UX9l8oAYXBqPkn1h0L9nHlci0NnK w==;
X-CSE-ConnectionGUID: 1fj4NLhfQNS/BZcJCgCcaw==
X-CSE-MsgGUID: S0hqDd04Q76CznNNX2ojqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85601978"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="85601978"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 09:16:58 -0700
X-CSE-ConnectionGUID: 8CymANDuQlKHvAaX0N5kIw==
X-CSE-MsgGUID: TkIHW5qCSMid3/aG/KVYhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="282960401"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 09:16:58 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 09:16:58 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 23 Jul 2026 09:16:58 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.56)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 09:16:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v/RSIFUYIjiyfL1UMEa9kMh4NKo+wZxPQNu8ZCztSXEUWYuYAuULa1Mdn1fvZEF6RcDIVicdOBLeQ6v1b0Z5OOtPrCFQZvUEjmOurMPgDf5hhroVA3+kiiWji2nKAc3fsMhksCg4D4p+XDKwlOHHjkqelbktVOAvud6fuUT6tCsaWg0C16iNZXP1Ybq+vi8DAs7g+t3z9BpVa9ypbQ+qc2eaHwTYGBJXqGgyb0TmI0FsBLX18o/uUz04qQTXsZB0A9HzZaRAWu3Oa+zvldoBHyYXvcg8y7xnMZmoOYp4+tlLfz6cDSNVTkXqoNym2etiAGHy8tKU/IFsa+XjCEeT/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KuVYXo0N/FCIhZu9My4+JBry6E28FB9HWaB9oWh8Tgk=;
 b=QGya5GP7hCQoSdnB27iA4mlz7eJWRi4Tchcwz8EZQfzvyB3YK44gYY/TQatL2S2vXY/B9sB1KJ6kR9sIhQ1GE4Dto7cO0OcUwdtd02qiQOP34cew9rfzRtjwgHMDvfzN3ZsaUo/s+12P/GqDUGah/3GaWLKJQjBAV3od1YnXtc3yzgJ9jJS/EbjLTx/5q0yGeIuDyJlaMOhJEK72rO1hfrS94GKyHj2+uVaod8P9UGVTr7QeGCoqS64ghr6dW2QhQZuUd4XIwU8sEb7abln3Rn6z4dmFlQJxobP7+RPxOIj5y7yZQVDs4qWkqtxb96d0A6pqH7yfoL/vMQYG3N8Slw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by PH7PR11MB7642.namprd11.prod.outlook.com (2603:10b6:510:27d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 16:16:55 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 16:16:55 +0000
Message-ID: <25b42b46-b9b4-4fe3-a00b-b6b6e9078ea0@intel.com>
Date: Thu, 23 Jul 2026 21:46:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/9] drm/i915/vrr: Add per-CRTC vrr/cmrr debugfs control
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, <uma.shankar@intel.com>,
 <ankit.k.nautiyal@intel.com>
References: <20260722043923.3241977-1-mitulkumar.ajitkumar.golani@intel.com>
 <20260722043923.3241977-4-mitulkumar.ajitkumar.golani@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260722043923.3241977-4-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0293.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:221::7) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|PH7PR11MB7642:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b381366-334b-4ddb-4c61-08dee8d5d006
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|10067099003|4143699003|3023799007|11063799006|6133799003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: SNGrx/4KytV5sokY+oM2QCNfd/oXHKsCcmpm6dCTedVeSEEYxcvhhGlDGC7D7fIv2HDsZDMvgXvd1ETWU4uNs0U03RuWAUJrx9fTmD//w2AYLu8IbMlVk2uxxRLp6CnPplcgoQuz3dXYKYjSvSossSOnuRBY9OsRKe5CDPLwu1xScm1dUjmmak4vZYzri/eajGGJmihHUCmNYPdXtGe86izcxgdX8p/w1cltNkPv/Vq87lhrPDGCuBFSpIkIyRjjUd31CDRNh5PMzZXrBmpW/VYSKaynlJ9TxTdCsaIuQbRMtor+JYABK47USqM31DsHLDdZzUGJuy8cYfPcUSeCApGSF8pHZJgM0905ZldGXDpygzul0X78mQ33oOzIfy6hEGp5+GJjVrbifE+FKBSM6MOWBWhgTol1iqzoM6cvncDXTAntiMO090Mgi0YoK4Y9wl+B0vE8qXkvBkDr5j5DuQ9wlsv5qym9y9CivA6193qXd0w9YvyOuZzgQh2Pa5PFKpuPfIWoL2M0H9SPgUhPnYgE0QLHMIOvJL9clTNTrC9OYgPfT9CpR/jY6b34HxuF5lO9kfrZMmO3H+r3MPOifBOeAgKH9hDUXhyirW62jdjTVn7qgcoTjWldA7y5u3VgZC9N3376DKyg7qY+vFro5RkIUIEZhC3rSvq9II8fsXU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(4143699003)(3023799007)(11063799006)(6133799003)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0xob1ZHU1RQb0NVTUQ5T3hUakpaR3ZId3AySnJOS0hsVGUxZmFhVllERlBi?=
 =?utf-8?B?dStYUjNuM0N1c0VuRk5XVzVoMTFtTnpQTklHUGlXeDg4T0FFeDRERGV4MVZJ?=
 =?utf-8?B?VlliVS8xRitRWnBPekIwQVJ4R3diOXZ3NDBEVzcxcHdrV1FDam5uTS9WNEFq?=
 =?utf-8?B?YmZFcUhtbkRHK1V4WkpCSDZZTlgzMHAzTmFkd3ZqQ3JlYWh4L2FNUGpIeE1i?=
 =?utf-8?B?SW85Q2ZTK3NzNzF5UXQzb1Q4RjhWRlZmY3B4Q3ZIeEI5R3hqUVhvV0JBNnhB?=
 =?utf-8?B?MSs5OTdQdnFwQTZNRCtrUDl6ME82YVo1RGx1Y29KK1VsZ3JLall6cXJucEtz?=
 =?utf-8?B?akkzSzlFMzNQaEJ3aCtDRFdGQUVtNHNwQW10bGp4MnVPK1BhL2JBMDZyNzVM?=
 =?utf-8?B?RkZlaWNqZEM0RUtZcWt3cHpERm1ETmJ3Q3NRYXBkaW5OTE00TWxOeXErTGJP?=
 =?utf-8?B?cFpSMWZyeERwNHNDaFFNRzlwaWd0Z0dsV3BXZElGdUVNNUQrMWtNdEtUNkVo?=
 =?utf-8?B?MHRIa3FOZHhZY3JnQXFxeWdsVHEzT1dWMGkxejhlSGI4cE9iYk1Nb1AyeDF5?=
 =?utf-8?B?eW85OC9IdndCdFhRM0dyVFp5Y1dVL1loa3doNVlKN0R2eko0bnZWbTJ0QTMx?=
 =?utf-8?B?alZNN3FERDR4MjVpN2hkSW9FSHZlRXRJS21iUGpuaWZ0QXU1SnIxY3RuV2hz?=
 =?utf-8?B?ZGtLdFQrWkQyZFdHejY2VVZDSTQ0L0hYOXJlOHYrSHljMTAzcGNUcVRNdW9J?=
 =?utf-8?B?OFRrbjNiTWR1QjdGRHZHNGZ1NkV1bWhiSmVrRk1aUVNLWmJTRU10dk5vNTRL?=
 =?utf-8?B?d0E2UDZtYVpBV1NhM2xKZlJaYXBrbFpBaTl0TWxZSzgyUjJtNE80cXVyVFpr?=
 =?utf-8?B?d0lPYVNCaDduOXZqd0pCOEdrRVphVk15WUV2T1JmNXBlNEo1ZGIyYVpESWdw?=
 =?utf-8?B?ZHROVlFiQ3dnU2hIMWQzdWZEazdzU2R4K0pqaU5zV0FDYVVwMjdzTlU0c3dY?=
 =?utf-8?B?eGZpM3BBUjlIaXIwNVlJL292Ylp2TjNPK2VTd0NkSXhkWlZvVXhhL0J1MVZq?=
 =?utf-8?B?SG50djhKOUpEaFRxV1hMQTk4QWNBOWQrWEh3MXp3cjRXUTd3UmVYYVpIdTcr?=
 =?utf-8?B?dEU0SDU5cExDLzkzUVVkTklWVDVsZTk4cDVDYWZDN1ZhdHFlY2Z4Yk41bWpP?=
 =?utf-8?B?dGNpZTNPRENjVE5nb3FTV2FwVmkrdEdvalZzWXlZbzdVL2hheE5oY0xBb21t?=
 =?utf-8?B?T0JKOXVzUy83d1ZpcUQrZEhmSjMyTnZvbXFBTWJLU3I0aGdvekMrSUhucFVY?=
 =?utf-8?B?UW1UMmE1WFVDOG8xazNlc2tzaC9oQjN0a1FmNEhESXBUZVI4Q0hQTmZvZko4?=
 =?utf-8?B?TVVjR0tJMzdiVjNGcFNlZHpyS0hGQUE1MW9mb1haRkt5RVdISWxGUFpwUnM5?=
 =?utf-8?B?bVp2SDlxa2dpNlY4dXcwT1RnQWFZbFpnZ3NuUFkyb0ZFQjE1ZGZVRDYvbTlS?=
 =?utf-8?B?eG81d1I2VFIzMUIxWXk0NTFDcFM0MWZ5SHZhV09ZcWtJdytiOU1NSDBKSTVt?=
 =?utf-8?B?NXhzVDBzT0U2YUppSE1iWGZQdFFUVTJBMmtwZURKaHdTWlgrRGNETjFsS3Vs?=
 =?utf-8?B?VVZsVXl2YW1ZOGIySzFxY0xnWWdSamNBODNJRWpFNllMU1JrSTVob21EYjVn?=
 =?utf-8?B?Tk9lcmhPenJQb3djNzl0U0tPRFdHY1ZJRHRYYWNIdlJBdW5zazFDNlVpSU12?=
 =?utf-8?B?U05ORXV2bm02TTJ3Q1EyMzNVOVFlRVZqWThvRXg2UnNjcVhGLzZHSVR1Ujda?=
 =?utf-8?B?dC9FZjNQdCt1ays2QjhzbWRCZFJBYUc4dEpGdDVVTnI5V2VuN2hoY2JyRjB2?=
 =?utf-8?B?b1hscnpuQ0tidVRheGdPV3A1WFp5M1hGVE4veExnc1ZuOE8ydC8xaW5kOFhV?=
 =?utf-8?B?T3ZHZkJEMzVON0wvaWdmSDZxYUJTMnBrNGYwdmhFM3VlS1RTRGdCODVSU3gw?=
 =?utf-8?B?dGNUR1VDenM2R3RUYnZKSnREdGUwTE5uMWdiN2N6VFNoWVloNmNEemptVjVl?=
 =?utf-8?B?VUc4dmF0TVYzSjB2U2pOUVdWOUkrRUtOU1k1Q0N2c2lES0Y1MSs2aFJHQmho?=
 =?utf-8?B?UEU4YWc1V3NQcEEyeVNYTGFzZGJ0a2NLUHZ4VDNhOGJsWjBYRTFZSjFYbThH?=
 =?utf-8?B?SERYV0NpSTFCczhMSWJtTytDMzdNUTgxZFBmVTFNWnA2bFBlS25CTTB0akZh?=
 =?utf-8?B?MTN6K3d5UStUWUsrWUlabCtuYkNXOXFISjJjNzNwQTBSSkRqQjg5cGUrZUM5?=
 =?utf-8?B?Y2x3ZW1tdTR4bE5sMjFQRVBXZUlOa1VGWk1xdER5VlRzb2JpVkNRVVZyeTls?=
 =?utf-8?Q?m0apyvOdh3sjUO/s=3D?=
X-Exchange-RoutingPolicyChecked: eNvW9TsWc5sJDrrJnPfmBNyoVbfJYSTF8MKZumTLKcL7kIgtUgtz22pMXjvkiyisicUlYdwpdkIxOIcQVZZUyLNnN+qmtlQXsyAZ0RE99QWuoT+4M+EVNXl4wV+/0QPqlABkCRY8/XEPSbqqepxk1/O2NpMoPukK+TUgzgQAQUJecrGfK45FeOEfG1Bhw57hDyIpusAVwuZj4sTS0AiooTveOXs2uNTH3a05RfX0MPjcYHYp2wdsNVSpqCQ9E5TFcKnq5VwxuQmQidCXVepKEu6ONPJ4NY05vBc7YqP+P4gw5xtdcjhG22LDisoo7JXWnReQyTA97NMyrNmuyg79Kw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b381366-334b-4ddb-4c61-08dee8d5d006
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 16:16:55.0550 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OI+/ony5kweThlptPGGe/Zu9joEbj7HWEtmudfGxb8WCOfapij/ibwl3EPlWRDDJPEm49sieWkg1zigZeX1CfmNV+ogvjh8oHMROCrIclw0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7642
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



On 7/22/2026 10:09 AM, Mitul Golani wrote:
> Add a per-CRTC debugfs file 'intel_vrr_cmrr' that lets the user force a
> CMRR target refresh rate and video-mode requirement.
> 
> The file uses a "numerator/denominator" format:
>    - numerator:   requested refresh rate in milli-Hz
>                   (refresh rate in Hz * 1000, e.g. 60000 for 60 Hz)
>    - denominator: 1000 for a 1:1 ratio (no video timing) or
>                   1001 for the 1000/1001 video timing
> 
> Reading the file reports the currently stored values; writing updates
> them. The file is created only on platforms with VRR and CMRR support.
> 

The commit message is not updated with the new debugfs name.


> --v2:
> - Drop the "vrr" debugfs subdirectory and expose a single flat,
>    intel_-prefixed "intel_vrr_cmrr" file (Jani, Nikula)
> - Rename struct intel_crtc.cmrr to force_cmrr to make its purpose
>    explicit (Chaitanya)
> - Fix parse comment: numerator unit is milli-Hz, not KHz (Chaitanya)
> - Add debugfs/intel_ prefixes to the debugfs handler functions (Chaitanya)
> - Expand commit message with debugfs entry semantics (Chaitanya)
> 
> --v3:
> - Rename debugfs function and file name (Chaitanya)
> - Remove railing new line at EOF (Chaitanya)
> - Update CMRR guard conditions (Chaitanya)
> - Add 0/0 default case. (Ramanaidu)
> 
> --v4:
> - Correct CMRR guard check while creating debugfs
> 
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>   .../drm/i915/display/intel_display_debugfs.c  |   2 +
>   .../drm/i915/display/intel_display_types.h    |   5 +
>   drivers/gpu/drm/i915/display/intel_vrr.c      | 108 ++++++++++++++++++
>   drivers/gpu/drm/i915/display/intel_vrr.h      |   2 +
>   4 files changed, 117 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> index 3f02868ef105..2bbf4760dc30 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> @@ -49,6 +49,7 @@
>   #include "intel_psr.h"
>   #include "intel_psr_regs.h"
>   #include "intel_vdsc.h"
> +#include "intel_vrr.h"
>   #include "intel_wm.h"
>   #include "intel_tc.h"
>   
> @@ -1395,6 +1396,7 @@ void intel_crtc_debugfs_add(struct intel_crtc *crtc)
>   	intel_drrs_crtc_debugfs_add(crtc);
>   	intel_fbc_crtc_debugfs_add(crtc);
>   	hsw_ips_crtc_debugfs_add(crtc);
> +	intel_vrr_crtc_debugfs_add(crtc);
>   
>   	debugfs_create_file("i915_current_bpc", 0444, root, crtc,
>   			    &i915_current_bpc_fops);
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index b7cc361fd955..46dd980b315a 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1553,6 +1553,11 @@ struct intel_crtc {
>   		u64 flip_count;
>   	} dc_balance;
>   
> +	struct {
> +		u32 numerator;
> +		u32 denominator;
> +	} force_cmrr;
> +
>   	int scanline_offset;
>   
>   	struct {
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
> index 14f8ac07c911..267c65d9245f 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -4,6 +4,10 @@
>    *
>    */
>   
> +#include <linux/debugfs.h>
> +#include <linux/seq_file.h>
> +#include <linux/string.h>
> +
>   #include <drm/drm_print.h>
>   #include <drm/intel/step.h>
>   
> @@ -1237,3 +1241,107 @@ int intel_vrr_dcb_vmax_vblank_start_final(const struct intel_crtc_state *crtc_st
>   
>   	return intel_vrr_vblank_start(crtc_state, VRR_DCB_VMAX(tmp) + 1);
>   }
> +
> +static
> +int intel_vrr_cmrr_parse_ratio(char *str, u32 *numerator, u32 *denominator)
> +{
> +	char *sep;
> +	int ret;
> +
> +	/*
> +	 * Parse a "numerator/denominator" CMRR ratio string. The numerator
> +	 * is the requested refresh rate in milli-Hz (refresh rate in Hz * 1000)
> +	 * and the denominator selects the timing: 1000 for a 1:1 ratio
> +	 * (no video timing) or 1001 for the 1000/1001 video timing.
> +	 */
> +
> +	sep = strchr(str, '/');
> +	if (!sep)
> +		return -EINVAL;
> +
> +	*sep = '\0';
> +
> +	ret = kstrtou32(strim(str), 10, numerator);
> +	if (ret)
> +		return ret;
> +
> +	ret = kstrtou32(strim(sep + 1), 10, denominator);
> +	if (ret)
> +		return ret;
> +	/*
> +	 * "0/0" clears any previously configured CMRR override.
> +	 * A zero numerator already means "CMRR not requested" in
> +	 * intel_vrr_cmrr_compute_config(), so just let it through.
> +	 */
> +	if (*numerator == 0 && *denominator == 0)
> +		return 0;
> +
> +	if (*numerator == 0)
> +		return -EINVAL;
> +
> +	if (*denominator != 1000 && *denominator != 1001)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int intel_vrr_debugfs_target_rr_show(struct seq_file *m, void *data)
> +{
> +	struct intel_crtc *crtc = m->private;
> +
> +	seq_printf(m, "%u/%u\n", crtc->force_cmrr.numerator, crtc->force_cmrr.denominator);
> +
> +	return 0;
> +}
> +
> +static int intel_vrr_debugfs_target_rr_open(struct inode *inode, struct file *file)
> +{
> +	return single_open(file, intel_vrr_debugfs_target_rr_show, inode->i_private);
> +}
> +
> +static ssize_t intel_vrr_debugfs_target_rr_write(struct file *file, const char __user *ubuf,
> +						 size_t len, loff_t *offp)
> +{
> +	struct seq_file *m = file->private_data;
> +	struct intel_crtc *crtc = m->private;
> +	u32 numerator, denominator;
> +	char kbuf[32];
> +	int ret;
> +
> +	if (len >= sizeof(kbuf))
> +		return -EINVAL;
> +
> +	if (copy_from_user(kbuf, ubuf, len))
> +		return -EFAULT;
> +
> +	kbuf[len] = '\0';
> +
> +	ret = intel_vrr_cmrr_parse_ratio(kbuf, &numerator, &denominator);
> +	if (ret)
> +		return ret;
> +
> +	crtc->force_cmrr.numerator = numerator;
> +	crtc->force_cmrr.denominator = denominator;
> +
> +	return len;
> +}
> +
> +static const struct file_operations intel_vrr_debugfs_target_rr_fops = {
> +	.owner = THIS_MODULE,
> +	.open = intel_vrr_debugfs_target_rr_open,
> +	.read = seq_read,
> +	.llseek = seq_lseek,
> +	.release = single_release,
> +	.write = intel_vrr_debugfs_target_rr_write,
> +};
> +
> +void intel_vrr_crtc_debugfs_add(struct intel_crtc *crtc)
> +{
> +	struct intel_crtc_state *crtc_state = to_intel_crtc_state(crtc->base.state);
> +
> +	if (!intel_vrr_cmrr_possible(crtc_state))
> +		return;
> +
> +	debugfs_create_file("intel_vrr_target_refresh_rate", 0600, crtc->base.debugfs_entry,
> +			    crtc, &intel_vrr_debugfs_target_rr_fops);
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.h b/drivers/gpu/drm/i915/display/intel_vrr.h
> index 55e9c429f579..19c7990be1b2 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.h
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.h
> @@ -56,4 +56,6 @@ int intel_vrr_dcb_vmax_vblank_start_next(const struct intel_crtc_state *crtc_sta
>   int intel_vrr_dcb_vmin_vblank_start_final(const struct intel_crtc_state *crtc_state);
>   int intel_vrr_dcb_vmax_vblank_start_final(const struct intel_crtc_state *crtc_state);
>   
> +void intel_vrr_crtc_debugfs_add(struct intel_crtc *crtc);
> +
>   #endif /* __INTEL_VRR_H__ */

