Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54941CD4855
	for <intel-xe@archiver.kernel.org>; Tue, 12 May 2026 08:57:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FC5810E41A;
	Tue, 12 May 2026 08:57:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mzXvVaDx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB2FB10E41A
 for <intel-xe@lists.freedesktop.org>; Tue, 12 May 2026 08:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778576247; x=1810112247;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=QzF7YplHHppmZ2ZIwVWZSn5xna9/CpQnpeerYooS8R0=;
 b=mzXvVaDxtHxVzg6oHjKNxLB8QB3r+x2IiJqoDC7dZE+waaiSZk73MkyL
 R78s7ERxSIGSwl3TPHBVhTnfkw0yC+jIa6HLek1QAA3aVdw+gdlcpXRo8
 6PU+yq1E5N+FgZFmAzDLStJ85F3uG2GICJSz1iqvFK0ovyWWcLwJ++2X9
 I5eS76BcrjDuaDwC1QPQ/fUNmv/qANjPPzYLjLOveFH3/DwMT4GXkjaRR
 kcDvjJgA35VhdX3BzmzhfZUZDOrY4jC5syUQG4yAYwsnh9EzdV8fY1uNx
 FkwTkHzwpP66et/STZAwI87t0EnNoZ+G5l0bVcw7SthclsOFdKj9akxxQ Q==;
X-CSE-ConnectionGUID: DSD2a87JRwG6KNj8LUWxAA==
X-CSE-MsgGUID: fYTbKT+QR0+oB/crnSx7iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="90580088"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="90580088"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 01:57:27 -0700
X-CSE-ConnectionGUID: M+0Qh2VXQgKJZ1qU7hztvA==
X-CSE-MsgGUID: e31osUNIShy00wo5U0MAiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="239541947"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 01:57:26 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 12 May 2026 01:57:25 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 12 May 2026 01:57:25 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.60) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 12 May 2026 01:57:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=az2IUz3I0bkoDv3h23iozS2nQWNL7/dKla1mQ8bITBhGw5gJeqTMAaiN5vXej5A/rTH1SnafgzcoxPJBXIHukWtBvqbT+bFxXTFa469pewAgZLGIzyY2BoE6GFvXWcRO45FTRdkf4SOx9JSkRaTJkZQsQVWQq5lWJXOK34sSSlT8oWtZvSRNu/hEQX7+3o9u6fgSjncm3SURGgLb/fPAdyTVSyJ84PyL+Zqy/BzEMGFwWE2fSTfYly3IagF3hNGo2HJxmjv8hXq612MLRIiV43RvkTp0XcdqXxTc4iSCtDWiPbmK/xC0DfBB2Rn4AhbpeLRcUCmlaCebdkfUTlaufg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M3QCCP8NX97w1NkzKuzV0gZDsTkhOVja6VZEW5Tr7UM=;
 b=cXJLoBFiA69LUaI7mev41uD2ARWcLvAiHPMvOj0JNJa4u7AIYI9JlVZHCAvosBOZfSHze/7BTiwKUm+ZE7foRik2RpfsGNkqsw2Gxkv70gxlsYY7/nXJgVrbq9Bfe2C+FL9Wyji3stQVm8HuOTN7W5Uv7ggDryqhomBKYnzSIl/X9QASHAjK7ng03lctoPBmrHHLWvK1MGThFIUGeOR9Ix/8O+iKGeFpvcunTaZWpLWXxPdv+vxt7cUPRLdCAUSI3p9n08cvk2x5qfAfx5dkQFvEznyG+HCXkr7zTFeqD7M9F9BbwEt+bJn0si4y4r1RIO/FuC9HXsY84OMxHYWFyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by PH3PPF67C992ECC.namprd11.prod.outlook.com (2603:10b6:518:1::d28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 08:57:22 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::70de:934:a004:9c56]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::70de:934:a004:9c56%5]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 08:57:22 +0000
Message-ID: <0a9d21ce-4af3-44a4-81be-dcf39d9f9cc5@intel.com>
Date: Tue, 12 May 2026 14:27:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: drm/xe/devcoredump: Drop a FIXME in devcoredump
To: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260512055508.1380191-1-shekhar.chauhan@intel.com>
 <agLUJsi3ZoPFyc0j@bvivekan-mob1>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <agLUJsi3ZoPFyc0j@bvivekan-mob1>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0098.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::10) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|PH3PPF67C992ECC:EE_
