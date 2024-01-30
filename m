Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FD7C46CD2
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jan 2024 22:30:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0009211368D;
	Tue, 30 Jan 2024 22:30:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C4811368D
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jan 2024 22:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706653805; x=1738189805;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=St5gWLoUg8rIp9SQhgnn/F3tHsQTYarXlf9MOC+yET4=;
 b=CI9LihQBXD61tlOsVMMBPWrGP6k5Th/+Ci6cH3Z1l0TsEUMOlgi1eIuA
 2Kyq5D8gduhIs24GxposepyhUeunm5QBHlnG/uYz1ND77EupWSQeseGqV
 k+Rz0+lCFtO4pVgel+lW3mA4bTp1sXVnbwxT5V5sGpCWku36/0lfX1hq7
 ZqVd/dE09IkKlxta5owR7m2iECaF5B+qqkmGcdStjyw5JH9uE8MwV4IOg
 FWnQb/Zq+VPTmnE1UdPkrCNLOmcKYMhKlSctX71H9UUqlwx3yzDnmr7P/
 Mq20ZrC3Zsg9rHNjFawYR50X2fLvVMVj8KQ91c1x+nKawl0cecNSY1h3t A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="21940119"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; d="scan'208";a="21940119"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 14:30:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="858611803"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; d="scan'208";a="858611803"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2024 14:30:04 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 14:30:03 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 14:30:02 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Jan 2024 14:30:02 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Jan 2024 14:30:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DBbjZqcXGZtJ6NNYIxkWGulQn2ZT2C6NkMDxbQVPX522vAHEACFWWCdMXJrSfrsU55dgx1Op8od59iW+rnSUAlznIoidoTaS1Q2fo/QAwB+VaxmZkLp20SICWSxmat3i/8PsQEvsaxYow2gOVWVN/cNqf/ud0xD2MM/vrOskt1I3yo11xu7bCKB6ve2YFSqD/i47sT5r8LjSGjvITWgXJ6mfi22hOt00RUlRSAFmG59ueXl8mYN4Q8z84JvzCseHXD2fxHBnYKaUXZbymN9/cBGygN3he8DB902+kghyYqsFZO6lC1E0xKSoQWicWEmO+rEh/bMtbG9aXhQ9FqlrUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S6jkT5vzwZth85R0B9ITtRUdJ5Ua33lwA4+k8gZNbZs=;
 b=NnHytm4+aTwjKY0IplC4yNk/C3EopFDSPYp2ZC+DojIQmHiemDx+U45C32oL1SmppEGRzcJt6+DcWYJUPbY9KYANID6cA/UJGw/Q67Kdw83vN38IYdsdnaLUmlzziBHqpCJNPgX3ssG5powXvI/fraCEMcUEU/rAI35CvkQgC6xJKRqHAltq0d0eCu+KfkrKQ1e5ny+ju10/TF5AlqJyayRFTEIQElwrOiKbygcR5EPvUIGLlNBs8MpWv6UVDOMnC4uBqUeYmgMDwgZYP13ecyJtmr4gKAXpoEzMd5ERZfBxGht07St7e0+CC7kFxAewiMcLfo6DNTdeoteyoobAWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SJ0PR11MB5040.namprd11.prod.outlook.com (2603:10b6:a03:2d6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Tue, 30 Jan
 2024 22:29:55 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::c138:faf0:9fa7:8a03]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::c138:faf0:9fa7:8a03%7]) with mapi id 15.20.7228.035; Tue, 30 Jan 2024
 22:29:55 +0000
