Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C57CA0FED
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 13:57:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA78D10E0EF;
	Wed, 27 Aug 2025 13:57:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U66OLig0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B32910E0EF
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 13:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756303027; x=1787839027;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=wJ/xXMszd/sucDN/soII4SuxVY9klcucMsZ4ctTJjt0=;
 b=U66OLig0rgTwTX2+BP3PaUozawApiOpXANgXmD1Vp3adgkyJH9aZSRPI
 j8Zpzr3Cm7Rfcj0sMb/o2lOHPUYTX28Hyf/Px8VHsyy6wwMo05F8gbAX5
 z0hoa4lsb7eEyvaPPstKWnFhoe31wTyk69uJHKryY6iosC79AfV9ahf/r
 dpdyvMAF19mRO6KwHMYgTguYxylwlcYZZr39Gd5HuImCJZXzLarhC4TPl
 2NJXPMNHq1+lteEcDXGRt5n3OzQxLTWdZwAL9dFvckMlh+esPH8hxCQ6T
 WNl31hs0oO1uzIJJbw2XH7hMmou6M4s02dKVHvi7QqDIz/dp0+w5tkjeZ w==;
X-CSE-ConnectionGUID: jGgj5qklSzmv3X5+dV2Glw==
X-CSE-MsgGUID: DNLcvEKySN+swVmh/jOJ6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="83958876"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="83958876"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 06:57:06 -0700
X-CSE-ConnectionGUID: /GQNEkZRS22N1GExV0u4OA==
X-CSE-MsgGUID: P5QCgX2ARkK9OhAVk4HazA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="207013149"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 06:57:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 06:57:05 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 27 Aug 2025 06:57:05 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.72) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 06:57:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dn20iTj1o9kIGOaH8DmfEtjJMIOujcrHCYirZ3daX4sVSRfpX1z8hp2dTZPSt6WdKEdD6nqVoPke835bG6RJVsRSI0uyv1b+WIo+PC0nkh80gD2YV3sTtnfWEFnJT3Vi8gv3cYz/hKIWo2sUt11hiefGwZGsXFc6BTNsKmJbxLnWOd9R7XUMGsindbPpKNFDxXQkNnIupfmgaDytws3Kj/C5pEcZY6jqRNZbJqP1aIErAT8X9chA96NsBFh4ZQCL4+gMraPHl4ScnFv7gnGfVu2Hfofu4X+re6jeIY6z0O1lfPxO05jnco+VYmk6b8qL/EoRfmSJ7XsC12C7hPqr/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WLe+341NfaZoyhnubckoqDX3jpB2f2unqyW/xIbhzk4=;
 b=PGSmif+0TW1RQ8FWrgxOwue222BXzOpYy+ZX2hHo5/94lrqnAMVBSHGkdUwGCFsjGUgdDVH0s+W7jp7ZzzHIobi6E/aI5J2aV//+9RiZAbrak+xDLc4+n9xDCWx3OEzvzjDXSl5owYhoMoqGcwe4JNztu2FnulZUDmYpJtF6Kp+5jfNBolSwIAcU0g7a9bg42dSzD1PnXBQouIxr38vLv9WdtZuLOGB8Q5T4G5efnUS3U9qs12lrLWB8o8Fov9DZ34gYDfQsinPaPct7jIw01m9/wRDlCJW29wJKzDH8zcf3bVRmU7gHC7vbuEJT7sSfANfBaFLcHIZvqQjQ1kGqhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by DM4PR11MB7328.namprd11.prod.outlook.com (2603:10b6:8:104::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Wed, 27 Aug
 2025 13:57:02 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 13:57:02 +0000
Message-ID: <8295cb2d-ded1-4a00-837a-e89d1c3bdf89@intel.com>
Date: Wed, 27 Aug 2025 15:56:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] drm/xe/guc: Track pending-enable source in
 submission state
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250818172243.2649863-1-matthew.brost@intel.com>
 <20250818172243.2649863-3-matthew.brost@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20250818172243.2649863-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0001.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::20) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|DM4PR11MB7328:EE_
