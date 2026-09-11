Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0044C88E50
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 23:03:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63C5210E985;
	Fri, 11 Sep 2026 23:03:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M8pK7MPB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F12610E985
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Sep 2026 23:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789167784; x=1820703784;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=poY1zE3lv9oElQm/xD5KRNBM3Fps7EcKkB+J6rGuakY=;
 b=M8pK7MPB8sV76GjC4BeQyQFbsJtUPwgnzPLo2ZpDo0ntlrAh6iaacqVI
 7aO70JhkAgV7o1cAS3iHJkhPpPL+Vm4K/bZRGCq3rReQiTCbO97WgXmSC
 BRnG4/Kh1Ikvqo8aLCeyHssjlswn0czbXUd9/6rDUEuafHyM/XyYDPvSY
 23akot6nw/ETblZxXhpyN624kmCcWU0XhMChdyj7wGggiSBKRyNae64PN
 qC0Ywgr4SrBGomyju7l1Nf6zFnPhUg56E578HedxIzIr5fGIzXpI+yZl7
 sFx4bFZJ6AM1WIxnQ/IgfJNnRePCqg/4QX82uoVycDzbuGxETLQGF59fd g==;
X-CSE-ConnectionGUID: 2Ml850xAT2uePmIk3DArPw==
X-CSE-MsgGUID: /zJSjsyQRguXZDS3vrnAZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="89676042"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="89676042"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 16:03:04 -0700
X-CSE-ConnectionGUID: Z3koeQF0RV69VLtha0frpQ==
X-CSE-MsgGUID: VIRD0U7zSb+pNJrmAHA2Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; d="scan'208";a="297028299"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 16:03:03 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 16:02:59 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 11 Sep 2026 16:02:59 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.11) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 16:02:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kBp+CkBt6Wz1EUxDtw9JInVkIdnOflIZ+yOBHUkqavjkMjKZSVoLia85xw+j9N5qEx2sbGf+3xfH//qjQYDBF0FyzIfwyqHD/i9w+QKHkkpJNkB2ldpoF9FS1+YQl/R5fzOPctpXwSgc6/gyPq8zYZR68Rd2u2yM/2ePH9AN8TSGL2XI0vr8V7jmdQUqE7UW3i+WpZ2/l3xdVbdfvnwJeq6S7WVBfJsI5y39+tDUj3bN+ijeERMNox6pNfoZpfmWBWZeNUDqoutDcGFztETd6EbE/T8JNWSpXMbBopToLG39NjZin40C8k/wJtaZ0oi+tmiPEwlf9IkyttNiHwr2eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LBNXqvJEO4s1T8iOs52SOlSbJ0jLq7NP5vDAh4o83nE=;
 b=QsZbzOvezdZcDxK6RNtE/pMqQAjVYKaNproDD5SbioBdQcif95c7+HVt6QhBRpq/lTO5jqV/cZrvcQPCtWVHYjf75H6a0qoXr9FL9LhGrsRbqTnVi0oNE+g69NvPGZHSegYb117Kq40NTYQCWcq2sTMeIF0pNatrSIewJGrKw8Gp1KjzJaAnwb/XYxwyebwF0vT0xSCEPOVeqUqQxitASWOH82X/t3ouk71Kdbn5HnPYsGnFZ5s8o4I2IOzw+/DfTL0vBaaKgJTmlACyQAXmf338PudnP+Yq6PK2Ie7fpyEyrruHT09BehYCtwNPV02vJa9ZkXIr0sGj2V/NpX15NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by DM4PR11MB5995.namprd11.prod.outlook.com (2603:10b6:8:5e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Fri, 11 Sep
 2026 23:02:42 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c%5]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 23:02:41 +0000
Message-ID: <7d358648-54c1-4fb7-a3b9-d5a31cb7c263@intel.com>
Date: Fri, 11 Sep 2026 16:02:39 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/xe: Inspect all forcewake bits for runtime
 idleness
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Badal Nilawar <badal.nilawar@intel.com>
References: <20260910212823.2358362-1-vinay.belgaumkar@intel.com>
 <aqMsfvRS1Ge7Ke7u@intel.com> <8a6a5fe1-4965-478e-ab80-71a4c353ed21@intel.com>
 <aqR5mNSXKbICZKKU@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <aqR5mNSXKbICZKKU@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0115.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::30) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|DM4PR11MB5995:EE_
