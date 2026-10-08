Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D8C2CA6007
	for <intel-xe@archiver.kernel.org>; Thu,  8 Oct 2026 06:16:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC3A510E771;
	Thu,  8 Oct 2026 06:16:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YXnYPWwt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 662B010E771
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Oct 2026 06:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791440201; x=1822976201;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=pcbdZEaGEYFc2+RUvyN+PL9iwqka/xGybGa2Pehr34c=;
 b=YXnYPWwtnDiUuH48hl0+Dxc/zLcYp99LlWP8M0zZJH9t+7SW1mMR4Bby
 7ZopV5B1P012jVGxEscZEFfVbZEGz71Jst5jnIedlJ3tSo4kIu7yUwcxi
 4kw4rswlmR/Aak5G4EN2aPUcKanICEOYNfODh3NoyGbHlpNFSTHvlY1lG
 ZIB9Xw83za3vmSq3m1fcyXwB3TcVG7xjQ/hH9JrRG8+xo+gop+JeskRg7
 gFrW90gP2LEtsfvKlTmHpmCQfgo1zT3OtMh4EmidOqWC3oDXEwH1w1iuZ
 ENUZH0SzcQA3SUuLoQPynTl8uVz8O5oY26bwcD/1rkTCxNu8r1SirjNO6 g==;
X-CSE-ConnectionGUID: 2ZDcMfWaRRuxpAvvuMBMbQ==
X-CSE-MsgGUID: HeEUPIpFQP6gnOg/pAMdUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="233170"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; d="scan'208,217";a="233170"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 23:16:40 -0700
X-CSE-ConnectionGUID: TG5qimTYSmq25vaHgrpTrA==
X-CSE-MsgGUID: dIVcTfe/RhKKJeTuf/OiJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; d="scan'208,217";a="38016"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 23:16:40 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 23:16:39 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 7 Oct 2026 23:16:39 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.54) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 23:16:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n3pj5nk7kUTz2eFB40JikCPAATNc5uWbMF7YDM2YEGdga1gCBYtPbNE++AVGnStKyKdbIongb5T5A3l+WDoEG9PTGIToKyGXBBhXmL8s0t4a97j32nV7+4SCO2Udd+YsigYxrNUu/BOvcV/cGXidU86Pf8acZxuX7p2sm8pT0hE4CDBrkdw5Ytqoz1LMBluuFGbtV6u0O+lqtj47Ao6TGlP4nvarj2vKl2/os+PRqSPR3NFVL/qsp1A7siu4a9HSCm5r4KEIy0//vAIaonvvx0SuciwWS2DRjP8gTkjwOEAhTUCvEn3BdF0QNr+a1pxlJR+9CRESFkH8lA7BKTSb5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kAXDzi/TC07JjgmYEikyy7yfaE8MZpWGY/eVB6/HtqY=;
 b=jM85TAWUKf9wLoFwK9GoQaWlgwrNtrcUUH6eiE8BK9yWA+ST+zpvPDvTI6uE5AVXVaR/gQsO2ne+RQM/1o4S7gyeYXzBuhwQcd/kNyoWGv+ISl3hGzpUgHoG/zwJjrzXWQr0+PojPcVbLCeQ/CE177IVLfjl4v/uajuYH0PGWFB//r7roQ4ByDQQfQqJXPCUyAxYzNKIy+TcHl3moiLPB5dgqMxskjTWDB2Du+G0G+A35Vr9PRVj4viyH6vwBWJQjJcyLxPr5pOph+TbxrDKk5KJf2RmMxpT9S1en2d5lcRnBk9iI1WI5+QYu+BXHWZd77i9EAkE4N29WXwyXHiYIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6954.namprd11.prod.outlook.com (2603:10b6:510:205::8)
 by DSVPR11MB9915.namprd11.prod.outlook.com (2603:10b6:8:45d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Thu, 8 Oct
 2026 06:16:36 +0000
Received: from PH7PR11MB6954.namprd11.prod.outlook.com
 ([fe80::7a4e:c93f:b085:f2f8]) by PH7PR11MB6954.namprd11.prod.outlook.com
 ([fe80::7a4e:c93f:b085:f2f8%5]) with mapi id 15.21.0496.010; Thu, 8 Oct 2026
 06:16:36 +0000
Content-Type: multipart/alternative;
 boundary="------------PD0Qz9WD9Ne687gxuUEg0IdS"
Message-ID: <be046081-e302-4592-8813-936f22c14f48@intel.com>
Date: Thu, 8 Oct 2026 11:46:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] drm/xe/pf: Explicitly use shareable GuC IDs for
 VFs provisioning
To: <intel-xe@lists.freedesktop.org>
References: <20261005085132.3720685-1-piotr.piorkowski@intel.com>
 <20261005085132.3720685-5-piotr.piorkowski@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <20261005085132.3720685-5-piotr.piorkowski@intel.com>