Message-ID: <4b55db9c-be61-44d1-b9a8-6585be00598c@intel.com>
Date: Tue, 30 Jan 2024 14:29:55 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/xe: Remove ci-only GuC FW definitions
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20231219200023.2502159-1-daniele.ceraolospurio@intel.com>
 <85h6iubriv.wl-ashutosh.dixit@intel.com>
 <b54fe849-bf9f-4000-b695-069bb3c25b70@intel.com>
 <85eddybhf2.wl-ashutosh.dixit@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <85eddybhf2.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0152.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::7) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SJ0PR11MB5040:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d9e5c2d-1334-4356-5291-08dc21e2fbda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P++bDxFZMt8/jjQZAYfoIkUo1ycQbprWx6uqgS43K0xihq2A9xBZhMq73K6yZXFVQAUMYsyxGofWIx/CWVyJdHa7aw26V0pTP72zYH0UR23k9CSigcgIwDH0XPjOqcPm3ow5/jKUipK0OKFPIy6+ykQdySwgh+7SXZOGHfK1jTMrPuRj5pJW1oQtYAOZtaghHQQWiD1C2Qtnw3frH9B1qZYLu6b57QKbkqA5hOFMFhPY5DP/yrCuP2PdKHEy1tS4PvoF18YQLYFRtDqEvronrlmkeovuNHIsvUAFnXoZKZYKVcWxmy39CjbJ2s4IiGZZVoq5KRoKgYMP2rVXWLZRKCoV0buxEfc3Jih0/7BFXdaeeDgX/9BhWKgbMTaVzEbuUcGqhYGH6xdb4XmH9hjgVlN9M9zR5yuR+daPYqo5vFNhlUa8vq31Ijq6XzMTkCrFwNoGkjjnY0pLxlSsQYIOAWDb0UT/oguBjpQUnIIYODYXjElvfrpee43cUisinXTRI6TgSbcI8gTa8ErWfILqKAK65A4xP5CXskJEBSYPiuMaLJ8c8sY/JIKhL+RV9El891E+riZYDKUmUsaG3MmleEm+81bq4TB3stp8D2M+csS0WrNL+daEsC8/zLCveIZ3BSzkrpSZ08mNhMW0gH7DPA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(39860400002)(136003)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(4326008)(8936002)(8676002)(66946007)(5660300002)(2906002)(86362001)(31696002)(37006003)(66556008)(66476007)(6636002)(316002)(54906003)(478600001)(36756003)(6862004)(82960400001)(38100700002)(6486002)(53546011)(6506007)(6512007)(83380400001)(26005)(2616005)(107886003)(41300700001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTdscnJlZ2svSkVURWtqMzhJaGxEWUdiZDFCR2xrbGNFVHVoTUVQU0c5RFYx?=
 =?utf-8?B?R0ZZZ2IxTHNuTHdub0IwN2lUa2xTSzBTbEthc1h2U2dVV3lVN3h0S0VVa3Jr?=
 =?utf-8?B?Z0V1a0Z4Q2tadVZ1ZHY1ZGV4K0pnaTFJb3VoTGJyLzdCZFRNWU1VT1k1WVZ3?=
 =?utf-8?B?VnNyb0ZWM2tvc1hCbjlFK2lmaXMvTkd0emtzZUhPZzJzVDNRNVhvcjZtQmto?=
 =?utf-8?B?cERuMVpLQjhGUWZ1ck9yNHFrM28xMlVRMjFRUzdobjRieElHZmFIWDZla2RB?=
 =?utf-8?B?bUZwRWJIYjQ0NzhlU1Q0bHVRUm1QZGhTNnVXY0dMOExhNVhWMW9TaVpBVXhr?=
 =?utf-8?B?cUVGY3M4bEJ4a1d3ZkN4QnRvczJ3dU42UHNYbmdZb0ZFK2dhemNLelNGV3Q4?=
 =?utf-8?B?VHZoTzJDNjJmNzZIMmR6ZTJwZno2Z3FUa3M4bkVCMVc2OVNOaE42OUROTHUr?=
 =?utf-8?B?aGd4Q1lmRDNhdmhVWVl2QjVCUndLY1MxUnZnMHRmWkRNRlMxZ3pwcTZDQ1cr?=
 =?utf-8?B?QStnQkpoMDJXQW4yTHhvQWZTcDB1VEVGWFh2dzVUOUFiaTY0RHNYbXcrU2ZQ?=
 =?utf-8?B?aCtJSTNMWXRuR0lZMjVXdC9zbWpyamI3K09jYlRhRjBmL21acnhjdmFrTHhZ?=
 =?utf-8?B?dHRmaUx4Wm9ac1N5R3J4VUpEZG5BNERtT2tFTEpMT3ZCMUNORmN3dGJvaVFz?=
 =?utf-8?B?QlZIeXl0aUc3SGttN1Y4d2x2Tmdpcjl3Q0RsZUNtVmw1enJ3UXZ1QnFOVk1P?=
 =?utf-8?B?MFp6VnN5YWtNNzNYWGdUMjdyc0FncHEyZHh5T3QyY3o2SUllSGNKYjgwMldx?=
 =?utf-8?B?Y2ZnU01nSSt6cU50UndhclpEblZhQmNBTU4rSkE3SmVGcUwxczFwdGVRWmVj?=
 =?utf-8?B?ejNoMlZiVHRVZ2ROaytiaGpzcHZQSGhNR29oVHl5QU1vMU1hM3ZMWjdQaUJW?=
 =?utf-8?B?ME5TYUZZbmN0WllKWjVGdFdyOUt5cElyMTRlQnl4MjEyVno5bXZwZER0YVpo?=
 =?utf-8?B?dy9QblVhaFN3UnAvSEFFNEQvU3JmNW90UXBWSE5YMU5oZk1LQURkMGRnQ1BR?=
 =?utf-8?B?UUllWnYxNFZoOXZtdVM4OGdUT1BEM213d2ZwOWlQbHRNOHdIQkpDYTJKVCtG?=
 =?utf-8?B?NnRxSy9RT211UVdiVzdQaWxYN3BaMUlQV2Q2SDVNZUJKSEpxTTd0bUdHZDMz?=
 =?utf-8?B?M2hTR2E5aDZ4dDJoeEZNQWdWd2d1V1F0a3VUbWt4YUs0cVJZdUlLUmhQRmp2?=
 =?utf-8?B?Vm1Nekc1bHVOVkdPYWtHQVFqNTRpZVdJSGtzdkdRMko5bERSd1FXcTJkVjNJ?=
 =?utf-8?B?SlQvazJNYkk3VGx3eDlZaVR1ZTVoek9tckxST0xpYzFyeGlHNFVKSlpSd3Vs?=
 =?utf-8?B?VklZTnVvSStrMTYyK0ZDcElacGIzUVRlcHcrVTBOMEVZYUtvaHVKa09WNVF6?=
 =?utf-8?B?YWRGWTFrT3RUSzFUalEvODB1K2UvYXBITVc0K2x2T0dGM1JMYUVrOXAzaGZn?=
 =?utf-8?B?aTB2NVFHTlp6MFZtUUttQkN6ZW1RNitlTS9uSy9NZFNzclJOai9UQXQybnlr?=
 =?utf-8?B?QzMvWFV5Vk42cTZXL2h2RHIwNTc1STl0dTZ2SDUzdGFuUG1sUDA0L3NUVU1h?=
 =?utf-8?B?UHlGSXArLzN4MldFN0RIZFU5Wkhvb2Y0TWVvY09qbXUrRXpaZUNQWXYrUnBT?=
 =?utf-8?B?N3lUOXZ2c0ZKTXdWMlhYR0owdGtNWFJYUWRHV2ZyLzBGYmNraVZLU2JJMEZ6?=
 =?utf-8?B?MDI4SitjbmZCTC82NDZmem1LNlJTaWpMenRoc243ajVCWjUrWVlZQUd6bGpX?=
 =?utf-8?B?VWFXc1NFZDFUZ3VtRStMcTJEVUpsTGFRQ01FQ0lMSFdycXR3bld4Q21Cd1JI?=
 =?utf-8?B?TElmTHpoWVZpajM4NUsvRHRGVWI0V3lKenZPRkE0NllqSE91ZE9PYU9SNEwv?=
 =?utf-8?B?cFNadFBySWxtOW1XTHRicHQ2K2t3RUNTRlM4REZpOHR5ZjZXZXJoS2tITHhn?=
 =?utf-8?B?U0dkVnV0aWErdHU5OXBGVzZVaTgyc1c5YVpxY1N3dDIrVjUzU254MjhhbjhF?=
 =?utf-8?B?TFJEUDliSk5ZekwwNU5xQXNLaVpXLyt0Z00yTzZpZ1plVnRPTHpZclFUeWZO?=
 =?utf-8?B?QmU3a055cXFLTXZSVTFBUS8rQkhSNFByV2x6SmV3ZDMzZ0JRVEFzalFQOTZt?=
 =?utf-8?B?dXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d9e5c2d-1334-4356-5291-08dc21e2fbda
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 22:29:55.2580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sYe1cljHUZ6vbab6Qv2v865ohvE21j8ToGvl7KYLGJY+ZFkx4xTvhOXj9GkSusKxJsWVkBeCSCgkR2j8ol8bIgn9FWLOpIl0WQRO6i60Alc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5040
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 1/30/2024 2:11 PM, Dixit, Ashutosh wrote:
> On Tue, 30 Jan 2024 10:48:50 -0800, Daniele Ceraolo Spurio wrote:
>> On 1/30/2024 10:33 AM, Dixit, Ashutosh wrote:
>>> On Tue, 19 Dec 2023 12:00:20 -0800, Daniele Ceraolo Spurio wrote:
>>>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>>>> index 73d6938c921d..9dff96dfe455 100644
>>>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>>>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>>>> @@ -102,9 +102,7 @@ struct fw_blobs_by_type {
>>>>    };
>>>>
>>>>    #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
>>>> -	fw_def(LUNARLAKE,	mmp_ver(xe,	guc,	lnl,	70, 6, 8))	\
>>>> 	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 7))		\
>>>> -	fw_def(PVC,		mmp_ver(xe,	guc,	pvc,	70, 9, 1))	\
>>>> 	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 5))		\
>>>> 	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 5))		\
>>>> 	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 5))		\
>>> I think this commit should include an error message saying FW not found (or
>>> whatever). A lot of people have spent a lot of time because probe just
>>> fails with "xe: probe of 0000:00:02.0 failed with error -22" without any
>>> indication of why?
>> There already is a drm_notice for the firmware fetch failure, in
>> uc_fw_request(). Are you say that's not coming out in dmesg?
> Because from what I am seeing, xe_uc_fw_init() is not failing, xe_guc_init
> is returning from if (!xe_uc_fw_is_enabled()):
>
> int xe_guc_init(struct xe_guc *guc)
> {
>          struct xe_device *xe = guc_to_xe(guc);
>          struct xe_gt *gt = guc_to_gt(guc);
>          int ret;
>
>          guc->fw.type = XE_UC_FW_TYPE_GUC;
>          ret = xe_uc_fw_init(&guc->fw);
>          if (ret)
>                  goto out;
>
>          if (!xe_uc_fw_is_enabled(&guc->fw))
>                  return 0;
>
> And finally xe_uc_init fails, not because xe_guc_init fails, but because
> xe_wopcm_init fails :/

Oh yes sorry, it's not a fetch failure, it is a "fw not defined" 
failure. This is a bit more tricky, because the fact that the FW is not 
defined is used to mark that we don't support it yet, which is currently 
not an error (a lack of HuC or GSC is not fatal, so the common code 
can't throw errors there). Maybe we can add an extra check and print an 
error if force_execlist is not set and we don't find the GuC FW?

Daniele


