Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22602C3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jul 2024 11:08:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEC9C10E289;
	Tue, 30 Jul 2024 11:08:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H9O35jLt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1548E10E289
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jul 2024 11:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722337715; x=1753873715;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hMbIqSr89jMNmAhMeIgVI84Da8yD/SzihZuwnQ3jV8U=;
 b=H9O35jLtF0/zIFQHttRMYkdUBKRtpXq9JSYSzRC1MoVhm37uvMieqfC6
 ftAVg1mKztCgjteHNH9YfPxzz4Y5HkoUB/bePekcVOR21eb8blJpHoqkH
 tUd3C3KwI/7beiyY0dUkatTM0z0ueYjDN2L91qSDAvxWF9x1+rG8EEV8P
 O9yUNcdaK+pKQL73mxRZhJ5o62EwFdWUjt5f9S9t0lgphVU+YphOmB+m4
 IzZs236iGkGTpE1O5NoJEx7ZyWjNjET/sxin9QDSf0y+FXr+cmK6xwp9a
 gegx2cwIXd+RdZN6mHUr07Heok+Xt36UhGy4DrmMpNQQhRXdYjFxXbRp2 w==;
X-CSE-ConnectionGUID: 6W3QMF0lRa+3amOMsHUaaA==
X-CSE-MsgGUID: BukOq/XSR/aMCHLoOp50Ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="37656282"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="37656282"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:08:35 -0700
X-CSE-ConnectionGUID: BaSDPMhVTFufyVvIhGJI5g==
X-CSE-MsgGUID: nt6Yal0bTuubjalF1YYcPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="58937248"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jul 2024 04:08:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 30 Jul 2024 04:08:34 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 30 Jul 2024 04:08:34 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 30 Jul 2024 04:08:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G7S9EVUa7yZ1bMJWp+gpwzQ5Po/U6s8O6odTqe6YH326S69OabzoD/grd0KndHlUaAyNCMCgup/gXa7ev+iklLs5m7xEam1tSQAgDCkO5SCuL8cVn037fhkhhTL9oG39CJZ+OkRuumOCfQlUd3nfy84SazTTC47Q3pYq4+nFdiuMkBDFrUpwHKpsBtqlzksuA4igeL7J+y2KI6h/YeeRIXSJN87zaKkhw9cP9QdjmvdE2AF2RESQoJwnAYM5BXz6aA9KuQSdhplehfrdVzVtXf+iYO5xZpOrvLdRV5qMvGxV1tyK9aP5NYy6yRFdAJVnCPyaKAFVPlqXc0WbxgKRWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5gDvG6yFveBFOnyxnQoUdtqiOm3t8nbqUNDJWVjRw/A=;
 b=KLOvlhumfK0GaC/hbh10/nViluAD4qJL9AR0rOi9qWGGmT8MxSFpfKfe5mgLRMfNldqj3twKk3B8cjNvfRHsElTaObw4e8BKSGAkaXN/DLkRlrzO+HPvmN6iYEtu+v403NhLhRT1+mk74HJF5tlI0bVuC1bnVBauROpzext/0lu5sgBt9JHECuVwdIW7DfQoZYJr66vmQVb19eq2pAgMkMf0Inti2tCKGm4C4CKKXMjh0jyV+5bkAKa+9u20H/FwF1o30qQww2ZHMn3g5NTHGqHG5PvHMB1IV5Lpq2PYV54aBWZvMcYAWapCPo8RwPBcQkZGOecXXqJO2uw0ourhJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SJ2PR11MB7518.namprd11.prod.outlook.com (2603:10b6:a03:4c5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 30 Jul
 2024 11:08:30 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%3]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 11:08:30 +0000