X-MS-Office365-Filtering-Correlation-Id: 323b305f-2dbf-4d0b-905c-08deb0047ad8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|11063799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: HIy8K9jziETVOjI+Pc/qnXxKFk5ezzBwOEEGWxuenoe85MZ1hMWsPd2p+xK636JgcNguVh+bfvwuKLh0zmpyghGUWSMuzHlkaQoOqDjTr+9SMl6yuKnKnbuuIpfLIi2WzlFW/s3w6nYyvLaV65df+Zd0GxFwQS1WtXmU5w2pxlPQguATXUbeGqOC9NFw0BIJ9syUD9UgmlipOGM4PAdhszVEZSn5ie0qycnanOF+/waorT0hlbRGVqgpWlfmUEYB2BW9Pm3wcrGzJ8s3rQ0em2v3t6Yh12flrv4HFVvXPDCULjRhIsJk3uLqT4p4bi7+eYwCiwlJ/YfHoE669+Yo4Rvy2AF9cFv/0XtDgCqmkwn8aaUQhGlThUIIE7UAW2QPsar+G/jgPeU21tu6hX7OS9GxMZLFCp5NdM0Ek12w5yvWn7mFYxf0mgj6j6/eemmsZr3LRIBahvZmgkM/U7jooVngSYPvgOTisYObK7ILAxOKDseCd3F9d+OApLu7ELtivQqEHUhnOpOkt3H9bykHst21sj8lJqS4dNElobf8sjHsFcrx0DTYdmvJb+CcNbjRy6cRgKxnnoU/kLER/dovHwuRwGNRhMFSru2GcpHljD/t09lYZ26mt2bzr/SXIrc+g9erzu1l3ogEo9hA42PwtQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(11063799003)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0FobStYU2V0MURxZnJteVZvdlRyU2tiSFc1U0IwWmxWdDlkQVhSRFp0QW01?=
 =?utf-8?B?azRRNVZCZmdZOTNxSlAyK1pXVlhCVmQ1RWhRTmc3cVpIZlJmcmFramhnNVRK?=
 =?utf-8?B?dXpVQ2ZGRWNEcGNncXVMNkdURHR4RzVzekxEa0pHUDl1dzlIeStCR053Rzg1?=
 =?utf-8?B?aHJrY3pJUzVFdmh5dklBNzVncnZ1OFpUZHdlWmg3czhXZmpxMFlpMnc5WC8y?=
 =?utf-8?B?eHdFUG01RGxJVFE0RWRuUk5jTnlSbFRCcFU5dWRxV2cwWlpXUjErYjRJUk41?=
 =?utf-8?B?TUVYZ0NSRUlrZHpTa0xhS3QzelpzVEhSRXpEdEN1OFpzTmhvdHZ1d3MwR2cx?=
 =?utf-8?B?Ums0QUhrcUxDWkdFajZZdkVyK09HZjZtcXZqSHVpVU9wQ1dDZGd3KzhBbmg1?=
 =?utf-8?B?RGhJN2ozWnlQblhhL3BMY0U5cWtGK3g4OElnekhiY0JPZGd1T3dURkRxT0FO?=
 =?utf-8?B?QnJ0L2MvZUx2Vm8zdDZvS1g1TmxaNUV4U2tHU3liU2RiUXVwc0o3ZFVZWVk0?=
 =?utf-8?B?TVpLSUVqUGxUQWs4cVZ5b01La0xmOElZWVpGVmc2TU94TDZ3Y3AzOUVhVHNw?=
 =?utf-8?B?OTNTQytzMEFQRHRzU2p5SHBwRUd5S1k5L0VOYTJlcVdnK01ycnc0N3dGYk5C?=
 =?utf-8?B?M1JuZEtUakJBVTh1cE1oUlhKM2EvTEZZY0p5TkVtNm4zcDR3eGtnd0FzNHFN?=
 =?utf-8?B?dHE3Ny95bG9kTVJERGgxcU9nMjd2bXBoV0dKdUkrcG9PazdTZk9KV0ozZ2pV?=
 =?utf-8?B?VTYvdmJMUURyRWpMTHo3ZlZQQ1dDaERRTzdMMFRJVUExMGtMamRwS2t0QTFN?=
 =?utf-8?B?cEJ5RVRid1I0b01QdXo4NWhpeSt6aWd0YlR4L2hLbmJ1TmhMYitpbmp3bEJ5?=
 =?utf-8?B?WmpFZGZtZWtQRW81amhKZ3NyNTV4ZFZJRXhXdXlScEo5MjF6a214QmNqMkRV?=
 =?utf-8?B?TXlnZG8vMitGU0k3UWcrTTIwdnc4c1VKcUpkYzJnOWpwWDBHK01VdnlOU1dQ?=
 =?utf-8?B?QTh5bm1JMFMvU0UzMDRtMUpxZ0I4c3lHVHVYYmxQVDZnVmtJYURNblZ2dU4x?=
 =?utf-8?B?RWI5UnV0OUN5UGROL3ZPZURtZXFleFZaMnV1TTF4SjhaNHhna01OR3czak5O?=
 =?utf-8?B?YWs3OUJBdUxETytvNGJmL0RMNjRJR245bE5MTzhtMExJbG5COFdwS3NCa0U0?=
 =?utf-8?B?c2VDY0Z0Q3BqRkxQOWI5cFBoRnA2QTdwb1RmT1BpK1lWMjVxSXo3NU1iZWwz?=
 =?utf-8?B?QmJMT3ZaRUpwMmNvTnhlYWEyQWp1UzVOSWc0R280ZkdaYWNvVVYvS1cySGxv?=
 =?utf-8?B?NzVCaEdjZlkyYlJRTVpPdis1YjVOZngzQm8rZFQwMXhUTGQrWVgxWkpBOHFC?=
 =?utf-8?B?RE5LdEVQSUwydDkrSXhIQytRTmR6dlBQNlVJcjFxK2F0ajJTNzNBSVI0Zzll?=
 =?utf-8?B?U2QxeDNudTNnankvdlV6aHFUNURPa3crNUdkVGhmMHpmYWkvajZHT3dyNm5h?=
 =?utf-8?B?REdxdnZZY0s5RndwVUpzUzFpeEMzTzMvN3NPOWFJbG4rWUIzenIwYTRyS3NB?=
 =?utf-8?B?WGZWZWgyRWxsdmdLMWF4Y1ZaaXZqV0syaGN4WU9JSkdIeEQ2Vzh0czAzTkkv?=
 =?utf-8?B?bXEyTUxBYUN5ekJRcmM1bHpXU3RncHhJTVhnU0xDNHpZQ284ZHk0Z1NMalVK?=
 =?utf-8?B?T0RDT1ZmL3MvT2tUTkpNWUllV2xCTVJOTEJTMnJ2b1NPNVJaaW1kU3NscXVh?=
 =?utf-8?B?QWE4S3pLdmdFQ0cyYlI5QTkwbmFxbHhtZ09rOUIwYU9BZXNrY0VISnppc0ZG?=
 =?utf-8?B?eUJYSmEvU2tKcnZSZWFqcWhlZnZhZDNpVWRPMzdMb3pWd2JsRU9hUkcvR25v?=
 =?utf-8?B?SEVDMWh6aUF6MWJabkFaODRVUnUrTjAxUUdWRXZUSmhiY1I5MzY0WlhXUzha?=
 =?utf-8?B?cU1QMS9SOXdBV1FER0htUnJqblJxcTJLMVhkbnduaWthcUNsRWFBUlA0Nk5h?=
 =?utf-8?B?R0RDQVFHUUFkQ3kvNXZkZXNpcWpEZEkrZ2tyaWRxekNiU0NRTituVy96YktQ?=
 =?utf-8?B?YU8xbDd1bXRXOGE5c2lkcDZQU003MHYvTWdLUmRnNi90TEU3T2dLRDRmbHAr?=
 =?utf-8?B?dW8vVTg1YUVwUXJUMjFDdnNLSWMzVi9ZNFhwbUkrRTZrWjlDTmhCRXNmeVRH?=
 =?utf-8?B?MlRBSHRadEVSWWpEaDJmU1hjQ2dOa04xVThTTVNMckhpYXdhME14NWpUQ1gv?=
 =?utf-8?B?aWx5bm4zZlBDNXNlSHdvY3Uwb2d3M0VPQWRkZHFTeDJycldpS1U2Qkx0STJH?=
 =?utf-8?B?VWJUS21ZWnZlRDFxNzc4MWNGbmFEYTlIVlp2TG1HS0RWOTBPVTVQSTF5dTd1?=
 =?utf-8?Q?jG5zpx8Z000K0rEo=3D?=
