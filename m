Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC1FDC4450A
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 11:11:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A55DA10E33C;
	Thu, 16 Jul 2026 11:11:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g3jz2puq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71CFD10E33C
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jul 2026 11:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784200273; x=1815736273;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DRIcW4koFphrtp5xYxUoMoIUv7Pf2OJCiTCkDZPGai0=;
 b=g3jz2puqcm95o5tKi7cE58FWRNS9Z0ngzk+l06qFVSOc8s/g/dY4m4fZ
 ik9YCO48mujar9hIRA3rm4M943fNsGnfu9O7awhJOvP3juIhC7kyAZEcC
 /pst80Osha+cldg4uXZsIVMNUQB6xmXc4k0vBFFN6UK7gnur2G8G1WkMp
 8BXTzyWB41Kc2oWDDn5qDCpco9qn+gyD+dwRrbYMAJGLJG+CjYQadsJy4
 Kn6rzYZt3La3xI3zX4Jpz1d35jy5e+4jfGBuptgHNFeZ+UVJylBIfNtC/
 6hIt9gk3WTf3DLfe8hRe2ePpDh8Ld9lKdzBA68LS/At28Kk3NM9Vga2cs Q==;
X-CSE-ConnectionGUID: OsD6pDoSTjOewgdkx0S4Bw==
X-CSE-MsgGUID: IWDkawYDT1yr6dZ+EY6EWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="96221258"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="96221258"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 04:11:13 -0700
X-CSE-ConnectionGUID: n60GIyHlQQWK+7ok0P0jzA==
X-CSE-MsgGUID: k8N+L7wpSNmJIC3+F3isnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="279743507"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 04:11:13 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 04:11:12 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 04:11:12 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.55) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 04:11:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZGVVY3v1sUtXkyUcGf4z4YwvlqX4zyVNGqY0JIZAdSFhbQ8y87q723GAuD8oF8R4o6emi8e/Xm5/4EytiuEawU6i/DAD91yTwKAPbtCIPrPN9IBkGAZzmGUKv4VvjG5HsBzOx6CzDKgQKKkibzkNXZKiJ9+YRP9QmMxQSI8VdcY3VFryfa9qby0YPjGiud9qgyaIWqg99CHii88LFkhVBlSFA4+vnVF3Ps4lrHOI1qmUeZF4fhfbqdn44jXl2ExmLFqbejA9pcBK5iCP9jpY/6W3caUiYEFyUDQQQksiNS+sLG+RzsIJcY5QiDvGuPAgf19WDGawoNc8I8Z/T04ZKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Mt5Ex9pUSRus+MoFSYlXU29gg34HQeZccicOrQgAtc=;
 b=HfiDbpQD+osuP4u/GBuqo4FCiYdnWq/+FjT6acla09QjRyQG5oZrCea8vslDE2P3eclyOlN61Anfd+iGPAdTo24Fky4Ms1R69ZzDIzBIJZCPGIHg9cFuMB78YRbgmEQeFK5isMbbLJG2x3YhvtThfkmVvHcKY0KLQiWbOtxJfJrrY13qARAt5D4aVwlZZKz0XDDesVhUbGQgihK6+7HAWrlUjbc9iSFByuCbtnx3qjQ1ncoSDm4ADjL4Lm9OIh6KF7yKGQhLR8q5F1dYkR+uuzCpHMvb2t7Hxs3Gsy15DbiX+Nt4NfUhKi3EV/Ve3B2W9gDD/HC3CLkplEkyFTkPdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by SJ0PR11MB4926.namprd11.prod.outlook.com
 (2603:10b6:a03:2d7::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 11:11:10 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::a3b:efa:42d5:e983]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::a3b:efa:42d5:e983%8]) with mapi id 15.21.0181.017; Thu, 16 Jul 2026
 11:11:09 +0000
Message-ID: <dba83e48-e93e-41c5-a337-7c79bb6fdef4@intel.com>
Date: Thu, 16 Jul 2026 16:41:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/7] drm/xe/debugfs: add page-size allocation mode knob
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
References: <20260714105538.170849-9-himal.prasad.ghimiray@intel.com>
 <20260714105538.170849-11-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