Message-ID: <8373f7f9-fcce-4779-942f-360fb1e2f3f8@intel.com>
Date: Tue, 30 Jul 2024 16:38:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/xe_gt_idle: add debugfs entry for powergating
 info
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <matthew.d.roper@intel.com>, <michal.wajdeczko@intel.com>
References: <20240729102942.937680-1-riana.tauro@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240729102942.937680-1-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0039.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::10) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SJ2PR11MB7518:EE_
X-MS-Office365-Filtering-Correlation-Id: 8768ad2d-49ba-4ac2-a8bf-08dcb087f1a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aVlVUEZsdWlZbGRLV3ZIcTdHakt4NldibXZCbkoxK2VRRCsydG5KbmZjVUFF?=
 =?utf-8?B?SGdHS1gzc3Qxa2VXNHlVZEhhVTBDU0lhaWtNVHlhUG1nZFEzNUtxcFhub0Nl?=
 =?utf-8?B?UjF3eHRDWUtRT2l1VEJvRDk3RlJIZVVUeEtEbjYvUVlzd3FOa1VmUm91SE1q?=
 =?utf-8?B?Mjl4UDZidFhUaXByZjUwa1VxVythRGtUcElQM3ppOFZPdkh2bXNSaWZwazIv?=
 =?utf-8?B?b0JUMVM1aFNTMldrUnJJN2R0L3lEdkc2NkYrVnlVdmEydUdXZWtZcXhVOWM2?=
 =?utf-8?B?UVRTS1EveHB2WEt3elkrSGJlYS9UeThOMW5tcHVzb2pLWTVWQkVWTGtHdzJJ?=
 =?utf-8?B?U1hCUzBzSFpOOFdXM0JYZUEwRlZMZU9zUS9xOFl4WXdZTktzRXAvVXJsL1dj?=
 =?utf-8?B?SDlqdmltR2JhRGRCUWE0Sm1rdFA4Qy9aOWhlRXNuVjByRWNPQzlvQVdoaUI4?=
 =?utf-8?B?OStOQ2NnUnlkbmlmT2RodG5lSFEwZHJiU21ZQ0ZyQloyTGpVRFR1djRNREdk?=
 =?utf-8?B?VnVoZlFMR0VOVG1YUmk0RnlYUkpVSUVkZlVFWkpXQ2hVeVM4UmRFcWRWUFJR?=
 =?utf-8?B?WHZmd3FQUDNhbnRoRjlOU1hyUDNhNmkxYnVVTnJnTWtHVDlLdzFTSzY2dEZV?=
 =?utf-8?B?c3dsb2NxSjQrOUFYRDl4RGI3VEZRUWZXeVY4TGQzM3o5OWxCRy9uZkVDdm94?=
 =?utf-8?B?MDYyaXk4YzJFazJEU1d3MjE2UzJocXo2M3VvNk5Sa3Jha2I3eURSbEg3RFdu?=
 =?utf-8?B?eTgxaW8rci9ZQzV4VWpFaE1RSDVUVzJ2bUkrWkdhZW1GS1VWdzR1OUI3ZTc1?=
 =?utf-8?B?N3ZzVTJvQk5Ta3lkL0ttUVltMTdBV2N3NkpibHBUUkQrVlBrRVRBWElUTk4v?=
 =?utf-8?B?aExORkp2dzFmd1RWK2hrekh2d2I0MFNzTTNObm5CTkJzaWpldnJpRXNGNjZV?=
 =?utf-8?B?eVJScGkxcWlsTVNwcUwzRWlwaklmUGFEZFZyNHFFaVFndmdWSHp4NGhhNlBw?=
 =?utf-8?B?bkJzcHNaMjRCbk83Mi8xbzRWdVIvVlcwbGYxNDljRDJoMzdtZ3JVZGtISFd4?=
 =?utf-8?B?V3FOYkhlNnVlbFlNaDVmUmZuRGhqSHhkVU15aVlWYWt3K1ZaN1k4WGFQaUsw?=
 =?utf-8?B?cmVoYmVYMUdVN0I0K0lIMzkrNHlrcWZ5QVBrMCtiZk1pQWozMVlFWGxhVlJB?=
 =?utf-8?B?VmZzYXhaNmd5SUN3QW5lbnRFZXFUeDF3dzdJbWNWUTFSKzYrZ0Y2RDBOVTZo?=
 =?utf-8?B?NVNIMzZYd2QrZlVpQlQvQUZwekJWOEpDcGFsSm5wdHcwSjczdzI0RXlNckQz?=
 =?utf-8?B?NXMvMkdwaTlha3VJOUlRcFNMeGxjQWllenZINlpsWVNuS25pZjdvMTBoc0tW?=
 =?utf-8?B?Z3BQQkxLeW1lUE9UUmZ3eFFhUkRia3ZpV0t5am54WnE0U2JpY28zZWhzV0Rh?=
 =?utf-8?B?b29NNzJUK1JoVHdOc2tDNlduQytzY2VhMXFMeUtkY000Yk9tbWwvcm04QUU1?=
 =?utf-8?B?ODJMRGt0U1NXQkZJZVE2Z3N3aXd3TjJ2Sno3ZTBEOFlnM0xlSXh4bjF6emVh?=
 =?utf-8?B?OEZMS1hwbXpGMEh5TWNCR09lVXJBTHBZTEN6UmNXazdKaDZsak8ySmpsOXpD?=
 =?utf-8?B?WW1ZQktybnFDTFRDb3ZCRUZXcTRacC9kVWpkT3R2ZktpVElHclFjaEpqRFB2?=
 =?utf-8?B?a0kwNlFmcmtRcGZKNEdXN0k4REtEQ3E3VlIvRzZ0Skl3dTNsVFNLZC85d05x?=
 =?utf-8?B?bVZQNFVDT1R1aVZkSGxUZXdGUy96VDkwNzZvck9OajA3SmlINXVrSkdtSDh3?=
 =?utf-8?B?UHVwNERxTDZTRkh1aS9Qdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmRDbXFxc0JhMXE1cE5QaElydDNyVkRPOHppS1l3Sm5NbFZGdkFPOHhiTVls?=
 =?utf-8?B?RHkzRVpMb2dFRkh2V2Q1d2s0LzcvT09SNkV4RGMrTkNBdmVkQnlSc1ZnTmpi?=
 =?utf-8?B?b2RNQTNYREpBTWZRVElNYWZCYmJ4NkIwbVVibDR5Y0twWVBUc1liaTV5UDR6?=
 =?utf-8?B?Y1FheEVoQlljK2FxR0lYbGt0U2dzRnhjT1lTcDdnRUdPUG8vNkJFRlRqelhM?=
 =?utf-8?B?T3l5TWRpM09TTmQ2TGpta1NEWmdwRXE4ZFBBRW93bjNuNW11QUVBOXdNTERO?=
 =?utf-8?B?SllXVmVXTjFaRCsxUGZWK3JjWFV3eFpMaEQzS1JSUGJRR09JbGVtcXpMS1ZN?=
 =?utf-8?B?Z2w5QVpUaEw5eUlEUzN2WVNKT01lQWp5WXluNW1hT01kVWdDTk45cXlibGtv?=
 =?utf-8?B?TXNkWWt1b3lOYWRpeHhwa1l0OWlLcHBsRzZrcjVXWkxMVW9JOHdHWDFVN2VX?=
 =?utf-8?B?NXh0ZXBycDVidFJGaDRJK3I0WHZlQkpYcFgrL2tSeG9ZVEFTSmZsT0VzNzhB?=
 =?utf-8?B?cytQc1RYVTIxUW5KeElTdThEVGhaSVdBS0hYa1FSWE90Z2NydVpWd3ZsaG5B?=
 =?utf-8?B?UDB0QzU5RGhjNTU3QU5YWTJ0Lzc3U2FqQVVwWnhQMnFSS1JZMWF5WGh2RlI5?=
 =?utf-8?B?dGZTb0xNNWt6Qk1QcTNVNTFqeVV2dm16QmV1S1NSdWlZdlNPSFMrU1dlYXhl?=
 =?utf-8?B?MHhOZFJyVkdkaVBpSktYc2xxRzVoQjY2OXpWYmwwQ2Z4clNUS1lINHdVUWl5?=
 =?utf-8?B?SHpBNk5zMEFldCtXWEk5clJYY0VxVUJsQXFGM0pPNzBiRm92dUpOVmE0dUNC?=
 =?utf-8?B?T0RHZlZJaUx5RXBESVVkdytybGsySEoyNzc3dlNnZ0JkZFlrMFNpSDVzN3p3?=
 =?utf-8?B?VXZBTEptZGJBenVyaUpRa1liTFZQOHQwVjFZekpUQXR0aGxLTHB0YkxvcHh6?=
 =?utf-8?B?RG1QTmtmdm1ISjhvc29IVnV3V2Z0a0xiSDNjbC9YblRPQWhWQ2ZBc2d0S2xS?=
 =?utf-8?B?SGZHNFNJckY2Y3dFNCsrblErNEdabnZrNk9UZXZDc09KWUM1ODZLcG9GTS8x?=
 =?utf-8?B?RjJRL09FOGtxelcrNUR5Y0ZOdlJiVVpGTjNRTDB5ZXJmWERoT1RXNTJGN3J1?=
 =?utf-8?B?VVRTMUlQaTl6ZkdwWkJERzdYSE45VWt5endEMjBHVFdqa0xKekoreW95R0Y2?=
 =?utf-8?B?K3ZqcWxUM0VnQlMveUN2MXBZVVFoeGQzSGVvYmtQaG9meEw3SzRnUTllN1hC?=
 =?utf-8?B?ZFQwWGJhWGpWT2RIK3dObjNtMVlNQjArY1hWdkxzL3FQU3MxVzkxL1NaWmJj?=
 =?utf-8?B?WjRYRGQvNEhodit1Z1psYkdoS2k0Und4VDAwWVJIcUtFMGswbXRnZ21waTdG?=
 =?utf-8?B?S1l5RmN0bVc2R0FHend0OFR2a2QzQ0NaR2lmempPa0VTYnFvNmVaL3FRMjZN?=
 =?utf-8?B?a3FhMTBZVERybGdlejlTTThTVzVreWhnRlltWS9vYXNaU08vaVhncUw3NEFj?=
 =?utf-8?B?T3JhQmpMR1FCbUVDWnVpNGVHQlREc3IyNkRnNFpFSmtEc0xiT2Q3Ti96eUJX?=
 =?utf-8?B?R3lnRFlubjIwUDYxeExuTUIwNWVvQ3lqcFBnTGtUSHB3TXhBenhhZnV1Yis0?=
 =?utf-8?B?Q1JGaEFHL2k3Zk1uQ3J5ZFp1UG5KSmVKUjRrSnBTeTVkeE1lbkdzU1VIY3pY?=
 =?utf-8?B?Unc2dWx2dUptUENuMzlPc2VTM2JlTE5Kei8rV1hIeEVHSXlHeWQzSTJWTDF1?=
 =?utf-8?B?emdRTjN2N0hVVGtVQXhjR1dDYjRGOUlBTFFCQ1gySk9GcUVIOEplSDlRYklJ?=
 =?utf-8?B?R1JGcHJ4WUQzOGZ0dFVobEFQS1g3eURuVjdaN2h0YUpFbG1uVjBCUmExZjRt?=
 =?utf-8?B?N0x2ZmJGT3BPeHdkQWtLOXFjNE9OaE8wK0RzNlZPMXJXUEhSQXAra1FwbFhX?=
 =?utf-8?B?T0FwS0dqTGtnQXFtU0EvV0N2VGN6ZjRPVnRhSE9RVTZoYzEyazdiTzQ1WjNu?=
 =?utf-8?B?aUVEeEc5ajZZK0JmanJERi9jSGZEQUd2UkYvMUIyMG8wa3ZKTHpQbHMxc0tN?=
 =?utf-8?B?NWUwbkpqZG5BTTllQ244UGtDamFSNCtqRmtRK1NJYXB2QytodTI3dDRxMlpI?=
 =?utf-8?B?OUxmT1RpRXQvQTJVRXUwa2pGemt6U2FtUkNreEhZc0N1a3Nzam1JUmE1cSsx?=
 =?utf-8?B?Qmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8768ad2d-49ba-4ac2-a8bf-08dcb087f1a4
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 11:08:30.4066 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rgLaehkyHeuHIxD0ya4n/rp5ii9n7z6ql8shqs+Dii4qYkgG3RwVhVMOaIhq+lV/UudLmgMyie1Fh7S91iKHmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7518
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

