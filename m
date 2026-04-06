Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB6A8E9D831
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 04:46:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7527510E06B;
	Mon,  6 Apr 2026 04:46:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FWJWDQYm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B5810E06B
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Apr 2026 04:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775450788; x=1806986788;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LSmol4L6Zo5T0crYphxVVbPFE48B6KPCYgWhpx6VT4o=;
 b=FWJWDQYmcAu/9R8JTQ+HDVXNPJjZQH/IqapgfznN1nRA/5SCM5/IVSlq
 +6KjCB9QSHTrHXtZE+m7sD4i6QPYW2w75ei80nnJXXBR6jZvAMbyDEFjA
 Wq0UiPC8lJTppLFXBXxhxQgxD/2uB9voNf2XZtX46f+r+qaRsNx0Vf1FZ
 YP3HCnUPAZdI3qg0rK7zTZX7IVPW4t2HipkN0ptk23dPJWaG9Matr3BRC
 /q54XJYUMlTIjfTPB6EPTVgNR80o7lh1fZ6djKHvh4kczMsupOiG/L1sg
 m/iUsFELkXoQbYOtsnxudWOgVWsJQrIISIiSvOoEWWcsY1x7RpCdfyoQJ Q==;
X-CSE-ConnectionGUID: X2iTUVJGR0ygbj65ZtRpag==
X-CSE-MsgGUID: 5bnLZQDfT/C6cZXZ4PD4IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="87793386"
X-IronPort-AV: E=Sophos;i="6.23,162,1770624000"; d="scan'208";a="87793386"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2026 21:46:27 -0700
X-CSE-ConnectionGUID: h3V6TbJSRs+Wd2QHDj3b/g==
X-CSE-MsgGUID: RN4jM2ZVRYWWLYSzjl33Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,162,1770624000"; d="scan'208";a="226792056"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2026 21:46:27 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 5 Apr 2026 21:46:26 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 5 Apr 2026 21:46:26 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.29) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 5 Apr 2026 21:46:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eht+8GX10f8pEIDM3v3Ad2G6pJmTVDZ1qBG8xarkhu20/aOKnCohvZmgS1N2L+jOjtvV89996kaoDiium/lTj7CDOglQe3WJrwj89j5MzEyeBGmIzHrL8+Iuzd2thr3DpA/XG2V+bn4ku/ydCe9+EN6h0fRVKUbqUUiOJmZOAObBR7wIW5pIz7MXKb8J3lXH6yCoc3axOr5B3prV15NcA5HkAjI20xrvf6sjEo6w81yGgJi7jV0NB+HIDuLCGURK19eTYzAkWoKVsRrQ+UBlkLUPUCw8ZPVjBRQF31LjjC7nFGWYKia9a4127lCNKHQE48XMseLckRnHQX5ltaXWOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UXza661Up5Q+yPme7nJ+pCW62sk7oj7Lq6UgetY+NIc=;
 b=laHrnIOHuqwKWSET+qHExyJYgLMEXt/xj+KK9NPwU1muF2kijzH3fkbALAFDYPzil2nENqXTPXP0U/EQj89CkXSAaVewSkJwUILHYaTH1NyqLcAep9J3966n3GNnvwELjz58ay5zEIFkOwDs/DeAAKkHG/SgEAjioZ/mAdKGwehf9F2S6KtMU8KGHe88919EeFQUR89zUeHvA9/2YkW609ydBN9CXR3H2sLbU0VBbklRnfCRNe2L99DBHLfACEVnlUuECRvf+VDwY0ieKcDuYyQ0CSB67oKwu18EZYyjntY+3ke+rCkV+RrFhs5VkVXPd0c1q1/Q2MlUxgJrrvS8vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH3PPF67C992ECC.namprd11.prod.outlook.com
 (2603:10b6:518:1::d28) by CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Mon, 6 Apr
 2026 04:46:23 +0000
Received: from PH3PPF67C992ECC.namprd11.prod.outlook.com
 ([fe80::9e01:c158:3b1d:f93a]) by PH3PPF67C992ECC.namprd11.prod.outlook.com
 ([fe80::9e01:c158:3b1d:f93a%5]) with mapi id 15.20.9587.017; Mon, 6 Apr 2026
 04:46:23 +0000