X-MS-Office365-Filtering-Correlation-Id: ee8deca1-5e67-4991-e4db-08df1058c85c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|11063799006|56012099006|10067099003|4143699003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Xn/L0Pt8dPFJHCxkRanY/uGCHvCdZOzikWhR8cO2xk+h86JN3YXzIBwqpKRt5sc6K9OT+HX0hW0E74psu46qnY19EeqQ3x+hYN4kL2M7UxSSg1cMVvJXxlcTfxdR2v5oZB+YqhRyS/G6LqMr/SCbt81saRq2HE7gZM1qXmjHXQIdPIwJX+lNb3CDXUqJ1mFZm/v1tudVYPRx2MxfIpDEHpUHPmz9pmPIZNlGLTs3xZTXEZCkYKDtXIuOXDI6uBbC/VLHz98ucN+UYGMbR7hwe56FXk/vUn0KgYlrb8ZKzJxTir0msikoIEdQvPFdodba9qQp9OxN4o7IsQC742w0pwZdU6J/cXx0ZfBkaGFtDrZTAaiAgZr3mQafp31HcTBGB2N0ZU2iX5eMqXmHAo7LDQyX+szKnRb+FUTHTIjxnbKCw86N4ox1N9QaROVvJqth42kWu0ZzVZ2B3q7dF96MQ2rXodJxp0Ye46PcQbGr34tnF5OALGdq/2ZGDW5SynggjNuBaQI7jb+CGzNtMQlFAmJiyda0hPWdVq8v56y4g7p2qXyDJZGLQfl1e0d1idfJcg+zT+5bnqQSAU6Vu+4XAC4DT07WKr4oXeMLR55qeBLcu09IsPkfq7uW9aCDmsJc5hWTq9MpNOjCVmZPextrcFYb0N3S1/Vluc32vlf0eRM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(11063799006)(56012099006)(10067099003)(4143699003)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2VaK25SaFU0ci94bEdTZGhRZU5pVk1uLzVBQkdIZzZoY2dlWGprNm5zbTls?=
 =?utf-8?B?OFB3Zm92TlpTaXZhWkVyL0YrNmRlRkR1UXlNcXBsZ1U4N1Irem5LM3ZDYWNn?=
 =?utf-8?B?Mzg1TTF4MzMrVE10TjUzcnd0S2dEVE9zWjVMVG5DZ1Z0THJhSCtUOHhKNGRH?=
 =?utf-8?B?em1PUHlxVVBXd3BDUjlWZi85MlIvSlk4WVpYSk1GMitrSG00dWVHNlpBL1JI?=
 =?utf-8?B?ZldJbE5yTWFlL0ZDTTBlTGhVRDQzemxRM3VqamVrTGNYUDdKMDNJd2xhbFF3?=
 =?utf-8?B?Y0E3Zk5IL3JsSTJYUHNxOHVDRGZiZ1hoR2pnMVdhdktrNWRvT0V5SUxmSlJM?=
 =?utf-8?B?cHNGd1BBeDMrM0pEcWU5NTdKejMzRXZQZUd0eFFqS0NDczhuemRrTk5qZ0Jt?=
 =?utf-8?B?Z1hSWjc4Q3lKSVY5VkkxNFJIcm1RcjIwL25tcDU1V0FzSEwwLytyNmtia2tW?=
 =?utf-8?B?b29KRkRyVVd0eHJicmhVOG95MjdzYVA5SEI4YlRvNnVpS1BGTDd1Wkl2ZjlX?=
 =?utf-8?B?aVU0bXE3U3E5eGFjWGx0S29MenI1WmFkbDBld2dxbzU4RGlvTVdaZE9pQ0hD?=
 =?utf-8?B?V0Y1dW9PZWRqMityY1VuZVBIWmE2VkpCN3UwTGtGL2JpYWYvamsvTmRFWlRl?=
 =?utf-8?B?L2VseUloQjZZRTZEbExSU0FvU1Y2KzlxMCsyeXZKS1pMWk5mMGJNVmNSdHY5?=
 =?utf-8?B?TnF2MDFKUGF0SlZSRFhBTTVnNWNhWEhydGIrbG5IdDZBRHVOUVVmSTRMRFRC?=
 =?utf-8?B?NVdmMDNpenV6UjVPelVPVk5Jb2tNNmQ3ekhnbExhWUxZU2ZjeXlCMENYUDlK?=
 =?utf-8?B?YnV6LzZ3dld1cGp3a2I5cDNpWXFuZnJaajJYLys5ak53anVyNm9NWW1NSVpk?=
 =?utf-8?B?ZWhSbEpIems0YTJUeDdJcXR6eVZxS1g2ZU1OTXk4WkJxNUIySXAwdEZnN1ha?=
 =?utf-8?B?TXAwbHpLWjB3YVBNQ1B1cWV6cEtiN1c1a1UwRXhvTU9sYm5ZWmt5eVBVdzla?=
 =?utf-8?B?U21hZW9KdU9CM0ZmTHczZWxPNEZDZk9jU0g5Z3FhVkJUenpFUGNab2R5cCt0?=
 =?utf-8?B?RFhvc2tXTTdDQlJseVp4eDMrcmZEYmI1dVpyWk5DL0p3b0FXY01xMXVjYjJJ?=
 =?utf-8?B?dndtYm40cFJXUFkvSWdha0dUVWgrelNVNlJNNUlHbXJMbzdVSHlHODEyMFU4?=
 =?utf-8?B?WFoxZTN6S1E1Yi9DZjdGTXZXL3grR0NISDMvdDIzeVBWN2ZSc2o0UnNLZys1?=
 =?utf-8?B?ZFpkaGEvRmwwZldjVkZWVllMdnorODcyLytad0QrUHZXUFQ5QWJ4Z0pxc09I?=
 =?utf-8?B?YkhJak41ZTlQSTlZRnowZnVUdGU2TU1VSkgrNGFkcmVPZ1ZGRm5nT08vUmY3?=
 =?utf-8?B?Z0ZIUGJQU2thaXZCWkpvZUhKclh4RW9zYm4ySlF1a29rRXd0bEN6aWxDcmdm?=
 =?utf-8?B?NW00bnc0amF3NzNSU3F3UGpHUUd5SXdoZzFUeHBacjI3QmdPbmlRTUZWTThC?=
 =?utf-8?B?elRza0hmRmpuUWl1b0F4Ym1iWjJ4Y3hSUjJMbDBsUnZmZzd3b0xaMlpFRnU0?=
 =?utf-8?B?c1RFRnRMUkd4Vk8xbzBXbUFvdnIxYVlOa1Z0R0hGM3dzY2dzS0NrUWREcVRW?=
 =?utf-8?B?amVDWHU4YkJYSzdUbFRiR3RlV29Db3VmYkVXbDBvMU9BZm1LdG02Nml1K0xK?=
 =?utf-8?B?WEVZcFhRdC9UT2dmQnNlaGJ0Rzd3aFV3bi9pSWxXcHp6VC9MbFhDN0V0OHAr?=
 =?utf-8?B?bVd4aVZXWmVZNW56NVQ4WUpYa3h5c2NzSWYreFhOdnBkVUpmM00rbEpkOHgw?=
 =?utf-8?B?VFB2bmZRWW1VTHN5Vk5RVWZXdjBJN0x5T2NBMXZ2N1VtcmN2VVVjZHllN3pm?=
 =?utf-8?B?NExHYmhnUFFNZ0tyYy9WNVVXM2lMZnNtQk90UkhoRGV3WDBLZFNwVzdCbS81?=
 =?utf-8?B?Ky9ieDFWVTYvUmZRaUt5ODlwOHRoZ0NaVkRBMFEzZTJscEx6eU1JWDd6UXk5?=
 =?utf-8?B?b0lNVDZaTUV4Z2dQajRYbTd1NFJlOTRJYzBhMnFkZGk2YTRCTmloWDdDNW5t?=
 =?utf-8?B?N2EvV3lkSHFPS3daMVZUck13TkQ3STNmeDhQcHZaT0pjWnFNNDhISGxXcm9q?=
 =?utf-8?B?eXlmbWlEbzNJSm0vZS9pcEJ5T0FzYjVDaUdWdUxxRy9QcGVXQllwY0Nra3Va?=
 =?utf-8?B?VjNMbC8yNnVIVmNWYld0SXkwWlZiNXFlbjV3Y0g3WE9VNDU0NlhScitoajBW?=
 =?utf-8?B?djI4VXY0bUd3bGpnQ2RFa01KZll3dW85dXhSTFpPclJ5Q3JqN3pWZWZpbndO?=
 =?utf-8?B?b2ZlUGtOOVArell2TzZ3T2YvczlSUFJRbG9QazljcjZ4T21zNi9NMzNJTTl0?=
 =?utf-8?Q?vJzkF4abP1qKplYs=3D?=