X-Exchange-RoutingPolicyChecked: wJHMXGJJEyI4fmYhuoGzW4y/dMJQDOi+qnlclzNN855FQ21kO8rI+54/6BbxNLqwZa0ygaPEM6jB5PZgphOP0nQtHz/qLZahmwdYi/g7kv6BShmx06QzAuQwg3ArjQzzOoFcXq8y2KOC1KK8CJMex3pmCvoZP813mJXMeQbvCAWG39K/xa5RGIascbHsarWxvkaT2DBBgA4LhbWhNlfpSMROSzrvOZNkjAb7k18EhIWPvbGMI/d7INxnulnwvd0boYNDoiiQu4pI8mE2ndDtrXQZ0c0RUS21WZLC9u3DZrtKstnTaD/WbXcEWSSZOJTatBo4fq70981bjOdkuMQMiw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 323b305f-2dbf-4d0b-905c-08deb0047ad8
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 08:57:22.4967 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hpcx/besm8EXeEcayBj3Mtg71/BFNCbnEFK2cgd8lzf1NfJRJJJgPiUf59eF0NSzXOgI/U1HnAo4nPRqBzelLn+naD3whEh46eRZOm5QF5s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF67C992ECC
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


On 5/12/2026 12:47, Vivekanandan, Balasubramani wrote:
> On 12.05.2026 11:25, Shekhar Chauhan wrote:
>> The FIXME says that xe_engine_snapshot_print.. is accessing persistent
>> driver data, unlike what the FIXME says that it does. Drop the FIXME
>> since the current code is not going to access the hardware while
>> dumping.
> Is there any typo in the above commit message? Did you intent to say
>
> The xe_engine_snapshot_print.. is accessing persistent
> driver data, unlike what the FIXME says that it does.
>
> After making that correction,
>
> Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Okay, that can be done (although my initial intent was to keep it as 
"that" to signify what the FIXME said). But, making it as "the" instead 
of "that" also makes sense.