Message-ID: <eaf6627b-2689-4c07-9dca-7d7ee575d517@intel.com>
Date: Mon, 6 Apr 2026 10:16:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 01/15] drm/xe: Add xe_usm_queue generic USM circular buffer
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <stuart.summers@intel.com>, <arvind.yadav@intel.com>,
 <tejas.upadhyay@intel.com>
References: <20260318074456.2839499-1-himal.prasad.ghimiray@intel.com>
 <20260318074456.2839499-2-himal.prasad.ghimiray@intel.com>
 <ac2N7WrbfaInoIjk@gsse-cloud1.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <ac2N7WrbfaInoIjk@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::19) To PH3PPF67C992ECC.namprd11.prod.outlook.com
 (2603:10b6:518:1::d28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPF67C992ECC:EE_|CO1PR11MB5009:EE_
X-MS-Office365-Filtering-Correlation-Id: fd2dc828-a971-4518-1d4f-08de9397742f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: TRpev45yGSclHTUclYhLwZ2HeBprEmBpx3qvm7PBjgHTolz+xSwaAkvOqAWYkXTx9VPPvNG7UY5uysrJ5lD8evBJaK4lO3mgBeeOLoBBUh10PZNr7SU8yJyO/PhoBBgNwfAKoaEJDFTEApC3wtpVOe6IRLzuO89SlJFTwq60/8l1yaYhvTN2jdrC6gqA4GAtwYGT2r/qemPLygYeAwGF2OHTzsBL2s4JmINEKvO9EKjJM6XXm1ya7YxYDuk7Vgv7nxIywDuF7F1vX9hGsOhhThs1+tBb3IuhzjXVSuFrBw4ZHSVjV5Lxb9Ce3B1MlfywdNDmj/wYQI5HFGlnbxqyAuH0dR0pLHUfB+kkHFuQRLE3lIUsui/Ms6NEfmZa7TY23b2RN+TMmnhTqHUqDDqpnBtm66AP3YWgh4n1uCQErlx5pklBGtDyo4JmcF718+2N6W8rcnLN0R2Tke60LeLA+Y5/gdU/oikb8D0ULwGkzUohJI9atMggtNgPWpLj8UPEg3eyCDfxeOelrJEmc8pVr1SlYkcERySSKfIUUs5Q2t01PCtF9nMCnt5hXfRrf8unFV7USpqpJxNdwu64AMgNtvsgyVQ7DumshcFAC6S/uLO0I0Kk88iVY7E4BBbpX+7HgHWpN7f7qtShjydnMWl2wkSvfADlWGIfLsJ0YBHzVXPw4Y7iSu7KnnlMHi+REQfD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH3PPF67C992ECC.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUkva202MXZLYm1pRHhHYlFxLzZGTEVUclYrR2RwNzlBZ1M0czI0RERiem55?=
 =?utf-8?B?NGJRc3BhYWJITEVBMm9kZjQrczlndjBCRkQyYlMrMGd6WXpVN3RHVG5DSjZK?=
 =?utf-8?B?NUNSYzIrcEhDNlJ5ZnRRbGVYOG85L1BheXkyVnB0a1B6Y1ErNTJ2SHVqSU44?=
 =?utf-8?B?UUU1azJIMWlOMEduZC80TThPcUtkckp3S3cxYlJVYThvSng5SU9GaGJ0alpU?=
 =?utf-8?B?SkdtOW1VK0d5Mm5YcVNnQWNaSUNrblJJOGhJQ3dseXl2S1dKelRhVGNyZTZ6?=
 =?utf-8?B?cUhnbjh3Yy8vUGh0YlJyY0lobkZiU3Rka1R4cmJIa3QzQ3FiWUJBWm43WjFZ?=
 =?utf-8?B?djBWWW5YUXI3TzRMOWMyNmxlZWp4QzkxUjhNNmhwaTJSWmZVeVBncld4UUhT?=
 =?utf-8?B?Z0N1QjJKTXBmOGpOVXlORXBVNGZSOGVrVlBhUFdseVlxL0QzSkhDRVlnYVRR?=
 =?utf-8?B?M2xEU0w0a2NvOVZ0ZXh1TEpZVXNQZEVCSm1oTlRpNDJlZ2U2Ujl4OU1SZ29J?=
 =?utf-8?B?NnhDdkJaWHBiSmlRY0hDQWlnZVRFWjVzMStnNTRzQWQ5dXNDT2d5Q3RnZTlB?=
 =?utf-8?B?Vkt5Y0s1WXo3bGdsZWNycmxlTlNIeXBkTFFnanZsTVBlSm5NY2VTSS81SmEw?=
 =?utf-8?B?bFNPd1hxQndSam1uTjI1M2dQbDJoSHFEN2pueEZ0QmNTZGNhMXBTcDFDd2FW?=
 =?utf-8?B?WjY2MGFtOEtUdURwL20zSEM3ajJYU1Q0Mk9wcDFheFhQNTJMd2VkbzZ4cFpv?=
 =?utf-8?B?Mk5Oa0ovcUhHMGk5QWU5bkFCam1KbCtWV2IyQndPMjQwdmgvMU1sV0tOc1Vh?=
 =?utf-8?B?bEk0ZFdKZ2w5VHRZakc0OXluQ1R5cXJyeXFteXVQL0V0MHFnMlEybFVaTGVl?=
 =?utf-8?B?eWRsNWhocC9CazRCMWY5Q25QdHRBaDliM1UxYWRsWG9MSVE4aFJsdCtBSjRB?=
 =?utf-8?B?QndvSkl6ckxhaVZva2ZMVTRxZ0FXZkEyZ3FMbzBESjVqN3hUS1l4NjREVU5l?=
 =?utf-8?B?R3ZpQ25XV3RnaEJvcXByMnNwa05YVXdmZnVoQW5xVG5XQk51WFhiU1NCd1JB?=
 =?utf-8?B?ajFqVjc5Z3dPWjV1aE03SXljZUhiMzFvbWlzN0wyZFJXRmRLQUFEOE85aHdh?=
 =?utf-8?B?bU9oLzZrQ2ZBRWY2QjIybzN0ZmRHeUVjOENTem4wNUIvMVBRakY0Y0ZnYlA1?=
 =?utf-8?B?MmpBdlVZTzBOZ1Bld2l1THp2ZFJTanJ1c09zM0NOTTRpNVhqQXRROHpGazNI?=
 =?utf-8?B?ZmVyKzVsOFgyd3JCS211SkIxOE5uZmJaVDF5bkFqK3ZDYmNKMy9WVTlJNUpB?=
 =?utf-8?B?Q2FHRHg4WHFuUWJlMHNvZTJ0U1paQWVkbnRvaXpZOXdYcC9lM2dZZ1VxY3lr?=
 =?utf-8?B?bEZRa0VJRSsvUFVQWjlBS3JETFVKNkpSMnZjYjZVblJENDFmeWROV1o5Q3Rp?=
 =?utf-8?B?TUdwejI1NWNxcWpRR09VSUlNWFpPbmJOVVNRSGppNWp4cmdtTTQrSkpIazRa?=
 =?utf-8?B?MnB5czA1Wjl0MFJXc0haVjJtcTlJWHR2NGI4dXVSSzEzSUJ0WTNQb2pTaEd2?=
 =?utf-8?B?Y3hGc1NoQjd4NWxjVk5xdVRjZDFPTmRhNW1QVnZicUIvZWd5VFlTSG9HVmh1?=
 =?utf-8?B?aDhVd09BN2M0SE9pUmtranZVSGhQd0VQc2FqVjZDWGRFL2t5ZEZzSmxDbFcw?=
 =?utf-8?B?L2dXeldTV3VmRk1VUGxma1Jwd1FVeU5qZ3dWSkFkbXhNanpHb1lMUWZ4bTQw?=
 =?utf-8?B?d2cvcFJSS2MvNUpETWFMVEdSWTNrbTlpYzlXenhnNWxlVVBaUjlSQ3dyZGw2?=
 =?utf-8?B?NFFSUTJNOFd2YU5sUXRQYkUxSzNGSk0zbk1SNjNaUG14VU5pb0tmM0NuRmRw?=
 =?utf-8?B?ZXZqeTliTHREd0xuTUhxSFd0M0NKVmEyQzFwT2RWd2NGYUtpcVdsbThxWW1r?=
 =?utf-8?B?Nm9jZktqLzlNQWZ6ZHRaYTRybGVNL2ZFWXYzQVVHYmhMK0dscVV2cTRRdHRS?=
 =?utf-8?B?UnFNRmdtcGJkS28xUVpWbCtab0RpV3EyUFdjWkRVcVhWa0gwbUpPQm1td3Vy?=
 =?utf-8?B?dVFXK0Roa21mZ3p1U3VqV3JSbjhRejNnOUNYdll1M1VyZFdXc1hGVkd3cVJt?=
 =?utf-8?B?d3pUYkRyR1ZTSk95dmJUQ3orbGZUS1gwdTcrUWhLeUxKd0hKU1d3RU01R1l0?=
 =?utf-8?B?WU94QXU4RG5VVHdPVTR3bFJmWE5GT0ZSSHBadEJuNi94SFpBcjA1ci9iU2lZ?=
 =?utf-8?B?U2wvYmdiUE1zZVNKN2NPYWRFUWVCa1NYYXJ6bWdVNnVWTy9seWlSY0kramE3?=
 =?utf-8?B?VHpEaWZCaW9QMENBdHR3M0VrTGJvRitkYTFhemUxUmg0YWx2ZEFpREkvdm53?=
 =?utf-8?Q?+YLDHsXLXCQ0+vKM=3D?=
X-Exchange-RoutingPolicyChecked: XcpWGwxNfVj4YbqqawVPMoSPICR0bopmKFN+aroMTbNz8WxQeBDBN39zSzVJkFO3v24L2Wo3/c3neTaVpfL33wpXwByFmD0wfoFWxagdfYaW1NSy/hl+aTpW9s0Gu6C182kZzV76COSON/xgY3i3S97NaLmiUsAHox28wgOfM7gVyX2b1ylsFbwYI7sPY3d8XQQblCK81YnWaYHAVHxoLbkszqtRT4zaz6wcpKXe0DOqGnlfRxJGvJhTIscZ1gDn3m3wv67VKv9+OiagEoWynTpC/QLWmkMD4Lj2BS+Jyade9ej2CNdoBouGY77gvMoT8qb8+Sdp1W/iwNW27BsePg==
X-MS-Exchange-CrossTenant-Network-Message-Id: fd2dc828-a971-4518-1d4f-08de9397742f
X-MS-Exchange-CrossTenant-AuthSource: PH3PPF67C992ECC.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 04:46:23.5471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VhsYON3bjnLN9UhaAWz8pfEAj4aU1ouiAnPVhoTvUFx2y39OsnQCHPnZNITcNyrRuGpa8Ha+IbVu5Xlkk2DMtNFrXGue61d7Fl+A2wJxG64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5009
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



On 02-04-2026 02:58, Matthew Brost wrote:
> On Wed, Mar 18, 2026 at 01:14:42PM +0530, Himal Prasad Ghimiray wrote:
>> Introduce struct xe_usm_queue, a generic lock-protected circular FIFO
>> used by USM consumers (page fault, access counter) to receive fixed-size
>> entries from IRQ context and process them via a work_struct.
>>
>> Provide three inline helpers in xe_usm_queue.h:
>>    xe_usm_queue_full()  - CIRC_SPACE check (caller holds lock)
>>    xe_usm_queue_pop()   - dequeue one entry (acquires lock internally)
>>    xe_usm_queue_push()  - enqueue one entry (caller holds lock)
>>
>> Suggested-by: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> 
> I think this is useful, but right after I suggested it, I changed the
> semantics of the page-fault circular buffer to be a single buffer [1]
> that multiple workers pull from. This eliminates HoQ blocking (e.g.,
> five access events are pushed; the first one takes a really long time,
> but the other four are much faster—yet the fifth event gets stuck behind
> the long-running one). So maybe start with a single-queue +
> multiple-workers-pulling design here? This likely matters considerably
> less than the page-fault cases, but overall I think it’s a better
> structure.
> 
> Also, maybe the xe_usm_queue can be reused by page faults, but the
> management of that queue actually gets more convoluted in [2] to
> implement the page-fault cache that greatly speeds up storms of faults.
> So maybe drop the second patch in the series for now to avoid conflicts,
> and if we can converge on a shared xe_usm_queue implementation later,
> great..

Sure will change this implementation to support 1 queue : N worker, and 
will drop patch 2.

Thanks

> 
> Matt
> 
> [1] https://patchwork.freedesktop.org/patch/707293/?series=162167&rev=4
> [2] https://patchwork.freedesktop.org/patch/707300/?series=162167&rev=4
> 
>> ---
>>   drivers/gpu/drm/xe/xe_usm_queue.h | 100 ++++++++++++++++++++++++++++++
>>   1 file changed, 100 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_usm_queue.h
>>
>> diff --git a/drivers/gpu/drm/xe/xe_usm_queue.h b/drivers/gpu/drm/xe/xe_usm_queue.h
>> new file mode 100644
>> index 000000000000..5dc2d692d8bb
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_usm_queue.h
>> @@ -0,0 +1,100 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_USM_QUEUE_H_
>> +#define _XE_USM_QUEUE_H_
>> +
>> +#include <linux/circ_buf.h>
>> +#include <linux/spinlock.h>
>> +#include <linux/workqueue.h>
>> +
>> +/**
>> + * struct xe_usm_queue - Generic USM circular FIFO queue
>> + *
>> + * A lock-protected circular buffer used by both the page fault consumer and
>> + * the access counter consumer. Producers push fixed-size entries from IRQ
>> + * context; a work_struct processes them asynchronously.
>> + */
>> +struct xe_usm_queue {
>> +	/**
>> +	 * @data: Raw byte buffer backing the queue, protected by @lock
>> +	 */
>> +	void *data;
>> +	/** @size: Total size of @data in bytes */
>> +	u32 size;
>> +	/** @head: Write cursor in bytes, moved by producer, protected by @lock */
>> +	u32 head;
>> +	/** @tail: Read cursor in bytes, moved by consumer, protected by @lock */
>> +	u32 tail;
>> +	/** @lock: Protects the queue head/tail */
>> +	spinlock_t lock;
>> +	/** @worker: Work item scheduled to drain the queue */
>> +	struct work_struct worker;
>> +};
>> +
>> +/**
>> + * xe_usm_queue_full - Check whether the queue has no room for one more entry
>> + * @q: queue
>> + * @size: exact size of one entry in bytes (sizeof the entry struct)
>> + *
>> + * Must be called with @q->lock held.
>> + *
>> + * Return: true if the queue is full
>> + */
>> +static inline bool xe_usm_queue_full(struct xe_usm_queue *q, u32 size)
>> +{
>> +	u32 entry_size = roundup_pow_of_two(size);
>> +
>> +	lockdep_assert_held(&q->lock);
>> +
>> +	return CIRC_SPACE(q->head, q->tail, q->size) <= entry_size;
>> +}
>> +/**
>> + * xe_usm_queue_pop - Pop one entry from the queue into @out
>> + * @q: queue
>> + * @out: destination buffer, must be at least @size bytes
>> + * @size: exact size of one entry in bytes (sizeof the entry struct)
>> + *
>> + * Acquires @q->lock internally with spin_lock_irq().
>> + *
>> + * Return: true if an entry was dequeued, false if the queue was empty
>> + */
>> +static inline bool xe_usm_queue_pop(struct xe_usm_queue *q, void *out,
>> +				    u32 size)
>> +{
>> +	u32 entry_size = roundup_pow_of_two(size);
>> +	bool found = false;
>> +
>> +	spin_lock_irq(&q->lock);
>> +	if (q->tail != q->head) {
>> +		memcpy(out, q->data + q->tail, size);
>> +		q->tail = (q->tail + entry_size) % q->size;
>> +		found = true;
>> +	}
>> +	spin_unlock_irq(&q->lock);
>> +
>> +	return found;
>> +}
>> +
>> +/**
>> + * xe_usm_queue_push - Push one entry into the queue
>> + * @q: queue
>> + * @in: source buffer, must be at least @size bytes
>> + * @size: size of one entry of in bytes
>> + *
>> + * Must be called with @q->lock held.
>> + * Caller must check xe_usm_queue_full() before calling.
>> + */
>> +static inline void xe_usm_queue_push(struct xe_usm_queue *q, const void *in,
>> +				     u32 size)
>> +{
>> +	u32 entry_size = roundup_pow_of_two(size);
>> +
>> +	lockdep_assert_held(&q->lock);
>> +
>> +	memcpy(q->data + q->head, in, size);
>> +	q->head = (q->head + entry_size) % q->size;
>> +}
>> +#endif
>> -- 
>> 2.34.1
>>