In-Reply-To: <20260714105538.170849-11-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0337.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21f::13) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|SJ0PR11MB4926:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e577485-2490-4689-f9cf-08dee32af053
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|6133799003|4143699003|56012099006|11063799006|10067099003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: W4DejcfOc1dcB0eCBj2NvX2cf3G6Ko/MyQby+5khsxQUi0ACIYJIKIf2VN+AenoaHSGveEOrBU1Pf+3WrcLiKD/GgNovbOBcxBFVNZiWllivF3mEmrihRPRHh2zReV9Q/dq/Frh/+RAyDgmlJheINNrx9wXW0voIk+IStU2UzLCddq7spyonmcwoOy5+ULBMPWbDUfRa0QwSo9Yh4ez098yKQtmS6+zdXYmQ/fZCbf9BUAAckdftYvXUIyfs+12TMKc36/TyfyINq8PkrYcEXyr/N/78GYr3/ibM+oInQtL0Lpp+gkNTWGylYgNtQXvyMnbBnYjYd9PAxsgvIG6sSFrciE58IjwU2ZvWoIDcyQKhbIlwpCwpTi+iZbSi1HyZih63KWykufDfelYWrZehGWaASE1j7P/oqLSHo1hANey517HWmkwPjQHs2D36TIDyQ4TGyEe5MZmFtB/01feqkBbj+fYW5ECwVjygEe/dw2wLvnkOqSMfJiyWlbGlg5UDvjxnAEeC54oUSU+8gg2WdKf7UoH504EpeXPYbQ+FIvDbCQ21n84cqLEx/LnkSWholX1FIHFPqyrIcbe6DHFO6pFyhENPyAviZRmUp//0dk9VbexwqquV+8oSBtJOemIxWvYoYhchpFlF+IdjNQ0twDAmGis5379KlKo84KwvMQA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(4143699003)(56012099006)(11063799006)(10067099003)(3023799007)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmRBV0REWGJMb042RFlleFlVQVUwdkl5V3FlTnlHRmVQb0RGeUFpdjMwWExk?=
 =?utf-8?B?cTh2Rk5XbE00MkdieXZXRG1GWjRMMW1yamR1ZnE1MTMwK21FVHRObTJmTENy?=
 =?utf-8?B?Y0pWTDRKaUhwT1NhWGlGMDlwRkUwQkU1ODQ3Y3dsbjB0dGxPY2dTZTlIZXJS?=
 =?utf-8?B?TzV2QmVmQ3h3YnRrUkM5aDFMMi9JRVNTK29wUXI3c0QyWmpmTXFTaTRRc3RE?=
 =?utf-8?B?bDdzYVhmVC9zejRzblJFZzQ2V2FCM3l6TlhMSzRUTld6YkRFSlZlcHlTQVA0?=
 =?utf-8?B?TUV2NjVhRWNKeWVDWUhHRmtWOTJXVE4xc1NIeEZqUkY1STdEMVVPNnNEVUI5?=
 =?utf-8?B?M1JnSG5QdmNEbUVvRHFiK0p3b29pTmNIZjdncVNVeVpScjBWN2RtWk1kSGRN?=
 =?utf-8?B?TkFPSUpIbElEUCt3TzU1bGt4enlEVEtUWk1Xb0NkWVU5RE0vVzlhUFZDL3ZW?=
 =?utf-8?B?d05udFl5TkgyMW1lNVBMVGV4bENuRkxLRFNjUThDWHNMUWFacHg3KzVNRi8x?=
 =?utf-8?B?Zjk3MGdpeVZncFd4T0VFYThsQ0JaYXlWN2NCTXF4RGxiSmdjL2RtdW1VSmpr?=
 =?utf-8?B?eDF3eE85QnlUK1J6VVR6anZlemtCK1FrRGRUeXdDOFZrZkRvY2p5OHNSNVI4?=
 =?utf-8?B?NXRMOVRpek1XR3VRa1pJdFRQVXd3L04yOVlaRTZGNHczMTQvVENDcjJaeERR?=
 =?utf-8?B?S3FrRHpMZ3ZMeVJaQXNEYXFNalUxK3lJWm9iU1U3aExUTnJBbm42Z1JjeXhj?=
 =?utf-8?B?MjN6NTNTK25aaklCS2loUm9TL0dHUFV3Z3RzcjFJeGhLVWRCN05iRDVxYlFo?=
 =?utf-8?B?MXZZekxHdjBEbmwrUXcxRWkxYnFZSDIzaGtYeHJrMzZHY0N6SXJvM3k3VWZQ?=
 =?utf-8?B?ZTAyMzhWQnhRbCsyT05oaWdRaEZJcjY0VGVPU0k3YXFXYzNHTGpJdU9xWjdD?=
 =?utf-8?B?QkVzMmZIMnlJZS9mejJvT3RRQXV6ZG51TWNjbTRkakd5TExoWjZ0WTdUa3NW?=
 =?utf-8?B?b2RWcGxSOUtySDk4WEFVVTBOR2VTWWhMRXYwUHpuY3BxRTNPQkdTbU0yZUR1?=
 =?utf-8?B?aUtSVUhvNzNjOG9CVVNrLzhJY0xWQ3BjZTk5SDZLRDJxT3loL1hsRDR5ZDFF?=
 =?utf-8?B?UTdNVHN6MFBBMmt1Z09mQXhTdVBMMVR1VVB6S3FYU0xVejFUMkVMUThSM3p0?=
 =?utf-8?B?MGNtZzBpZ0tELyt3djVVRHV5ZlpSSk5FbE9lYnVrSWJSbldnVHorU2xaMkJS?=
 =?utf-8?B?VCtnWUpmbEVNejhXVG5YbkRxbDd1Y3BMc3g2cWVtNnpkM0tMT3V6WGdyemp4?=
 =?utf-8?B?SlcwekpvV3ZCNjhFaXptU3ZOcUxnQVh5Z1htelExdjkxM2QrTHd6RXBmVnhN?=
 =?utf-8?B?TkNKN3VRa2ZhZmpIVlFNNW13VmNlUytCdnkvbk4waTI1OW1iN1ZyVVhMYm1U?=
 =?utf-8?B?VjN1ZkJFT0V1LzVlbjRJUVBHL1MxazdlVUNXUFJnOWNqa1dYVnd4d3dWQmF2?=
 =?utf-8?B?aXFWQWZSNGhEQ0FPdXh2NVBLck8yRHlMbVJMenE5VFFJem03bTI1eEh4ZWVm?=
 =?utf-8?B?UUFjUkdIeldSOVNxaUJEN1ZzVVA2SjFTZHRUd2d0cFkyWG4vSG5XMGVWT2pO?=
 =?utf-8?B?V0d1NGJJbEhrTFJDZlBMOVFIbzR6SGxRcGhscXNkRkNqbHZyVVdhTkF1TFFh?=
 =?utf-8?B?VkNCNUUvMzFPYjNlb2dLME9rRDYrNUVnK0RlYVoyaXl5U1JlNWdZcmNISEUv?=
 =?utf-8?B?SG1JN3k3V0lCZWFGQ1hPWDQrbWNDb2JxaTdremVoWEpOc0RUWWhqLzFvZzdh?=
 =?utf-8?B?NmVUd0pDWHFDSERMY3AwZ2s1TzlTMk1tQ1hVaUhOamtGU1IrL1V0SWZqQXYv?=
 =?utf-8?B?bEd1ZkNIZGZqTHRHKy9ySk42K0xaWlRFQ3YwcFQvRXJLeHdOeHE3V2Fndjhi?=
 =?utf-8?B?WWRlTUZsbXBoRm1SZnJUd2tMcmZFSGdrLzltQVBHbzNUQzQ0YmRQMzRlcXVa?=
 =?utf-8?B?SkMvaEc5QkpmRzg4bFdIQ01mVnRoWFZTY0p6NW5iNFJybVNmQm9HV3RESU04?=
 =?utf-8?B?UEVjbFFIcFdKNFJZRDViYnRtSFFWS2dwOFk0R1h6QjdBVWhmaGNaSC9sZXJE?=
 =?utf-8?B?YlV5SGJiUGxFL3BjR3MwMHpkWkRVcWU0Y2wyMUo3czZxN0twQVNzQys2Q3pw?=
 =?utf-8?B?cHZGTEQvSkpJNk5YVkRyeEZPZVFqL2F0RTdZV1BIc0NmeEt0ZTB0NVN2RDB5?=
 =?utf-8?B?TUViUFN2ZUZ3ZVZGNDRoL0UzRWRDRERraHUzQlJiYkhTQ0hKYkphRTRHZEFr?=
 =?utf-8?B?RFNHTE5nSGpIVjdtai83YTkxOWFyYjFJK1BzaXBmWkxXQU12VUlONUxOcmgy?=
 =?utf-8?Q?oQQarq2EeGafuADY=3D?=