Since it is a minor change, do you think I should send a new revision 
for it or is this something the maintainer(s) can just take care of 
while merging?

-shekhar

>
> Regards,
> Bala
>
>
>> More details about this patch:
>> https://patchwork.freedesktop.org/patch/703884/?series=161407&rev=1
>> The starting two feedbacks make sense and the original patch is wrong
>> in adding those changes, but the last feedback is the one which
>> highlights the point.
>>
>> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_capture.c | 6 ------
>>   1 file changed, 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
>> index bc49e40165a3..21f7caf9ea08 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
>> @@ -1841,12 +1841,6 @@ void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm
>>   		   str_yes_no(snapshot->kernel_reserved));
>>   
>>   	for (type = GUC_STATE_CAPTURE_TYPE_GLOBAL; type < GUC_STATE_CAPTURE_TYPE_MAX; type++) {
>> -		/*
>> -		 * FIXME: During devcoredump print we should avoid accessing the
>> -		 * driver pointers for gt or engine. Printing should be done only
>> -		 * using the snapshot captured. Here we are accessing the gt
>> -		 * pointer. It should be fixed.
>> -		 */
>>   		list = xe_guc_capture_get_reg_desc_list(gt, GUC_CAPTURE_LIST_INDEX_PF, type,
>>   							capture_class, false);
>>   		snapshot_print_by_list_order(snapshot, p, type, list);

-- 
Shekhar Chauhan
Linux Graphics Software Engineer
Intel Corporation