X-MS-Office365-Filtering-Correlation-Id: ff55597e-9529-4e73-c1a4-08dde571996e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?czE1K2xwUjJDYlgya0pONmNUUUVQWFZxRlNRVkQ4U3dpb3Z3bDFpUlptcDRP?=
 =?utf-8?B?cGV2empxQS9RSERkOC9FeFYvR1lkQVZ0VmVoZ2xmTWV4bm5RK25sUFRBaG9n?=
 =?utf-8?B?OUFKZ1h5K2N3dG5BMTJhYnM0U2wwUHlDVktuMFVHbmZJUXFwdllMSnppZXlH?=
 =?utf-8?B?aDZBT092NVBuVzNTRUsxMkhZaytBTm9aVGRNQTZjVTBIK2xQK2R5YW9DRTNX?=
 =?utf-8?B?OXY5em1nYmhWL0N5N05KMGpBOWJ5Wkp4TktESkhBNHEybmFoSmFvSlo1L0Jp?=
 =?utf-8?B?Rk9zV21YRjl6Q0Y0TE1OOHQyMG4yY1RYUk4yUXFnTDNCaURoTi9abXdpTFkz?=
 =?utf-8?B?cmJrNVpybHZSN2JpRnFWTkI5djN6VGg4YkVEODE0Rmx5UFdBbVFBT1NuZkgz?=
 =?utf-8?B?aDZ4ZWk2MmprODgxNTdhajNZWlFuTDlmZnBMUGczZng0clNGZGZrUm1OL1Vq?=
 =?utf-8?B?cm50anlKUTZTWk9xQy9YTW1pL2I0SWt6TWUya0doVHJialJtTWlubkhmR1B3?=
 =?utf-8?B?dWRwR0tiZjh4UWdJR2gxTDRJYkdYanhBbFYvYitkaHczbUFkK0RsV3gxM05x?=
 =?utf-8?B?cmFzV3ptUTdOd2xRc0l0eUJDWHV2QzkvK1lPNWJ1QVgrZGpwQnlWRDhoVmlZ?=
 =?utf-8?B?U2drbGpHMDV4RzRUOFlBWEF6bU5MYnVhL2M5ZUw3d1V5V1dqYkZmajgwR25J?=
 =?utf-8?B?Kzc0QTEvUzJvaVJJc0laQ3JtUjhXRG85MXcwSTZPU2laYnRJNlRPL0dOQ1dn?=
 =?utf-8?B?ZktFc0VmOEp2NXJnQ0FvekhTWEdtUWZYMEYwaTB3QXZPU0FvcTAxZk5aUm1I?=
 =?utf-8?B?VW5zSzN4dDg3U3ppcUtwd21IbGkyY0lMVDM5Yi94d3hva2swM2RQc28yWnFR?=
 =?utf-8?B?QU1WMEtUN29TQUhMQlhUNk83YTZGeWNWRk13QzRDUzJObUdCK0tlSEYyckpu?=
 =?utf-8?B?YmJOZXpMSzJSSVJhTGpOeWUwRXpubjJtaExmOWljdjZXT1NNOFdJc0E2Smty?=
 =?utf-8?B?WWJua20yOVlrSTh3MWU5am5KaTVUNEJtQWtrYjczY1Rqd1RXTzk1YzFtY3J4?=
 =?utf-8?B?QUdUYmNUWksxV3JXcXNrKzJTUlhyZHF6bVZWR0w1MUViZVNDWEVSbGxJelNZ?=
 =?utf-8?B?VnVibm5ZRmw2Nll0ZDBkZlJqdEhkUnJpZ2dZb1dlbjBhMTI2SVFpTk8vQmFH?=
 =?utf-8?B?bXFmR0p2cG9vOHUwWkpGQXdyOVd0eVg0VjJ1alk5U3ZiWTBjdStMbFZucWpP?=
 =?utf-8?B?TU9NMHJGMDJrV1FGTmpNMUtud2lHSVVIN1R5emtvT3dScnFQL2NjZEJoYnJX?=
 =?utf-8?B?YnFPdjRtN0ZvdVBEd2tocnV3RkRSbmFJRGx0M3d1ZDRMNTlOSU9JQktSWWFt?=
 =?utf-8?B?ZEpwbUhNd2N6c2JqSjJEVmFTaVI5YmVJZmtBOEZrNnFCZkRkTy9wUUUvYmdh?=
 =?utf-8?B?MGIwbHZUTFFCOG5qdE1XeTFVbitNS3M5RjZoTEpaM1pSbis4MTk0UFBmQ29n?=
 =?utf-8?B?WWpiZlFCWkxjc0FDeTNwcDJ6eFNqZWRqR1poWFJnY0FnUFFxSDN2R2MzY0Np?=
 =?utf-8?B?Vzc3UFpzUW9PK01NQXp4a1dSVU5JR3BCbktUWHYzSm5jT0UzeVNWVnphbzRS?=
 =?utf-8?B?Q1czaUV1M1RlSTdwK1YzNHZqUnFlbnVBenVWN3hkdjM0Y3o0QmlRaG9TYXBN?=
 =?utf-8?B?YjJGWTRsclFpUkRHdkdodUdrZFRJL1ZuSndkdTBCWkI0VDBLcGR2aGEwcC9Z?=
 =?utf-8?B?ZUV3eWd2ZkRwa2VaeFRUQ2RQdDFtSHB6TS9mWkM0NEllQm5xNStYeDdZNVdk?=
 =?utf-8?B?NUNhemFkR1k1NlhBQXF2ZjBydGxCU2xRV1IxNHhGMG9GZkR3b1NVc0t6bWYv?=
 =?utf-8?B?bXJ0VTdQUFZhSG5Vbkh6czl0RHNVcTNFUmVScnE0bWtJbTRGTzdHbldic2JX?=
 =?utf-8?Q?nlGCEqziMUg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wm5VR3V0QXV5NmNWTEs2SVBjd2R6dGxIb2ZaK1ExWXFRZEw3by9teXRnKzBx?=
 =?utf-8?B?WkNqbnJqVlFzdXRRZ0JhUmpkRzErTkZkUE1GNkJzb0U1aWxZR1VBSDJ0U2FW?=
 =?utf-8?B?UGFJRkZKa1ovN0F0eWJwcnBMekZTY21QSUgxemhCRXpFa3R6MlNzdUV4YWxs?=
 =?utf-8?B?aVdheVI3d2dEaW1ZUFQzWjJDclJnckNZMUR3cFJJcjMyTTQzY2pOS2lKSXIz?=
 =?utf-8?B?UWsvZGlKV0dNZFkvaklLazlRcVA3NXNSWS9YaUpDSGZ3U0FFbU9hbmVpTWNU?=
 =?utf-8?B?clBhb1NMSDcycW9DRlYwZ0tlSDMrWlV6czJLaWxyQmliZ3RENnNDQWVSdXNl?=
 =?utf-8?B?WEk4bjlrMVlOdEd1WFFHSFR4TExqZGpVRk9ndWkxWkJtQWs0WVAwc1FxVXdP?=
 =?utf-8?B?TnV4SlVPTDVNMXMvNVNlN3c5ZWl3aTFTVVl3N2crTjkwVmdTK2VRd1JFQTYy?=
 =?utf-8?B?bzVrQ1NCRE5xeFFYUVQrbi9VNEljRU9EZkRzQjF0VEN6WUFWeEFLYXJnZ1lh?=
 =?utf-8?B?OFBONHlZU2p4U09rQ0FWTDZ4RzlJWkhHSjBrS1Mzc1pCNU5kQ1dOUTZ6bVky?=
 =?utf-8?B?dEZsK0xiUVNZaHpWb0p5RDNyY2k3U0ptVVArdmdKS1ZLNVc0TDdoYkZNWTVX?=
 =?utf-8?B?SjRCM3NyN2NiUlB5N1l1dDFZZWlCYzNlTXBCZ2txMEhyWVRhMll0NTFnanZP?=
 =?utf-8?B?WE1ZWFh4b2hYUjVPd2J6ZEc2YnVKV1diQkc0R3pJdW4xM0VGMk5XQ3YzMWdq?=
 =?utf-8?B?UTdHcHRLMU05dTdZcEgrakxJYWNCcFc5YVFBeUxQWitHZ1VCN1EwU0NsUUJ3?=
 =?utf-8?B?b1prOFVwM2hEMmVZbm4waVFVTlJtZThHUm5LQTh5dVN1ZEd2KzlXUUd2NGpt?=
 =?utf-8?B?S1lOZU11YTFRQnhyQXNSK3BSMk5CRkVHdmFpMzg2cldmQ1laKzM1dmdxeHpM?=
 =?utf-8?B?dWFJMVowTEJtOTlNazFvTUpjYmkxTHIrUlViSUtPbEEwZWkvTG0xUGpRM1Np?=
 =?utf-8?B?ZXlDSnVHS1o3U3dBVlpMVGp5MGJrQWh0c0F6ekNXZUl6NEpvRmdTcEUwSmtC?=
 =?utf-8?B?V3NiY2QyMFU3Q3RMVUFYZjZoL0JvcG1UMlpodmxGVU13ZmRMcmdkcmoza2I0?=
 =?utf-8?B?MzQ5anFseTdjZnJWSzhDSzVZa0lpUkpEdFhGRGdWeGg2ZmYzaDZwMnE2dktV?=
 =?utf-8?B?QkgxcUEyZ1BaejVIRTh1OGZoNnpuUUVoNGtxN1h5V3RoTXRCcUt2TlhRandj?=
 =?utf-8?B?RjZGWG1RV2tiTUNpa3dzSXY1UXVLdmY1QXlwSEhTRGR2ZkNEQnFDSCtVV0RO?=
 =?utf-8?B?azhoMWZsaUFlenkxcm5DZ29LbFY2VVFIME5DZGpJRFhnNTRKeUlUZTBjcHRE?=
 =?utf-8?B?NjZ4NVVNT2dKRkxnWHVUdUNCQ1FnVi9VSENiM2laQjA1QUtIeXI0VlorOUFl?=
 =?utf-8?B?TmhJUjRkempzTVV3cWc2NzNJQzhjZytSK0p4ZHkvSlo5YVBHb0pUZ3FtQ0lH?=
 =?utf-8?B?N0pLOGR6Ty9leHk2THdPL243Y2t0T1hHV0tYbkFrckQ1QzROUDNFQkQ3MDk4?=
 =?utf-8?B?bkxUWXU2Nnh2UG1wbGM3SDdod2pTVWJEMU9qaWFuZXNkL1Z2NDFIck9IcGFP?=
 =?utf-8?B?UUllM0JSNUczNDIweHQrZmtqYlNQM1VBT2JYTGplb0R5YU1XcW1Ob1M5RTVu?=
 =?utf-8?B?SERqcE1zbTNWRXJvQXRVTjBWYzMzM0ZNUlFsLzYzR2w3RlhRT1o1WlkvQkRL?=
 =?utf-8?B?VjI5NWdzNVNSd1lRSjRKK1ZvMngyR1F2Ym1ObmVnd3VCM3dUOFRWQjd1WjQ1?=
 =?utf-8?B?MnBVNmZRdVJHa0JaTGE5Q1ZMRzNDTjk3dHQ5Yi9GTytVbEwvWEFrSksrTFdx?=
 =?utf-8?B?NldjdUZrT2NtS243M1dNcExhV1BlMTI4S0hrRmtqN0YwQ3VoS1k1WXgyREtx?=
 =?utf-8?B?RFd0V0VUM1lYUVVKeWFVVFdXODk2VXZESXRIZzBIR0pmSFMyK3hWU09WRHdP?=
 =?utf-8?B?dHQwNVlMR1ZNNGNKTHhFS3RYbUY1RkJpWVBYd0VaTUNGVkZvcGNwTnordjVt?=
 =?utf-8?B?Y3dEaTRpMTl3USswSStZcTZpOXI3MFFhNnFraFNtM2RheVkyNUdSVUREcW1N?=
 =?utf-8?Q?J+56use1IHrpJwLymr9pT46YO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ff55597e-9529-4e73-c1a4-08dde571996e
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 13:57:02.6787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jwn7K+OQnbTwolJNaU3R2lREpEvqwOW6zUFUEF9AlC6RD7UPGiWYBISUWMzEqV1u2MAtaYrP5qzdNWV0H6T7Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7328
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