Hi Riana,

On 29-07-2024 15:59, Riana Tauro wrote:
> Coarse Powergating is a power saving technique where Render and Media
> can be power-gated independently irrespective of the rest of the GT.
> 
> For debug purposes, it is useful to expose the powergating information.
> 
> v2: move to debugfs
>      add details to commit message
>      add per-slice status for media
>      define reg bits in descending order (Matt Roper)
> 
> v3: fix return statement
>      fix kernel-doc
>      use loop for media slices
>      use helper function for status (Michal)
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h |  8 +++
>   drivers/gpu/drm/xe/xe_gt_debugfs.c   | 13 +++++
>   drivers/gpu/drm/xe/xe_gt_idle.c      | 83 ++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_gt_idle.h      |  2 +
>   4 files changed, 106 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 8a94a94d2267..fe774d0894fa 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -336,6 +336,14 @@
>   #define   CTC_SOURCE_DIVIDE_LOGIC		REG_BIT(0)
>   
>   #define FORCEWAKE_RENDER			XE_REG(0xa278)
> +
> +#define POWERGATE_DOMAIN_STATUS			XE_REG(0xa2a0)
> +#define   MEDIA_SLICE3_AWAKE_STATUS		REG_BIT(4)
> +#define   MEDIA_SLICE2_AWAKE_STATUS		REG_BIT(3)
> +#define   MEDIA_SLICE1_AWAKE_STATUS		REG_BIT(2)
> +#define   RENDER_AWAKE_STATUS			REG_BIT(1)
> +#define   MEDIA_SLICE0_AWAKE_STATUS		REG_BIT(0)
> +
>   #define FORCEWAKE_MEDIA_VDBOX(n)		XE_REG(0xa540 + (n) * 4)
>   #define FORCEWAKE_MEDIA_VEBOX(n)		XE_REG(0xa560 + (n) * 4)
>   #define FORCEWAKE_GSC				XE_REG(0xa618)
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index 5e7fd937917a..c623295235d9 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -15,6 +15,7 @@
>   #include "xe_ggtt.h"
>   #include "xe_gt.h"
>   #include "xe_gt_mcr.h"
> +#include "xe_gt_idle.h"
Header inclusion is out of order.
>   #include "xe_gt_sriov_pf_debugfs.h"
>   #include "xe_gt_sriov_vf_debugfs.h"
>   #include "xe_gt_topology.h"
> @@ -107,6 +108,17 @@ static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
>   	return 0;
>   }
>   
> +static int powergate_info(struct xe_gt *gt, struct drm_printer *p)
> +{
> +	int ret;
> +
> +	xe_pm_runtime_get(gt_to_xe(gt));
> +	ret = xe_gt_idle_print(gt, p);
> +	xe_pm_runtime_put(gt_to_xe(gt));
> +
> +	return ret;
> +}
> +
>   static int force_reset(struct xe_gt *gt, struct drm_printer *p)
>   {
>   	xe_pm_runtime_get(gt_to_xe(gt));
> @@ -277,6 +289,7 @@ static const struct drm_info_list debugfs_list[] = {
>   	{"topology", .show = xe_gt_debugfs_simple_show, .data = topology},
>   	{"steering", .show = xe_gt_debugfs_simple_show, .data = steering},
>   	{"ggtt", .show = xe_gt_debugfs_simple_show, .data = ggtt},
> +	{"powergate_info", .show = xe_gt_debugfs_simple_show, .data = powergate_info},
>   	{"register-save-restore", .show = xe_gt_debugfs_simple_show, .data = register_save_restore},
>   	{"workarounds", .show = xe_gt_debugfs_simple_show, .data = workarounds},
>   	{"pat", .show = xe_gt_debugfs_simple_show, .data = pat},
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index 67aba4140510..70fe76735621 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -53,6 +53,11 @@ pc_to_xe(struct xe_guc_pc *pc)
>   	return gt_to_xe(gt);
>   }
>   
> +static inline const char *str_up_down(bool v)
> +{
> +	return v ? "up" : "down";
> +}
> +
>   static const char *gt_idle_state_to_string(enum xe_gt_idle_state state)
>   {
>   	switch (state) {
> @@ -145,6 +150,84 @@ void xe_gt_idle_disable_pg(struct xe_gt *gt)
>   	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>   }
>   
> +/**
> + * xe_gt_idle_print - Xe gt idle print
> + * @gt: GT object
> + * @p: drm_printer.
> + *
> + * This function prints the powergating information
> + *
> + * Return: 0 on success, negative error code otherwise
> + */
> +int xe_gt_idle_print(struct xe_gt *gt, struct drm_printer *p)
Prefix xe_gt_idle points towards RC6, better to incorporate _pg_ 
sufix/prefix in function name.  > +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u32 pg_enabled, pg_status;
> +	u32 vcs_mask, vecs_mask;
> +	int err, n;
> +	/*
> +	 * Media Slices
> +	 *
> +	 * Slice 0: VCS0, VCS1, VECS0
> +	 * Slice 1: VCS2, VCS3, VECS1
> +	 * Slice 2: VCS4, VCS5, VECS2
> +	 * Slice 3: VCS6, VCS7, VECS3
> +	 */
> +	static const struct {
> +		u64 engines;
> +		u32 status_bit;
> +	} media_slices[] = {
> +		{(BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS1) |
> +		  BIT(XE_HW_ENGINE_VECS0)), MEDIA_SLICE0_AWAKE_STATUS},
> +
> +		{(BIT(XE_HW_ENGINE_VCS2) | BIT(XE_HW_ENGINE_VCS3) |
> +		   BIT(XE_HW_ENGINE_VECS1)), MEDIA_SLICE1_AWAKE_STATUS},
> +
> +		{(BIT(XE_HW_ENGINE_VCS4) | BIT(XE_HW_ENGINE_VCS5) |
> +		   BIT(XE_HW_ENGINE_VECS2)), MEDIA_SLICE2_AWAKE_STATUS},
> +
> +		{(BIT(XE_HW_ENGINE_VCS6) | BIT(XE_HW_ENGINE_VCS7) |
> +		   BIT(XE_HW_ENGINE_VECS3)), MEDIA_SLICE3_AWAKE_STATUS},
> +	};
> +
> +	if (xe->info.platform == XE_PVC) {
> +		drm_printf(p, "Power Gating Enabled: no\n");
> +		return 0;
> +	}
> +
> +	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
When device is in RC6 is there any significance in waking it up and 
checking pg status. I think we should check PG status only when device 
not in RC6, may be we should add RC6 check at the top.
> +	if (err)
Decrease the refcount / xe_force_wake_put

Regards,
Badal
> +		return err;
> +
> +	pg_enabled = xe_mmio_read32(gt, POWERGATE_ENABLE);
> +	pg_status = xe_mmio_read32(gt, POWERGATE_DOMAIN_STATUS);
> +
> +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
> +
> +	if (gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK) {
> +		drm_printf(p, "Render Power Gating Enabled: %s\n",
> +			   str_yes_no(pg_enabled & RENDER_POWERGATE_ENABLE));
> +
> +		drm_printf(p, "Render Power Gate Status: %s\n",
> +			   str_up_down(pg_status & RENDER_AWAKE_STATUS));
> +	}
> +
> +	vcs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_VIDEO_DECODE);
> +	vecs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_VIDEO_ENHANCE);
> +
> +	/* Print media CPG status only if media is present */
> +	if (vcs_mask || vecs_mask) {
> +		drm_printf(p, "Media Power Gating Enabled: %s\n",
> +			   str_yes_no(pg_enabled & MEDIA_POWERGATE_ENABLE));
> +
> +		for (n = 0; n < ARRAY_SIZE(media_slices); n++)
> +			if (gt->info.engine_mask & media_slices[n].engines)
> +				drm_printf(p, "Media Slice%d Power Gate Status: %s\n", n,
> +					   str_up_down(pg_status & media_slices[n].status_bit));
> +	}
> +	return 0;
> +}
> +
>   static ssize_t name_show(struct device *dev,
>   			 struct device_attribute *attr, char *buff)
>   {
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h b/drivers/gpu/drm/xe/xe_gt_idle.h
> index 554447b5d46d..4b8192d3aee0 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.h
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.h
> @@ -8,6 +8,7 @@
>   
>   #include "xe_gt_idle_types.h"
>   
> +struct drm_printer;
>   struct xe_gt;
>   
>   int xe_gt_idle_init(struct xe_gt_idle *gtidle);
> @@ -15,5 +16,6 @@ void xe_gt_idle_enable_c6(struct xe_gt *gt);
>   void xe_gt_idle_disable_c6(struct xe_gt *gt);
>   void xe_gt_idle_enable_pg(struct xe_gt *gt);
>   void xe_gt_idle_disable_pg(struct xe_gt *gt);
> +int xe_gt_idle_print(struct xe_gt *gt, struct drm_printer *p);
>   
>   #endif /* _XE_GT_IDLE_H_ */