X-ClientProxiedBy: MA5PR01CA0031.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::16) To PH7PR11MB6954.namprd11.prod.outlook.com
 (2603:10b6:510:205::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6954:EE_|DSVPR11MB9915:EE_
X-MS-Office365-Filtering-Correlation-Id: e66215f5-f365-4958-10a9-08df2503b4c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|18002099003|22082099003|11063799006|4143699003|8096899003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: X7SUYx8sG3+Z1dQJG1a1FuWLueHlibqZdQIPwtTcGvxYOMEZMFAWT+LfkzyZ/NulFvwUHcGtpEIVwPq+RfeRnfiHArR3xC6uL4Mt2mVFTZ8S8GPgKPbHDyP8VlN8b5vszxgU8MImGBJ11UM+IXzeBDATgwgTOj+J8tqwzRQ9HIy+ey0fyJ6ZkpDhceqIatAewBVaCZgpbWpMEQ/Shi+TgGuHf1wM6gO04QS+pQbgaNHfDqHBE3AwECdBk78srwl2Qsh32pfjEs14z4KMmO9DFZaykcdvEWyfdYm7R7/DUVoZzUAfYH060wBiFNgws/FxKnLgzQHTGROjwasaFMDhs22L3/cTP1BA2ywOripUXxYqHbS/lKvOWhrdzPrj7Os7mjI2RsniEQRIDqct4JcO2/suzEbluXjpFgxWPkech+H29KdiHoC0mAv1lAqW+sWA8Swaa10L+qGtxsSxxouwHEs+GX44ETVMYAI5NZyWEgQnZn/eH/Tr8ypZ8PHjLnJVuojVgrMK1dsMkiFX+RiiOTt+Lok1Eo/gNVS63b/OL5wBShsXo0gOywmJ0hZ+FqWXyNvM/PdMR6wU3MURu4LKlY3sVSqb8SgjFbjQCnG/4f5fubM9TLlpCPdM8UIUEFJPTST1Ttdf9BX6kaySWHZXl/IUMoSML8FdT8i4CicEne4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6954.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(18002099003)(22082099003)(11063799006)(4143699003)(8096899003)(10067099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clhwSG9ORzc4TEVHZUQ1ZDg2QmppWHFNdFBZSGNOaW1tZ1AvM3ZKVDdKWUxT?=
 =?utf-8?B?WElhbTlmMjV1RHlWSVVkSnJURktVM3IwQWlyRUlvQW9Wcm0yNUtVUVBpekRu?=
 =?utf-8?B?bTYxVkQ0U0c2R0JQRndraDRERXc4dWFUYlV1WkcwYkFFT0FlSWpEZ3cwaWNt?=
 =?utf-8?B?M0w1QVBPWHlWUEdncUFnbHZuOUdjRTRUcXFUMFEwTU1TejJmN3ZGeW0rdm1O?=
 =?utf-8?B?ek55cjJjTE9kcDFyNkRpMlRvSGU1V3VsZUlJQW5XYUhDVU1lb2pxMkcvU0xY?=
 =?utf-8?B?RmpoNXI0cGVPR08rYnJXYTNYclNhUnhNU1hObkhhelRsbXZua0ZDOVhFRzRC?=
 =?utf-8?B?dERoNmU3Q01jWWduMlhuc3ltdUtCdjV6cGNiR1hSWmo4eVpXbGY2YWdHSzYv?=
 =?utf-8?B?dXBhMjJpaU8xRm80c2s1WXJuOTVIOFhEUXRtU3F3ZW84cWtDRHNsTnVBRHJK?=
 =?utf-8?B?SC8vQWxZRDJTaUE3S1FhbTZnOWN0VmYvMUs1Z0d2R3RTeU1PZ3gyNm1PSHdB?=
 =?utf-8?B?aTZKamxsNzErZzJ4MWx4a05VcFNFNjBveVhwOTNLaTNWbGZNTTlodXd3eU15?=
 =?utf-8?B?UklycGRIZi8yY0RGMmRtRXFvQmxzNzBhZm1HOWM4cEpNN2U0aEJVYzhsNkNE?=
 =?utf-8?B?ZVBLa3lTNmFOd2QrazZPOFg1L2NIZGY1NURCYkcwa0pWRmVFb3VKZ3Bjb3BC?=
 =?utf-8?B?V2VPZW9RS2x0N1d1UUNMbHJ6L092V0FCTnNMS1RSQnhWOExTTWdnTHNvUDBu?=
 =?utf-8?B?dGFxLzR0bkpaTGFzSWoyZE8rNkEzeVBIZ2xyK0Y1dHNIZXJWWG9JRWl1djZC?=
 =?utf-8?B?dVhFL1FsZUVnb2ZrbjBDSG9GYzQrdnZETXRKd2ZiaUpnQ1AwRjc1QlJpM3dR?=
 =?utf-8?B?STFPUXJ1T0d4UjBMNjZJUHNoZ2JnUGQxUXRNRUJMZ3YwY0ZkbTlqeDV5Q0Ux?=
 =?utf-8?B?NUNSWXhyT1IvTHhGaEFWZmF4VW9QTG5jRmRHbWZYaTQ2VUtBS1BHY1lZMnpX?=
 =?utf-8?B?RGVlNThNQ1lzTTZTM3BlTHdRTFc4eDJYblIxcmpxMHpFa3h2bkV1WXNIWmhu?=
 =?utf-8?B?L2p1emduQXBqYklFeThTK2E1OHBEUUNkc25iUVpwTEVvVnZmcUNYZ0ZDa3Js?=
 =?utf-8?B?c1dvbWRIQ3Vxbk5JWGk0NUlwSDk1cHBwR1ZiWGtqMjJDS3VaV1haOUdjYU9V?=
 =?utf-8?B?Z3BRNCtibjZkVVcvSnlmc0tNSGdGSnN5ajNUNGxaMU9XZE9GOUJ5Z3BYRk9G?=
 =?utf-8?B?OUthK0FCbzB5cW8yY1lrQjhDYUhid1J0WjU3ZXpoQVpIYzJOVExwRVFWTThh?=
 =?utf-8?B?UmZDd0VYRmxoV0dqOVExOUNXT0NKN2hEVkJ0c1JkeXlpVGhJY3IrdTMxOFBj?=
 =?utf-8?B?akU3R1UxaGVwamE2Z2dCMlZqaUY2dEZFZm1TMVo3TjhHWEVEb1d2WEZLS0Fv?=
 =?utf-8?B?aUhZV0U0TEdpRGNHUW9IVW84ek5QcU9HKy9FS1h3dmJzdlQ3aU5yWjVWQkZs?=
 =?utf-8?B?a1ZBNkUxMHhLb3p6L01hYitzUTA0Qi8vNDArMU9iSWtmWFdIL1drQzJUVFFz?=
 =?utf-8?B?a0s5VmlxSWtNdDdBbGU2TzV3L3NDTVo4RitrY21IblZkYkdtdnhySWtTbHhh?=
 =?utf-8?B?eTRGbkk2TU9OLzJZRStOa1JpeTdtc3l3aTUxMHhKNVpWaXhXYzExMlJCbitl?=
 =?utf-8?B?TVhhVVA0N1lJT1IrNFpZNUw2Nm5XV29QQmlMS3B3YTJIeVZLNE1UQ3psYUEv?=
 =?utf-8?B?MXhOOExNMXNrbThLcjZ2YUpHRGdEVHMxZmNheFVYSVU0VTBQYnFFMUxSMXV6?=
 =?utf-8?B?NEx2RXYwa2ZwR3dDQTNjWmxNaVVlSDFOaGhTQ3N5eWtaek9LcGd0NVNnYVFa?=
 =?utf-8?B?QnlqUUlkREphVmIzREVRWTl4UWFCS2tndGZZR0lFK0FESlNjY1JlUVM2c2Qw?=
 =?utf-8?B?ZS92OFc3WXpTR2MzbFhIRVRvWVJxT21EYWNUaU90SmE5STR3S2QxRUwrZDhZ?=
 =?utf-8?B?SjhVMTNRSng4LzFMY3VEK2FEWXF0L0hkempKRW9MWkExOTB1VDZCMFVOUVR0?=
 =?utf-8?B?S0NLOVJwUnE3VkZGcVdCVEkxRlY0ekFOL0hnMFhkaFlDNjlZOXhHWGpsOHlP?=
 =?utf-8?B?a1l4TzJxVDJ4OTJXTnZNSVQwc2pucGNwMDEwNFhVNkorVEQxZnIvTTVET2o1?=
 =?utf-8?B?WVRRNll4S2s2YmtISm13UUxjcmNYN285cmNBRng0YjNsZWRDV29NQUErd0NP?=
 =?utf-8?B?d3JISFl0SzRDbXZmSnJUYVVMY3BndU5BbmI5TEV3c1JRN0hDRlY5KzVRYXc2?=
 =?utf-8?B?a0Y5cTQ1cVU2bks3Y09NSlFWQmVzUlRyU1pJc2NMb08rS3VBMVkxSDNZZy8v?=
 =?utf-8?Q?avxcKZIBqSdl7JdE=3D?=
X-Exchange-RoutingPolicyChecked: ZZkaMdW1mZ29WvjWg4/Vs4U2pB3d0Qf791upTF6VECrtlB3o9Zlt0WtTCHGNBAyYfUIX+9DmhkPI6Mg9B4qgfKlE0lYEVCjOA0D7elumK/1Ep3QqEYUibql63rYJ5uPxUjSAaHBiFCoZMWfp3e90JQqqDwhZPl6t68s0+Ui6e1uFfDt1CEoR57dU6GEAOXPljF5jPh14AqnxoK1ESVpwvmqxaCwFLfkJkCrSK+DMxV530VRRWbfqozSucctLAYbkcTX+6BDUuxU4IH5TaLSw6/RNxwb3D/A/lcIPufEwTq1hkFTCC4UlWdvFIoR4O90y6mjKCoa1QUmNjkr30klGnQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: e66215f5-f365-4958-10a9-08df2503b4c7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6954.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 06:16:36.1451 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /0GTbwOlVeG/d0gYS6i2uRLSU4Y4kG1xUrQBN9DXu34zUXm3nZIZyCKG75y9P+rPICvx4izbuJw3GaJ4EzMRRk+BwTClKXlqVXpJYlNdUbM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9915
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

--------------PD0Qz9WD9Ne687gxuUEg0IdS
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 05-Oct-26 2:21 PM, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski<piotr.piorkowski@intel.com>
>
> Switch PF VF-context provisioning to explicitly allocate IDs from
> the dedicated shareable ID pool.
> Also, lets remove the legacy GuC ID reservation API now that all VFs
> provisioning paths use the shareable allocation helpers.
>
> v2: Use local variable for max shareable GuC IDs in fair profile (Satya)
>
> Assisted-by: Claude:claude-5-sonnet
> Signed-off-by: Piotr Piórkowski<piotr.piorkowski@intel.com>
> Cc: Michal Wajdeczko<michal.wajdeczko@intel.com>
> ---
>   .../xe/tests/xe_gt_sriov_pf_config_kunit.c    |  5 ++
>   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 21 ++++---
>   drivers/gpu/drm/xe/xe_guc_id_mgr.c            | 56 ++-----------------
>   drivers/gpu/drm/xe/xe_guc_id_mgr.h            |  2 -
>   4 files changed, 24 insertions(+), 60 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
> index e6eaa94d4d30f..4d72411cd570c 100644
> --- a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
> +++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
> @@ -68,6 +68,7 @@ static int pf_gt_config_test_init(struct kunit *test)
>   		.graphics_verx100 = 2001,
>   	};
>   	struct xe_vram_region *vram;
> +	struct xe_guc_id_mgr *idm;
>   	struct xe_device *xe;
>   	struct xe_gt *gt;
>   
> @@ -102,6 +103,10 @@ static int pf_gt_config_test_init(struct kunit *test)
>   	pf_set_admin_mode(xe, false);
>   	KUNIT_ASSERT_EQ(test, xe_sriov_init(xe), 0);
>   
> +	idm = &gt->uc.guc.submission_state.idm;
> +	mutex_init(&gt->uc.guc.submission_state.lock);
> +	KUNIT_ASSERT_EQ(test, xe_guc_id_mgr_init_shared(idm), 0);
> +
>   	/* more sanity checks */
>   	KUNIT_EXPECT_EQ(test, GUC_ID_MAX + 1, SZ_64K);
>   	KUNIT_EXPECT_EQ(test, GUC_NUM_DOORBELLS, SZ_256);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index de1ac58e31412..0a47458e5bf20 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -889,7 +889,7 @@ static int pf_set_spare_ctxs(struct xe_gt *gt, u32 spare)
>   	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
>   	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
>   
> -	if (spare > GUC_ID_MAX)
> +	if (spare > xe_guc_id_mgr_max_shareable(&gt->uc.guc.submission_state.idm))
>   		return -EINVAL;
>   
>   	if (spare && spare < pf_get_min_spare_ctxs(gt))
> @@ -906,7 +906,7 @@ static int pf_reserve_ctxs(struct xe_gt *gt, u32 num)
>   	struct xe_guc_id_mgr *idm = &gt->uc.guc.submission_state.idm;
>   	unsigned int spare = pf_get_spare_ctxs(gt);
>   
> -	return xe_guc_id_mgr_reserve(idm, num, spare);
> +	return xe_guc_id_mgr_reserve_shareable(idm, num, spare);
>   }
>   
>   static void pf_release_ctxs(struct xe_gt *gt, u32 start, u32 num)
> @@ -933,7 +933,7 @@ static int pf_provision_vf_ctxs(struct xe_gt *gt, unsigned int vfid, u32 num_ctx
>   
>   	xe_gt_assert(gt, vfid);
>   
> -	if (num_ctxs > GUC_ID_MAX)
> +	if (num_ctxs > xe_guc_id_mgr_max_shareable(&gt->uc.guc.submission_state.idm))
>   		return -EINVAL;
>   
>   	if (config->num_ctxs) {
> @@ -1170,23 +1170,30 @@ int xe_gt_sriov_pf_config_bulk_set_ctxs(struct xe_gt *gt, unsigned int vfid,
>   
>   static u32 pf_profile_fair_ctxs(struct xe_gt *gt, unsigned int num_vfs)
>   {
> +	u32 max_shareable = xe_guc_id_mgr_max_shareable(&gt->uc.guc.submission_state.idm);
>   	bool admin_only_pf = xe_sriov_pf_admin_only(gt_to_xe(gt));
>   
>   	if (admin_only_pf && num_vfs == 1)
> -		return ALIGN_DOWN(GUC_ID_MAX, SZ_1K);
> +		return ALIGN_DOWN(max_shareable, SZ_1K);
>   
> -	return rounddown_pow_of_two(GUC_ID_MAX / num_vfs);
> +	return rounddown_pow_of_two(max_shareable / num_vfs);
>   }
>   
>   static u32 pf_estimate_fair_ctxs(struct xe_gt *gt, unsigned int num_vfs)
>   {
>   	struct xe_guc_id_mgr *idm = &gt->uc.guc.submission_state.idm;
> +	u32 max_shareable = xe_guc_id_mgr_max_shareable(idm);
>   	u32 spare = pf_get_spare_ctxs(gt);
> -	u32 fair = (xe_guc_id_mgr_max_usable(idm) - spare) / num_vfs;
> +	u32 fair;
>   	int ret;
>   
> +	if (max_shareable <= spare)
> +		return 0;
> +
> +	fair = (max_shareable - spare) / num_vfs;
> +
>   	for (; fair; --fair) {
> -		ret = xe_guc_id_mgr_reserve(idm, fair * num_vfs, spare);
> +		ret = xe_guc_id_mgr_reserve_shareable(idm, fair * num_vfs, spare);
>   		if (ret< 0) continue; xe_guc_id_mgr_release(idm, ret, fair * num_vfs); diff 
> --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.c 
> b/drivers/gpu/drm/xe/xe_guc_id_mgr.c index 
> dc918221b78de..6cd73009177af 100644 --- 
> a/drivers/gpu/drm/xe/xe_guc_id_mgr.c +++ 
> b/drivers/gpu/drm/xe/xe_guc_id_mgr.c @@ -120,9 +120,13 @@ static int 
> idm_init(struct xe_guc_id_mgr *idm, unsigned int usable, unsigned int 
> } /** - * xe_guc_id_mgr_init() - Initialize GuC context ID manager in 
> native mode. + * xe_guc_id_mgr_init() - Initialize GuC ID manager for 
> native. * @idm: the &xe_guc_id_mgr to initialize * + * This function 
> initializes the GuC ID manager to manage the full range of + * GuC 
> context IDs (0..GUC_ID_MAX - 1) for use by the GuC submission code. + 
> * No GuC context IDs will be reserved for sharing with VFs. + * * Can 
> only be called when the device is not in SR-IOV mode. * * Return: 0 on 
> success or a negative error code on failure. @@ -283,37 +287,6 @@ 
> static int idm_reserve_chunk_shareable_locked(struct xe_guc_id_mgr 
> *idm, unsigne return id; } -static int idm_reserve_chunk_locked(struct 
> xe_guc_id_mgr *idm, unsigned int count, - unsigned int retain) -{ - 
> unsigned int total = idm_total(idm); - int id; - - idm_assert(idm, 
> count); - lockdep_assert_held(idm_mutex(idm)); - - if (!total) - 
> return -ENODATA; - - if (retain) { - unsigned int used = 
> bitmap_weight(idm->bitmap, total);
> -
> -		if (used + count + retain > total)
> -			return -EDQUOT;
> -
> -		id = idm_find_last_zero_area_in_range(idm->bitmap, 0, total, count);
> -	} else {
> -		id = bitmap_find_next_zero_area(idm->bitmap, total, 0, count, 0);
> -	}
> -
> -	if (id >= total)
> -		return -ENOSPC;
> -
> -	bitmap_set(idm->bitmap, id, count);
> -
> -	return id;
> -}
> -
>   static void idm_release_chunk_locked(struct xe_guc_id_mgr *idm,
>   				     unsigned int start, unsigned int count)
>   {
> @@ -471,25 +444,6 @@ int xe_guc_id_mgr_reserve_shareable(struct xe_guc_id_mgr *idm, unsigned int coun
>   	return idm_reserve_chunk_shareable_locked(idm, count, spare);
>   }
>   
> -int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, unsigned int count)
> -{
> -	return idm_reserve_chunk_locked(idm, count, 0);
> -}
> -
> -int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm, unsigned int count,
> -			  unsigned int retain)
> -{
> -	int ret;
> -
> -	idm_assert(idm, count);
> -	idm_assert(idm, retain);
> -
> -	guard(mutex)(idm_mutex(idm));
> -	ret = idm_reserve_chunk_locked(idm, count, retain);
> -
> -	return ret;
> -}
> -
>   /**
>    * xe_guc_id_mgr_release() - Release one or more GuC context IDs.
>    * @idm: the &xe_guc_id_mgr
> diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.h b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
> index ed9970829a939..844d68440b0af 100644
> --- a/drivers/gpu/drm/xe/xe_guc_id_mgr.h
> +++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
> @@ -31,8 +31,6 @@ int xe_guc_id_mgr_reserve_shareable_locked(struct xe_guc_id_mgr *idm, unsigned i
>   					   unsigned int spare);
>   int xe_guc_id_mgr_reserve_shareable(struct xe_guc_id_mgr *idm, unsigned int count,
>   				    unsigned int spare);
> -int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, unsigned int count);
> -int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm, unsigned int count, unsigned int retain);
>   void xe_guc_id_mgr_release_locked(struct xe_guc_id_mgr *idm, unsigned int id, unsigned int count);
>   int xe_guc_id_mgr_release_usable_locked(struct xe_guc_id_mgr *idm, unsigned int id,
>   					unsigned int count);

LGTM.

Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

--------------PD0Qz9WD9Ne687gxuUEg0IdS
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 05-Oct-26 2:21 PM, Pi=C3=B3rkowski, P=
iotr
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20261005085132.3720685-5-piotr.pi=
orkowski@intel.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">From: Piotr Pi=C3=B3rkowski <a=
 class=3D"moz-txt-link-rfc2396E" href=3D"mailto:piotr.piorkowski@intel.com"=
>&lt;piotr.piorkowski@intel.com&gt;</a>

Switch PF VF-context provisioning to explicitly allocate IDs from
the dedicated shareable ID pool.
Also, lets remove the legacy GuC ID reservation API now that all VFs
provisioning paths use the shareable allocation helpers.

v2: Use local variable for max shareable GuC IDs in fair profile (Satya)

Assisted-by: Claude:claude-5-sonnet
Signed-off-by: Piotr Pi=C3=B3rkowski <a class=3D"moz-txt-link-rfc2396E" hre=
f=3D"mailto:piotr.piorkowski@intel.com">&lt;piotr.piorkowski@intel.com&gt;<=
/a>
Cc: Michal Wajdeczko <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:mich=
al.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
---
 .../xe/tests/xe_gt_sriov_pf_config_kunit.c    |  5 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 21 ++++---
 drivers/gpu/drm/xe/xe_guc_id_mgr.c            | 56 ++-----------------
 drivers/gpu/drm/xe/xe_guc_id_mgr.h            |  2 -
 4 files changed, 24 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c b/drive=
rs/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
index e6eaa94d4d30f..4d72411cd570c 100644
--- a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
@@ -68,6 +68,7 @@ static int pf_gt_config_test_init(struct kunit *test)
 		.graphics_verx100 =3D 2001,
 	};
 	struct xe_vram_region *vram;
+	struct xe_guc_id_mgr *idm;
 	struct xe_device *xe;
 	struct xe_gt *gt;
=20
@@ -102,6 +103,10 @@ static int pf_gt_config_test_init(struct kunit *test)
 	pf_set_admin_mode(xe, false);
 	KUNIT_ASSERT_EQ(test, xe_sriov_init(xe), 0);
=20
+	idm =3D &amp;gt-&gt;uc.guc.submission_state.idm;
+	mutex_init(&amp;gt-&gt;uc.guc.submission_state.lock);
+	KUNIT_ASSERT_EQ(test, xe_guc_id_mgr_init_shared(idm), 0);
+
 	/* more sanity checks */
 	KUNIT_EXPECT_EQ(test, GUC_ID_MAX + 1, SZ_64K);
 	KUNIT_EXPECT_EQ(test, GUC_NUM_DOORBELLS, SZ_256);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/x=
e/xe_gt_sriov_pf_config.c
index de1ac58e31412..0a47458e5bf20 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -889,7 +889,7 @@ static int pf_set_spare_ctxs(struct xe_gt *gt, u32 spar=
e)
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
 	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
=20
-	if (spare &gt; GUC_ID_MAX)
+	if (spare &gt; xe_guc_id_mgr_max_shareable(&amp;gt-&gt;uc.guc.submission_=
state.idm))
 		return -EINVAL;
=20
 	if (spare &amp;&amp; spare &lt; pf_get_min_spare_ctxs(gt))
@@ -906,7 +906,7 @@ static int pf_reserve_ctxs(struct xe_gt *gt, u32 num)
 	struct xe_guc_id_mgr *idm =3D &amp;gt-&gt;uc.guc.submission_state.idm;
 	unsigned int spare =3D pf_get_spare_ctxs(gt);
=20
-	return xe_guc_id_mgr_reserve(idm, num, spare);
+	return xe_guc_id_mgr_reserve_shareable(idm, num, spare);
 }
=20
 static void pf_release_ctxs(struct xe_gt *gt, u32 start, u32 num)
@@ -933,7 +933,7 @@ static int pf_provision_vf_ctxs(struct xe_gt *gt, unsig=
ned int vfid, u32 num_ctx
=20
 	xe_gt_assert(gt, vfid);
=20
-	if (num_ctxs &gt; GUC_ID_MAX)
+	if (num_ctxs &gt; xe_guc_id_mgr_max_shareable(&amp;gt-&gt;uc.guc.submissi=
on_state.idm))
 		return -EINVAL;
=20
 	if (config-&gt;num_ctxs) {
@@ -1170,23 +1170,30 @@ int xe_gt_sriov_pf_config_bulk_set_ctxs(struct xe_g=
t *gt, unsigned int vfid,
=20
 static u32 pf_profile_fair_ctxs(struct xe_gt *gt, unsigned int num_vfs)
 {
+	u32 max_shareable =3D xe_guc_id_mgr_max_shareable(&amp;gt-&gt;uc.guc.subm=
ission_state.idm);
 	bool admin_only_pf =3D xe_sriov_pf_admin_only(gt_to_xe(gt));
=20
 	if (admin_only_pf &amp;&amp; num_vfs =3D=3D 1)
-		return ALIGN_DOWN(GUC_ID_MAX, SZ_1K);
+		return ALIGN_DOWN(max_shareable, SZ_1K);
=20
-	return rounddown_pow_of_two(GUC_ID_MAX / num_vfs);
+	return rounddown_pow_of_two(max_shareable / num_vfs);
 }
=20
 static u32 pf_estimate_fair_ctxs(struct xe_gt *gt, unsigned int num_vfs)
 {
 	struct xe_guc_id_mgr *idm =3D &amp;gt-&gt;uc.guc.submission_state.idm;
+	u32 max_shareable =3D xe_guc_id_mgr_max_shareable(idm);
 	u32 spare =3D pf_get_spare_ctxs(gt);
-	u32 fair =3D (xe_guc_id_mgr_max_usable(idm) - spare) / num_vfs;
+	u32 fair;
 	int ret;
=20
+	if (max_shareable &lt;=3D spare)
+		return 0;
+
+	fair =3D (max_shareable - spare) / num_vfs;
+
 	for (; fair; --fair) {
-		ret =3D xe_guc_id_mgr_reserve(idm, fair * num_vfs, spare);
+		ret =3D xe_guc_id_mgr_reserve_shareable(idm, fair * num_vfs, spare);
 		if (ret <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:0)continue;xe_=
guc_id_mgr_release(idm,ret,fair*num_vfs);diff--gita/drivers/gpu/drm/xe/xe_g=
uc_id_mgr.cb/drivers/gpu/drm/xe/xe_guc_id_mgr.cindexdc918221b78de..6cd73009=
177af100644---a/drivers/gpu/drm/xe/xe_guc_id_mgr.c+++b/drivers/gpu/drm/xe/x=
e_guc_id_mgr.c@@-120,9+120,13@@staticintidm_init(structxe_guc_id_mgr*idm,un=
signedintusable,unsignedint}/**-*xe_guc_id_mgr_init()-InitializeGuCcontextI=
Dmanagerinnativemode.+*xe_guc_id_mgr_init()-InitializeGuCIDmanagerfornative=
.*@idm:the&amp;xe_guc_id_mgrtoinitialize*+*ThisfunctioninitializestheGuCIDm=
anagertomanagethefullrangeof+*GuCcontextIDs(0..GUC_ID_MAX-1)forusebytheGuCs=
ubmissioncode.+*NoGuCcontextIDswillbereservedforsharingwithVFs.+**Canonlybe=
calledwhenthedeviceisnotinSR-IOVmode.**Return:0onsuccessoranegativeerrorcod=
eonfailure.@@-283,37+287,6@@staticintidm_reserve_chunk_shareable_locked(str=
uctxe_guc_id_mgr*idm,unsignereturnid;}-staticintidm_reserve_chunk_locked(st=
ructxe_guc_id_mgr*idm,unsignedintcount,-unsignedintretain)-{-unsignedinttot=
al=3Didm_total(idm);-intid;--idm_assert(idm,count);-lockdep_assert_held(idm=
_mutex(idm));--if(!total)-return-ENODATA;--if(retain){-unsignedintused=3Dbi=
tmap_weight(idm-">&lt; 0)
 			continue;
 		xe_guc_id_mgr_release(idm, ret, fair * num_vfs);
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.c b/drivers/gpu/drm/xe/xe_guc=
_id_mgr.c
index dc918221b78de..6cd73009177af 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.c
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
@@ -120,9 +120,13 @@ static int idm_init(struct xe_guc_id_mgr *idm, unsigne=
d int usable, unsigned int
 }
=20
 /**
- * xe_guc_id_mgr_init() - Initialize GuC context ID manager in native mode=
.
+ * xe_guc_id_mgr_init() - Initialize GuC ID manager for native.
  * @idm: the &amp;xe_guc_id_mgr to initialize
  *
+ * This function initializes the GuC ID manager to manage the full range o=
f
+ * GuC context IDs (0..GUC_ID_MAX - 1) for use by the GuC submission code.
+ * No GuC context IDs will be reserved for sharing with VFs.
+ *
  * Can only be called when the device is not in SR-IOV mode.
  *
  * Return: 0 on success or a negative error code on failure.
@@ -283,37 +287,6 @@ static int idm_reserve_chunk_shareable_locked(struct x=
e_guc_id_mgr *idm, unsigne
 	return id;
 }
=20
-static int idm_reserve_chunk_locked(struct xe_guc_id_mgr *idm, unsigned in=
t count,
-				    unsigned int retain)
-{
-	unsigned int total =3D idm_total(idm);
-	int id;
-
-	idm_assert(idm, count);
-	lockdep_assert_held(idm_mutex(idm));
-
-	if (!total)
-		return -ENODATA;
-
-	if (retain) {
-		unsigned int used =3D bitmap_weight(idm-&gt;</a>bitmap, total);
-
-		if (used + count + retain &gt; total)
-			return -EDQUOT;
-
-		id =3D idm_find_last_zero_area_in_range(idm-&gt;bitmap, 0, total, count)=
;
-	} else {
-		id =3D bitmap_find_next_zero_area(idm-&gt;bitmap, total, 0, count, 0);
-	}
-
-	if (id &gt;=3D total)
-		return -ENOSPC;
-
-	bitmap_set(idm-&gt;bitmap, id, count);
-
-	return id;
-}
-
 static void idm_release_chunk_locked(struct xe_guc_id_mgr *idm,
 				     unsigned int start, unsigned int count)
 {
@@ -471,25 +444,6 @@ int xe_guc_id_mgr_reserve_shareable(struct xe_guc_id_m=
gr *idm, unsigned int coun
 	return idm_reserve_chunk_shareable_locked(idm, count, spare);
 }
=20
-int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, unsigned int c=
ount)
-{
-	return idm_reserve_chunk_locked(idm, count, 0);
-}
-
-int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm, unsigned int count,
-			  unsigned int retain)
-{
-	int ret;
-
-	idm_assert(idm, count);
-	idm_assert(idm, retain);
-
-	guard(mutex)(idm_mutex(idm));
-	ret =3D idm_reserve_chunk_locked(idm, count, retain);
-
-	return ret;
-}
-
 /**
  * xe_guc_id_mgr_release() - Release one or more GuC context IDs.
  * @idm: the &amp;xe_guc_id_mgr
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.h b/drivers/gpu/drm/xe/xe_guc=
_id_mgr.h
index ed9970829a939..844d68440b0af 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.h
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
@@ -31,8 +31,6 @@ int xe_guc_id_mgr_reserve_shareable_locked(struct xe_guc_=
id_mgr *idm, unsigned i
 					   unsigned int spare);
 int xe_guc_id_mgr_reserve_shareable(struct xe_guc_id_mgr *idm, unsigned in=
t count,
 				    unsigned int spare);
-int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, unsigned int c=
ount);
-int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm, unsigned int count, u=
nsigned int retain);
 void xe_guc_id_mgr_release_locked(struct xe_guc_id_mgr *idm, unsigned int =
id, unsigned int count);
 int xe_guc_id_mgr_release_usable_locked(struct xe_guc_id_mgr *idm, unsigne=
d int id,
 					unsigned int count);</pre>
    </blockquote>
    <p>LGTM.</p>
    <p><span style=3D"font-family:Menlo">Reviewed-by: </span><span style=3D=
"font-family:Aptos">Satyanarayana
        K V P <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:satyanaraya=
na.k.v.p@intel.com">&lt;satyanarayana.k.v.p@intel.com&gt;</a></span></p>
    <blockquote type=3D"cite" cite=3D"mid:20261005085132.3720685-5-piotr.pi=
orkowski@intel.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------PD0Qz9WD9Ne687gxuUEg0IdS--