On 8/18/2025 7:22 PM, Matthew Brost wrote:
> Add explicit tracking in the GuC submission state to record the source
> of a pending enable (TDR vs. resume path vs. submission). Disambiguating
> the origin lets the GuC submission state machine apply the correct
> recovery/replay behavior.
>
> This helps VF resume:
VF restore
>   when the device comes back, the state machine knows
> whether the pending enable stems from timeout recovery, from a resume
VF post-migration recovery
> sequence, or submission and can gate sequencing and fixups accordingly.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_submit.c | 36 ++++++++++++++++++++++++++++++
>   1 file changed, 36 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 1185b23b1384..9e4118126ef9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -68,6 +68,8 @@ exec_queue_to_guc(struct xe_exec_queue *q)
>   #define EXEC_QUEUE_STATE_BANNED			(1 << 9)
>   #define EXEC_QUEUE_STATE_CHECK_TIMEOUT		(1 << 10)
>   #define EXEC_QUEUE_STATE_EXTRA_REF		(1 << 11)
> +#define EXEC_QUEUE_STATE_PENDING_RESUME		(1 << 12)

you meant RESTORE. But restore is mostly done by PF side, small part remains

when we reach raising this flag, so that is not the best name either..

VF_FIXUPS? VF_RECOVERY? GGTT_FIXUPS?