X-Exchange-RoutingPolicyChecked: a7K9PV2SZwMf68ClxEkRXFT56CeU6RH3M/4jNDmYdiN6OGvCIhlrNBeYzbRjd2WYUKzD9+baJJp7ThwHoe1dc5gK62TWjYKEMJRqxBLA4TeUT4ez3v9/PZPIgfOrrT09iXRIPXYFZU09OvtRuX3U4EkppsOB7QhijXCIumsUAuI7SELBSypDk9INa5rqY4eCFV6AK4CiHb2+ZAKWV10gjPcGg/PwKHKYRzodgyqU68gA1F2H8HdskjRPxi9qdUzs/Se9zuzA/OiEeG5fndwjc5zIpfTjQUNFGTxDeBQthkBQ3t9yd9sS5oi8DIuxtyznmrEg8UW+LpJ0jDhwX+Ew5A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e577485-2490-4689-f9cf-08dee32af053
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 11:11:09.4725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zkZ6bgxK2ZJPMQT3wiyc6DEDl5Nson5yq89MbkgGi6h06d4484C0HtyY7QILiU7Cxfd514RrS0VfGlEBatcxjrQGtP4QrjkSDUldGQea5CE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4926
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



On 14-07-2026 16:25, Himal Prasad Ghimiray wrote:
> From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
> 
> Expose a debugfs control to override the page-size allocation mode used
> for user BOs.
> 
> The interface allows switching between the default allocation policy,
> forced 2M, forced 1G, and mixed allocation modes at runtime. This
> provides a simple way to validate behavior and debug page-size-dependent
> allocation flows.
> 
> The debugfs entry is built only when CONFIG_DRM_XE_DEBUG_PAGE_SIZE is
> enabled.
> 
> v2
> - update changelog to match mutex-based cur_index handling
> - reset cur_index when switching to mixed mode (sashiko)
> 
> v3
> - add CONFIG guard for page-size allocation debugfs support (Himal)
> - create debugfs entry under CONFIG_DRM_XE_DEBUG_PAGE_SIZE
> 
> v4
> - reorderd this patch with kconfig patch to ensure patch builds
> - Gurding this debug knob for only discrete graphics
> 
> v5(Himal)
> - Guard all page size calls with CONFIG_DRM_XE_DEBUG_PAGE_SIZE
> 
> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_debugfs.c | 62 +++++++++++++++++++++++++++++++++
>   1 file changed, 62 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 8c391c7b017a..dcc01336538d 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -564,6 +564,56 @@ static const struct file_operations disable_late_binding_fops = {
>   	.write = disable_late_binding_set,
>   };
>   
> +#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
> +static ssize_t page_size_alloc_mode_show(struct file *f, char __user *ubuf,
> +					 size_t size, loff_t *pos)
> +{
> +	struct xe_device *xe = file_inode(f)->i_private;
> +	char buf[32];
> +	int len;
> +
> +	mutex_lock(&xe->page_size_alloc_ctrl.lock);
> +
> +	len = scnprintf(buf, sizeof(buf), "%u\n",
> +			xe->page_size_alloc_ctrl.mode);

shouldn't READ_ONCE be enough like other caller sites reading mode ?
Dont think lock is needed here.


> +	mutex_unlock(&xe->page_size_alloc_ctrl.lock);
> +
> +	return simple_read_from_buffer(ubuf, size, pos, buf, len);
> +}
> +
> +static ssize_t page_size_alloc_mode_set(struct file *f, const char __user *ubuf,
> +					size_t size, loff_t *pos)
> +{
> +	struct xe_device *xe = file_inode(f)->i_private;
> +	unsigned int val;
> +	int ret;
> +
> +	ret = kstrtouint_from_user(ubuf, size, 0, &val);
> +	if (ret)
> +		return ret;
> +
> +	if (val > XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED)
> +		return -EINVAL;
> +
> +	mutex_lock(&xe->page_size_alloc_ctrl.lock);
> +
> +	if (val == XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED)
> +		xe->page_size_alloc_ctrl.cur_index = 0;
> +
> +	xe->page_size_alloc_ctrl.mode = (enum xe_page_size_alloc_ctrl_mode)val;

WRITE_ONCE to match with READ_ONCE ?

> +
> +	mutex_unlock(&xe->page_size_alloc_ctrl.lock);
> +
> +	return size;
> +}
> +
> +static const struct file_operations page_size_alloc_mode_fops = {
> +	.owner = THIS_MODULE,
> +	.read = page_size_alloc_mode_show,
> +	.write = page_size_alloc_mode_set,
> +};
> +#endif
> +
>   void xe_debugfs_register(struct xe_device *xe)
>   {
>   	struct ttm_device *bdev = &xe->ttm;
> @@ -616,6 +666,18 @@ void xe_debugfs_register(struct xe_device *xe)
>   
>   	debugfs_create_file("disable_late_binding", 0600, root, xe,
>   			    &disable_late_binding_fops);
> +#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
> +	/*
> +	 * Expose a debugfs knob to control user BO page-size allocation:
> +	 * 0 - default behavior
> +	 * 1 - force 2M page allocations
> +	 * 2 - force 1G page allocations
> +	 * 3 - mixed mode: select 4K, 64K, 2M, and 1G in round-robin order
> +	 */

if (xe_debug_page_size_supported(xe))

wont it be better to use string names instead of values for debugfs 
read/write ?
something like none, 2M_pages, 1G_pages, mixed_pages



> +	if (IS_DGFX(xe))
> +		debugfs_create_file("page_size_alloc_mode", 0600, root, xe,
> +				    &page_size_alloc_mode_fops);
> +#endif
>   
>   	/*
>   	 * Don't expose page reclaim configuration file if not supported by the

