Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D170CC6B12
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 18:12:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E744890EA;
	Tue, 13 Oct 2026 18:12:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C27EA890EA
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 18:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791915114; x=1823451114;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pjdfCi/NyYwE+8C17JZaW4BJ89kSw+Mw51IqBATFih4=;
 b=eiVbmwFNCIh4ykt5nmZ9lMsV0nXaamqtPhUiRyLqSZnCqWIczNXLCrXc
 E76UVJ9XhXi+sa30Nc9fwFJQyjQXtcfGEb4vvPlJCgYK4xYwu1yHtabia
 /UCi5mhYqdlFYix40R78k1hBISEcxsBvlF++YD+JMx55+RduMK4X+to+W
 szzpBsZhBWVL3RqZ2BBcYxVRPmKHU3MrtTZ7pRHvGkFGnwLaQzW4r7T84
 EqEKlHqubHRXsSIz/dcMruKfRzieVaPNWQ3lkVSlMeGc3JZ20+VYO2sAG
 uC+M7u/EyR0AnJ6ECb72GJVqqW0DTBDzmVIFOTKfT4Cfyvr9UQazQRdee A==;
X-CSE-ConnectionGUID: MEUFQfzQSfqZuBAAk211Jg==
X-CSE-MsgGUID: QzV01piPTCCoEWYwDFTUxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="752599"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="752599"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 11:11:54 -0700
X-CSE-ConnectionGUID: e0nRO6TNRVy9q+S12mj4GQ==
X-CSE-MsgGUID: oi/CVIWqT1aN8zHwPaiLCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1329905"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 11:11:53 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 11:11:52 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 13 Oct 2026 11:11:52 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.54) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 11:11:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gGlR0CUGMdsXR0k3WbFODzjMYJH+z5r5DdfhNrHHNcVKVV3kDXrEetA6p5jcyildm0BvOwOR+2EpDaJbd6vyzL599s9qq6YwQsi+UWqqzTjx/lSkiIvPnCh7b4+Y4bvmn7Ob8AGoKVOy0oHz1EEtxiabPyC6AX4olrkPajS2p15wn2GLZmDZzf7YaZedX2RWuOgh1/jJad72wIRT3HLQzNG92/+ZWnK5WnAOpS8ViP162RXo28EqyxEzS9p7AlAFVcCNSWiiZs1sAvW5ORebYt6sz+yn07GpkWSTTnN+rzLK14c2atXmOSX5kppm9EuuKQ3yC7nGfc/O2ZAezG68PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=udE8vE/R5bzPjty1pGlaWiuQ4ss9eLeZz3/c2kf+ZWI=;
 b=bP1kiT02RUdbFlJ5/yx6OwTBJSLsTQb+Ge+3BbiWb4SjBZCQ241UxoMeWoRVsQcXh1unEStrtup/gtxhDrXLMeuK3w06Qh/8lDjxLE6ivMNLnC1RT2MhXxU4lAEbrkYUnzyOAIxTnZ5XqFqFx0AThLG1Qkn1ZZ6AWCuarxLz53ETGwwBm7HKQ7UuJUEzLIV/7QG9dBWMl8VWqfKkKzYdCt1FY9C99DqvGeK/Wcd4jkGIK0kqu/Ov9bEMZsX0o5oXv9f3SLr5FVbfw531Vv+/cMymj4maKnB0lnVeoIcxDCeuA1xYG23mAyfP6DLTDQuLE5cJjXtWNQCu7dnFbVghfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5232.namprd11.prod.outlook.com (2603:10b6:5:38b::14)
 by PH3PPF91320C45A.namprd11.prod.outlook.com (2603:10b6:518:1::d38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 18:11:50 +0000
Received: from DM4PR11MB5232.namprd11.prod.outlook.com
 ([fe80::2ddf:5a8a:8a8f:c429]) by DM4PR11MB5232.namprd11.prod.outlook.com
 ([fe80::2ddf:5a8a:8a8f:c429%5]) with mapi id 15.21.0522.011; Tue, 13 Oct 2026
 18:11:50 +0000
Message-ID: <c52f2c3a-eb26-4978-b479-a2934d0555cf@intel.com>
Date: Tue, 13 Oct 2026 11:11:48 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe: Synchronously wait for queue kill on FD close
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <x.wang@intnel.com>,
 <jia.yao@intel.com>, <jonathan.cavitt@intel.com>
References: <20261013023442.206915-1-daniel.charles@intel.com>
 <20261013023442.206915-4-daniel.charles@intel.com>
 <as2i2xPkEvDgAKFo@gsse-cloud1.jf.intel.com>
Content-Language: en-US
From: Daniel Charles <daniel.charles@intel.com>
In-Reply-To: <as2i2xPkEvDgAKFo@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0290.namprd04.prod.outlook.com
 (2603:10b6:303:89::25) To DM4PR11MB5232.namprd11.prod.outlook.com
 (2603:10b6:5:38b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5232:EE_|PH3PPF91320C45A:EE_
X-MS-Office365-Filtering-Correlation-Id: fd2f6024-09ae-49bd-f59e-08df295573a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|56012099006|11063799006|4143699003|261009223027099003|18002099003|10067099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: u/pDe26ljVrsKp+TUPfZxeVpuAk1fEUuLVqcjTh4TSJVaeHd/Cp0rV0Eg0pyMw+xDxlSp4acuA4IwmaezTbrkvjcMKiXpyHic1vsqPejNDiu3jKZ5CbDSBwZNjTj8yBQU73bQ2ab2mLC7+ilGTmNGnSsX5yl41iPdpFqP2PRgMoN14gTaj2j7q26NCb61MQsVvJ4Y6CaQ40uDdcy8yjR4rR17yTS+E2MMSaovVUCf2iD8La9N3ZVtsXdP5oO8aVTHmKuK+ifiJq47lLy7sq0MmcW+K16yT4QXFCxGZQVnwOslL3S0sXyc0WpPZXDauHpnsJeMV9Fu7M6+4FtcUbnmwIIl87x58duCkkwp83zizUzcsEPNnb4n/aBJgx8jCceTCQv26XvF1gzMuL4CUYwhkcn0eLAFldHqL037R8OfTh8V9wZwX7Vioz0nbl0JiDH/CBlRFL+HfROU/SLckDioQ6Pa5QBFjvyqYHqcMME4Ybxokutg9kmkdgUbboyqxE+Z3d0kAyMq6BGZM286ziINCWQ5/9rPgpsDJjAJCXQOK2yWwS8qdxVkwefkSpIXfyAjyHatm1If750mUYkbjuxehOCQlI75omPb4eXA5rDXPm72/jzecPMzSL6U8BH0nSYQOrI32bAf6mS8CL8x2qmXYf6xwIZAKU+kASzesJeIW0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5232.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(56012099006)(11063799006)(4143699003)(261009223027099003)(18002099003)(10067099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXpIbXBBV3lIejlQV3pNOTBWM1Z0czBlKzlGaGwyYkpHd1o4VjJrVkZ4L2Vz?=
 =?utf-8?B?b2Rmd2VJVWVyUHh6eU10Q2pWbjVUM1hGQ3B6RWJWeThnWGV3VEQ5bVpjUDlB?=
 =?utf-8?B?ZkZ1eXlvVHgzVzJYZTN1MjhoMnovV09oWDRidjhLbEJIYlpOUUtqZWxDSjRP?=
 =?utf-8?B?OUlxU0J0S0djRE9zb0o1djhqZEx1L2tkUHNqVytUbkkwbUMzamVPYkxob1hz?=
 =?utf-8?B?MHJocVhXMVJzc0dmY3kwVWJFU05CM2ZDZnYwT0JMajZwaWN5N3JndE8yRUpX?=
 =?utf-8?B?RUh0ajgrcnFKNGlBWmIveDJFcWV1MDZoRDRHUEN1S0dLUWNhejJ5QlZnWnk2?=
 =?utf-8?B?bHVQZHY0eWUwMkczblU2MjZ6RE5lOGxLTUtjdGwwM1RwbXJ0MXpZT0t5Tllz?=
 =?utf-8?B?ZnVGd2lBYjN6ZmVrRkZ0Y3F4T0puTFh4YzNxcGxjQTJBRzdFTzFEZG1ZV2cy?=
 =?utf-8?B?RHhTYkQxcEo1aVB1STJlZ3VxRWVQSkNpQnhWMzhvMVV3ZktIaC9abmRKWFN2?=
 =?utf-8?B?enNZbkNiS0VuQzllT1FMb3RwdXJGOXR0L1Rzb1VvZ3NsRW8wb0F3VmFjd1Z0?=
 =?utf-8?B?eWQxYXNLamhiTElxRGxBR3VxRTNScTdMNlBFRHFGTlB3emVHS3huNWRWU0c4?=
 =?utf-8?B?VGk2elNZcnJ5YlRpTkVSeDVZOUNwTTJIcldnVURrY0lNL1lPMnhIMDV0TEVT?=
 =?utf-8?B?Um5TeGJRRVM4T3REcmVsSVBqNmFDK0VCS0hHaEtHVzduMVc5cW9rQTVTaFZI?=
 =?utf-8?B?T1hndk10ZWsyVGZiekpGeUFmcXdlTGhVN0E0Y1lqYjdDUmdmQ0Rld21sMGFi?=
 =?utf-8?B?Ry8vYmNsTjdlYVc1YXc4Sk9YS2VIbFR0dGxiT3paTFpUV3ZQYi9aZitqWmtC?=
 =?utf-8?B?TTRianJubDZyTzFJdnlDVnF5Wnk0aVVIZ0d1UTVqUm16SkVSeGVlL1YxNk5B?=
 =?utf-8?B?MUp2Ky8reVBFL2pYand5QUZDYm43K21DbSsxcnNodDlCY2tKSlJNRk9vQStN?=
 =?utf-8?B?UURRWWtMYkNvUllnZ01UcHcrOU50TXhWK3QxMG1ESlhya2RsVi8zTTRXbWRS?=
 =?utf-8?B?MG5aTWgrZlIwYlhxMkEvMW0wVVQ0Q0FxUnlzT1hXT08zVGIyZEFlcHRkZkw5?=
 =?utf-8?B?U2MxN3ordzhVQVRpNTVOZzFINFFqK3ZrbEtJb3BtS09wU21PTlAwSEhLR0xZ?=
 =?utf-8?B?WWZqeTJFZE1DMUN2bFZiTUJ2aW94ejkyTXNrTW8zL0ovS3FuakdlTFdWMHpQ?=
 =?utf-8?B?eTVpb0Qza2ZFVW0weGF1bE4xZWdiYVFmZFNCZXJiWng5bEREdFZkSytFUzFK?=
 =?utf-8?B?S3NNRmpXblVRcXNENGYyZ0kzeTEwNGNjSzJ4aXdVZHJ4anV4S21BR3FNTzFw?=
 =?utf-8?B?amg1UTFDY0tiTHBFWVZCd3A0cXplaFMxRnVyY1hnd3c2UkxiUzNuL3RER1Jy?=
 =?utf-8?B?SjBjekhJSzRWVXdIUWZJZitaVmVwUDhGOSs3b2w2ZWM0UlVseGpkUXN6TTlN?=
 =?utf-8?B?UHBYMHkvMmYrdmNnQlFCd3M1S00vcmNXd3ZzYytSeEl5OXdTSlpJa3dTMzI0?=
 =?utf-8?B?OW5lWlJyVzZqenJpNTVxRDk3UncxR0ZYd2hDenlTQ3JWNGh3WHFTMDh0SWVB?=
 =?utf-8?B?Q011b3E4RzVleHdiVW5wQXRGSnBDUlZzbkZSb1RkMi9waE5FT0lKVENJcmtB?=
 =?utf-8?B?MEZmbjRWZ0RLMXExTmhEdkFtS1lGM2wxUUp1WklOTlpIZHRaS0VzOWFpdjJu?=
 =?utf-8?B?TUlrM2xsbFkySWdrQzRYMlg4SXJPc2k5Y0FMM2puRDJ3WmJDR3d0elZjSGpk?=
 =?utf-8?B?MUFsOFQ4RTZaVUJlVlFYQUtIRURPNGxpKzg2REJ3TjRDOHBmZjI2VzhVSFVO?=
 =?utf-8?B?dGJiczhiYnIvanFoUC9RdEdvRlFJVGhwTEprVVZmNE9UM3QzVWExZjBHV05m?=
 =?utf-8?B?QlVENFZyM0tvUHQvWUVUN2RDTGdWU2taWnlJeXNmSmxqRkJiTFJrZzFoUkdq?=
 =?utf-8?B?c0FGOGhad1BEU3lEVXFsdHBZOTUyZVc4Wno5NENIdzRDV2lxQVV5N3FONXo5?=
 =?utf-8?B?emxSQXY2UEFENFVoRENQai9SMG05Rit2bWlnS1pUWEJkMnoyVkFVY2dJdEVV?=
 =?utf-8?B?QTBhRUNLRlk2UHh0Y0dLOGY3UzQrVzZSRXdCUVM4V0RKWHVXTnFuL3RDc292?=
 =?utf-8?B?VHYza1JmRldWUHVsWlBaOEdwcFNIb1JQNUc4ekhITENXeU5qR3RqSjFMWU9S?=
 =?utf-8?B?Wjh4MGZjMllqdWh0V3lSK2hvQnZpbU5lV1JwU1NtT0x2VlFKTWIyeEpDN2Nl?=
 =?utf-8?B?aUVTMzJWd200a1l5ZEhKajVYbGh2a0M0NndMRlZNYmplUWYvUkszMG1KcXdW?=
 =?utf-8?Q?D937LpwQ6wQkb+4E=3D?=
X-Exchange-RoutingPolicyChecked: R3oyLqmy/vVZR7fq7w0JryqlH76vRaE/0BDN3Ze5UO+qRbbQ9WSa6RghIRxg2K55jg1AoL2TcvKDlZo0jBD/R8gKfpIEGsRznSCbLouvpPimAZuVXKsYXjLTpkXvAR5Gez12BakDOf9bNBMGNGJ/JDeQT0x2GpyUS3HksybmWwcTpSx5D6lVR5uhrmGp18Id0opMN26Omm51wxmAkqVWY5sPdzulNSUxsZO107DZMWQCMKbbEIIHXGy05ytNwv0VIbTt5pHs34VJ6EvyMEGjeStEhUaOLDo83R2uYSwI5yG3ebQ3Km1Tw9IO0N84HqnLNWGZL1Pr1Pbgc5LILvrG2w==
X-MS-Exchange-CrossTenant-Network-Message-Id: fd2f6024-09ae-49bd-f59e-08df295573a4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5232.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 18:11:50.0612 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NoDdLlJjHLPETKGLg7VN1pIM22Gg730tdtfe5a5MSZfPcRIVAkXtZM97UVH2q4tyjsScI/ixE8vZFyR19WT0H//Y7mz9oDyio3OG2yVSN0U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF91320C45A
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


On 10/12/2026 8:17 PM, Matthew Brost wrote:
> On Mon, Oct 12, 2026 at 07:34:42PM -0700, Daniel Charles wrote:
>
> Thanks for taking a look here.
>
>> The early KILL message disables GuC scheduling outside the serialized
>> TDR path, but xe_file_close() does not wait for it to complete before
>> dropping queue references. GuC may still schedule contexts whose page
>> tables are being torn down, producing CAT errors and engine resets.
>>
>> Split FD close teardown into two passes: first kill every queue so all
>> KILL messages are queued in parallel, then call the new
>> xe_exec_queue_kill_sync() for every queue before dropping references.
>>
>> The GuC backend implementation flushes the message worker while the
>> static KILL message is pending, then waits for scheduling to be
>> disabled with no pending enable/disable. The wait also completes when
>> GuC submission is stopped, VF recovery is in progress, or the queue is
>> wedged.
>>
>> Wake ct.wq waiters when a scheduling-disable SCHED_DONE is processed so
>> the waiter is woken as soon as scheduling is disabled.
>>
>> Assisted-by: LLM
>> Signed-off-by: Daniel Charles <daniel.charles@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device.c           |  8 +++++-
>>   drivers/gpu/drm/xe/xe_exec_queue.c       | 13 ++++++++++
>>   drivers/gpu/drm/xe/xe_exec_queue.h       |  1 +
>>   drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
>>   drivers/gpu/drm/xe/xe_guc_submit.c       | 32 ++++++++++++++++++++++++
>>   5 files changed, 55 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 8392c9fad3c48..ffee8951a7b4e 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -190,8 +190,14 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>>   		if (q->vm && q->hwe->hw_engine_group)
>>   			xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
>>   		xe_exec_queue_kill(q);
>> -		xe_exec_queue_put(q);
>>   	}
>> +
>> +	xa_for_each(&xef->exec_queue.xa, idx, q)
>> +		xe_exec_queue_kill_sync(q);
>> +
>> +	xa_for_each(&xef->exec_queue.xa, idx, q)
>> +		xe_exec_queue_put(q);
> You can do the put in the same loop as xe_exec_queue_kill_sync.
Yes, I'll fix this in the next version.
>
>> +
>>   	xa_for_each(&xef->vm.xa, idx, vm)
>>   		xe_vm_close_and_put(vm);
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index 9a8efa2bf2bfb..8ba2cf45694dd 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -1622,6 +1622,19 @@ void xe_exec_queue_kill(struct xe_exec_queue *q)
>>   	xe_vm_remove_compute_exec_queue(q->vm, q);
>>   }
>>   
>> +/**
>> + * xe_exec_queue_kill_sync() - Wait for queue scheduling to stop
>> + * @q: The exec queue
>> + *
>> + * This function waits for the backend to finish stopping the queue after
>> + * xe_exec_queue_kill(). It is safe to call multiple times.
>> + */
>> +void xe_exec_queue_kill_sync(struct xe_exec_queue *q)
>> +{
>> +	if (q->ops->kill_sync)
>> +		q->ops->kill_sync(q);
>> +}
>> +
>>   /**
>>    * xe_exec_queue_destroy_ioctl() - Destroy an exec queue via IOCTL
>>    * @dev: DRM device
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
>> index e8963f85cabd9..4be023b9a4c6c 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
>> @@ -119,6 +119,7 @@ bool xe_exec_queue_is_lr(struct xe_exec_queue *q);
>>   bool xe_exec_queue_is_idle(struct xe_exec_queue *q, int extra_jobs);
>>   
>>   void xe_exec_queue_kill(struct xe_exec_queue *q);
>> +void xe_exec_queue_kill_sync(struct xe_exec_queue *q);
>>   
>>   int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>>   			       struct drm_file *file);
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> index 48c05398b0168..4882eeccb9bd5 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> @@ -294,6 +294,8 @@ struct xe_exec_queue_ops {
>>   	int (*init)(struct xe_exec_queue *q);
>>   	/** @kill: Kill inflight submissions for backend */
>>   	void (*kill)(struct xe_exec_queue *q);
>> +	/** @kill_sync: Wait for the backend to stop queue scheduling */
>> +	void (*kill_sync)(struct xe_exec_queue *q);
>>   	/** @fini: Undoes the init() for submission backend */
>>   	void (*fini)(struct xe_exec_queue *q);
>>   	/**
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 609af66b343d5..36c8c3766f5fa 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -2267,6 +2267,34 @@ static void guc_exec_queue_kill(struct xe_exec_queue *q)
>>   	xe_guc_exec_queue_trigger_cleanup(q);
>>   }
>>   
>> +static void guc_exec_queue_kill_sync(struct xe_exec_queue *q)
>> +{
>> +	struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
>> +	struct xe_guc *guc = exec_queue_to_guc(primary);
>> +	struct xe_gpu_scheduler *sched = &q->guc->sched;
>> +	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_KILL;
>> +	bool pending;
>> +
>> +	if (!exec_queue_killed(q))
> xe_assert(xe, exec_queue_killed(q))
>
> ^^^ This is a caller invarient.
To be fixed in next version.
>
>> +		return;
>> +
>> +	do {
>> +		flush_work(&sched->work_process_msg);
>> +
>> +		xe_sched_msg_lock(sched);
>> +		pending = !list_empty(&msg->link);
>> +		xe_sched_msg_unlock(sched);
>> +	} while (pending && !drm_sched_is_stopped(&sched->base));
> I'm honestly not quite following the logic above, and I don't think this
> is necessary. At this point, we've already queued a kill message. It will
> eventually run, or the TDR will fire, or a GT reset will occur. Any of
> these paths should eventually clear the flags below.
>
> I can see that this was LLM-assisted, and it may well be smarter than me
> here, but I don't understand why this change is needed.

The loop was intended to ensure all queued KILL messages had been
processed before tear down continued. As you point out, those
messages should be handled through normal processing, TDR, or GT reset.
I’ll remove the flush_work()/pending-message loop and bound the
scheduling-state wait with wait_event_timeout().

>
>> +
>> +	wait_event(guc->ct.wq,
> wait_event_timeout
>
> A GT reset saves on the GuC taking a nap but that is unbounded,
> wait_event_timeout gives us a bound.
What is the best action when this wait times out? We have no confirmation
that GuC has stopped scheduling, yet xe_file_close() will continue
tearing down the VM. Is it acceptable to continue teardown, or should 
timeout
trigger GT reset recovery? If so, should we queue it with 
xe_gt_reset_async()
or wait for it to complete with xe_gt_reset() before proceeding?

-- 
Daniel.
>
> Matt
>
>> +		   (!exec_queue_enabled(primary) &&
>> +		    !exec_queue_pending_disable(primary) &&
>> +		    !exec_queue_pending_enable(primary)) ||
>> +		   xe_guc_read_stopped(guc) ||
>> +		   vf_recovery(guc) ||
>> +		   exec_queue_wedged(primary));
>> +}
>> +
>>   static void guc_exec_queue_add_msg(struct xe_exec_queue *q, struct xe_sched_msg *msg,
>>   				   u32 opcode)
>>   {
>> @@ -2744,6 +2772,7 @@ static u64 guc_exec_queue_reset_status(struct xe_exec_queue *q)
>>   static const struct xe_exec_queue_ops guc_exec_queue_ops = {
>>   	.init = guc_exec_queue_init,
>>   	.kill = guc_exec_queue_kill,
>> +	.kill_sync = guc_exec_queue_kill_sync,
>>   	.fini = guc_exec_queue_fini,
>>   	.destroy = guc_exec_queue_destroy,
>>   	.set_priority = guc_exec_queue_set_priority,
>> @@ -3423,6 +3452,9 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
>>   				clear_exec_queue_pending_disable(q);
>>   			}
>>   		}
>> +		/* Publish the disabled state before waking kill_sync waiters. */
>> +		smp_wmb();
>> +		wake_up_all(&guc->ct.wq);
>>   	}
>>   }
>>   
>> -- 
>> 2.43.0
>>