Maybe VF_FIXUPS is the best for this context, as fixups will be applied both

for migration recovery and for VF PM resume. GGTT_FIXUPS is longer and

will likely not match future platforms, where other fixups will likely be

required (we already have compression metadata restore, and the future

looks like more are coming).

-Tomasz

> +#define EXEC_QUEUE_STATE_PENDING_TDR_EXIT	(1 << 13)
>   
>   static bool exec_queue_registered(struct xe_exec_queue *q)
>   {
> @@ -219,6 +221,36 @@ static void set_exec_queue_extra_ref(struct xe_exec_queue *q)
>   	atomic_or(EXEC_QUEUE_STATE_EXTRA_REF, &q->guc->state);
>   }
>   
> +static bool __maybe_unused exec_queue_pending_resume(struct xe_exec_queue *q)
> +{
> +	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_PENDING_RESUME;
> +}
> +
> +static void set_exec_queue_pending_resume(struct xe_exec_queue *q)
> +{
> +	atomic_or(EXEC_QUEUE_STATE_PENDING_RESUME, &q->guc->state);
> +}
> +
> +static void clear_exec_queue_pending_resume(struct xe_exec_queue *q)
> +{
> +	atomic_and(~EXEC_QUEUE_STATE_PENDING_RESUME, &q->guc->state);
> +}
> +
> +static bool __maybe_unused exec_queue_pending_tdr_exit(struct xe_exec_queue *q)
> +{
> +	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_PENDING_TDR_EXIT;
> +}
> +
> +static void set_exec_queue_pending_tdr_exit(struct xe_exec_queue *q)
> +{
> +	atomic_or(EXEC_QUEUE_STATE_PENDING_TDR_EXIT, &q->guc->state);
> +}
> +
> +static void clear_exec_queue_pending_tdr_exit(struct xe_exec_queue *q)
> +{
> +	atomic_and(~EXEC_QUEUE_STATE_PENDING_TDR_EXIT, &q->guc->state);
> +}
> +
>   static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
>   {
>   	return (atomic_read(&q->guc->state) &
> @@ -1344,6 +1376,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   	return DRM_GPU_SCHED_STAT_RESET;
>   
>   sched_enable:
> +	set_exec_queue_pending_tdr_exit(q);
>   	enable_scheduling(q);
>   rearm:
>   	/*
> @@ -1494,6 +1527,7 @@ static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
>   		clear_exec_queue_suspended(q);
>   		if (!exec_queue_enabled(q)) {
>   			q->guc->resume_time = RESUME_PENDING;
> +			set_exec_queue_pending_resume(q);
>   			enable_scheduling(q);
>   		}
>   	} else {
> @@ -2065,6 +2099,8 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
>   		xe_gt_assert(guc_to_gt(guc), exec_queue_pending_enable(q));
>   
>   		q->guc->resume_time = ktime_get();
> +		clear_exec_queue_pending_resume(q);
> +		clear_exec_queue_pending_tdr_exit(q);
>   		clear_exec_queue_pending_enable(q);
>   		smp_wmb();
>   		wake_up_all(&guc->ct.wq);