X-Exchange-RoutingPolicyChecked: lX8fbRmzW+0YgnrS/FddvD4td8hk7NZHmWyWhzjD3KlFzLX3g5GmqGm5TVHtsv4X8T1YkKMPZqoiwotu56UaMIILak35KxHLMlSj/r/os01BtLkNU/GFKXqBSEPdkEyzrelIgtWIgFhZyUpysw4AI1eC+YmtMC4dSXsKx9HYs95LPCs6y0WmahW4m39jPejXNYHBxLKcBmnRCJU5HrfMM2z7q+nlLKxb1FLY+eXReUXjLpI+EN7X4wTLtMV5fo8sTmzf10FNfx5iWz9qYE9ElxD5OK8OLy8hne4coLVDEJDgtdE0gErD9RrH/VGWNjXLnPQAVBWb7BJ+9kcRLtwdyQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: ee8deca1-5e67-4991-e4db-08df1058c85c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 23:02:41.8526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 82+6rakOsKy7jXL6Iov6sadlQZ+per1RB6y70vYo1tSKwwFDFivIvx9b5n9nJZOKfR3cHifKPFYu6jWf43t3gJUyjblzb6avxgN3hl9GkPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5995
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


On 9/11/2026 2:58 PM, Rodrigo Vivi wrote:
> On Thu, Sep 10, 2026 at 04:00:40PM -0700, Belgaumkar, Vinay wrote:
>> On 9/10/2026 3:17 PM, Rodrigo Vivi wrote:
>>> On Thu, Sep 10, 2026 at 02:28:22PM -0700, Vinay Belgaumkar wrote:
>>>> Inspect all GT force wake bits in the idle check for runtime suspend.
>>>> This includes the ones not typically used by Xe KMD as well. Skip suspend
>>>> when any of these bits are set, since it could mean someone is trying to
>>>> keep the GT awake.
>>>>
>>>> Also add a call to pm_runtime_autosuspend() inside the idle check. This
>>>> ensures a PM subsystem retry at a later time.
>>>>
>>>> v2: Only check the GT domain FW register. Other domains require a GT force
>>>> wake applied before we can read their registers. Retry if idleness check
>>>> fails (Sashiko)
>>>>
>>>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Assisted-by: Claude:Claude-Sonnet-5
>>>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_force_wake.c | 25 +++++++++++++++++++++++++
>>>>    drivers/gpu/drm/xe/xe_force_wake.h |  1 +
>>>>    drivers/gpu/drm/xe/xe_pci.c        |  6 +++++-
>>>>    drivers/gpu/drm/xe/xe_pm.c         | 19 +++++++++++++++++++
>>>>    drivers/gpu/drm/xe/xe_pm.h         |  1 +
>>>>    5 files changed, 51 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
>>>> index 197e2197bd0a..0acb796c756c 100644
>>>> --- a/drivers/gpu/drm/xe/xe_force_wake.c
>>>> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
>>>> @@ -148,6 +148,31 @@ static int domain_sleep_wait(struct xe_gt *gt,
>>>>    	return __domain_wait(gt, domain, false);
>>>>    }
>>>> +/**
>>>> + * xe_force_wake_any_bit_set - Return true if any force wake bit is set
>>>> + * @fw: struct xe_force_wake
>>>> + * @id: Force wake domain id
>>>> + *
>>>> + * Check if any multithread force wake bit is set for a given domain ID.
>>>> + *
>>>> + * Return: true if any bit in the force wake reg is set
>>>> + */
>>>> +bool xe_force_wake_any_bit_set(struct xe_force_wake *fw, enum xe_force_wake_domain_id id)
>>>> +{
>>>> +	struct xe_gt *gt = fw->gt;
>>>> +	struct xe_force_wake_domain *domain = &fw->domains[id];
>>>> +	u32 val;
>>>> +
>>>> +	val = xe_mmio_read32(&gt->mmio, domain->reg_ctl);
>>>> +	if (val & 0xFFFF) {
>>>> +		xe_gt_dbg(gt, "FW bit set in domain: %d, reg: 0x%x, val: 0x%x",
>>>> +			  domain->id, domain->reg_ctl.addr, val);
>>>> +		return true;
>>>> +	}
>>>> +
>>>> +	return false;
>>>> +}
>>>> +
>>>>    /**
>>>>     * xe_force_wake_get() : Increase the domain refcount
>>>>     * @fw: struct xe_force_wake
>>>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
>>>> index e2721f205d6c..53941e5a0fbe 100644
>>>> --- a/drivers/gpu/drm/xe/xe_force_wake.h
>>>> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
>>>> @@ -18,6 +18,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt,
>>>>    unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
>>>>    					    enum xe_force_wake_domains domains);
>>>>    void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref);
>>>> +bool xe_force_wake_any_bit_set(struct xe_force_wake *fw, enum xe_force_wake_domain_id id);
>>>>    const char *xe_force_wake_domain_to_str(enum xe_force_wake_domain_id id);
>>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>>> index ab4da1d9a9f1..a79d928ad75a 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>>>> @@ -1438,10 +1438,14 @@ static int xe_pci_runtime_idle(struct device *dev)
>>>>    {
>>>>    	struct pci_dev *pdev = to_pci_dev(dev);
>>>>    	struct xe_device *xe = pdev_to_xe_device(pdev);
>>>> +	int ret;
>>>>    	xe_pm_d3cold_allowed_toggle(xe);
>>>> -	return 0;
>>>> +	ret = xe_pm_check_runtime_idle(xe);
>>>> +	pm_runtime_autosuspend(dev);
>>> do we really need this autosuspend here?
>>> I believe this is what may have confused Sashiko.
>>> And if needed it probably worth a separate patch with explanation.
>> It was Sashiko's suggestion :). If we fail runtime_idle check due to someone
>> holding a forcewake, there is no mechanism to re-trigger the autosuspend
>> when they release the forcewake. I believe it is only retriggered on a
>> pm_ref put(). So, system will be stuck in D0 state even after the forcewake
>> has been released (until some execution happens and a pm_ref count goes to
>> zero again). We only need the autosuspend when the check fails, so should be
>> part of the same patch? I added it to both paths since it is a noop in the
>> case where we succeed in the idle check (as it returns 0 to the PM
>> subsystem).
> Well, Sashiko is right about something that I had never realized,
> runtime_suspend failure does schedule itself, the idle indeed doesn't.
> That's awkward in the rpm infra, but not a driver job to do this call.
>
> Also, I don't believe it is forever anyway. In the next put/get pair
> it will be rearmed.
>
> So, we can either accept this delayed rearm, we can move this check
> to inside runtime_suspend and avoid the _idle or we can try to work
> with linux core kernel to ensure _idle is rearmed.
>
> But this call itself needs to be removed from here.

Sure, we can only check inside _suspend call to simplify. In that case, 
there is no need to check for forcewake bits, right? Checking for C6 is 
sufficient since it cannot happen without the other.

Thanks,

Vinay.

>
> Thanks,
> Rodrigo.
>
>> Thanks,
>>
>> Vinay.
>>
>>>> +
>>>> +	return ret;
>>>>    }
>>>>    static const struct dev_pm_ops xe_pm_ops = {
>>>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>>>> index f517bf453b54..e8d4cdbaef88 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pm.c
>>>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>>>> @@ -17,6 +17,8 @@
>>>>    #include "xe_bo.h"
>>>>    #include "xe_bo_evict.h"
>>>>    #include "xe_device.h"
>>>> +#include "xe_force_wake.h"
>>>> +#include "xe_force_wake_types.h"
>>>>    #include "xe_ggtt.h"
>>>>    #include "xe_gt.h"
>>>>    #include "xe_gt_idle.h"
>>>> @@ -1030,6 +1032,23 @@ void xe_pm_d3cold_allowed_toggle(struct xe_device *xe)
>>>>    	mutex_unlock(&xe->d3cold.lock);
>>>>    }
>>>> +/**
>>>> + * xe_pm_check_runtime_idle() - Perform checks before signaling runtime idle.
>>>> + *
>>>> + * Return: 0 on success, non-zero on finding device not idle
>>>> + */
>>>> +int xe_pm_check_runtime_idle(struct xe_device *xe)
>>>> +{
>>>> +	struct xe_gt *gt;
>>>> +	u8 id;
>>>> +
>>>> +	for_each_gt(gt, xe, id)
>>>> +		if (xe_force_wake_any_bit_set(gt_to_fw(gt), XE_FW_DOMAIN_ID_GT))
>>>> +			return -EBUSY;
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>>    /**
>>>>     * xe_pm_module_init() - Perform xe_pm specific module initialization.
>>>>     *
>>>> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
>>>> index 6d5ab09cb769..d1f6a694b7c4 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pm.h
>>>> +++ b/drivers/gpu/drm/xe/xe_pm.h
>>>> @@ -38,6 +38,7 @@ struct task_struct *xe_pm_read_callback_task(struct xe_device *xe);
>>>>    int xe_pm_block_on_suspend(struct xe_device *xe);
>>>>    void xe_pm_might_block_on_suspend(void);
>>>>    int xe_pm_module_init(void);
>>>> +int xe_pm_check_runtime_idle(struct xe_device *xe);
>>>>    static inline void __xe_pm_runtime_noop(struct xe_device *xe) {}
>>>> -- 
>>>> 2.38.1
>>>>
