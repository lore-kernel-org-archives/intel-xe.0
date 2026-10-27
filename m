Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152F9606A31F
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 23:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LPVEWQvC
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D116410F88C;
	Tue, 27 Oct 2026 23:20:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1074E10F88C
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 23:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793143197; x=1824679197;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AnOJ7Thcd8zFU1MFDByEZynzCVfx98gWuj/S3piet7o=;
 b=LPVEWQvCx9FR8rhtyNgkAQFujXVFgkVBCh/0H5MBAmUKH3i311A4MhH7
 dEgINCTdfk5/qoXyVAMWECt7am2k+r+iJDbXkcdATw3Dmt81Zsh7vMeQq
 GzNeqUVq+BSX/qz8Qdq+iBeJlmi0x5MnHTGZa6D8NL5fGvkREPvGxMZ3q
 DYIUmaouFxGKZZfpAHnsMonEtc7ijLUo7fSP8G+fRRqVGGoiaRIjHdcs4
 b+HhYxO2yMzzQII3qXtOzJ9DC93WGbn5mLdmUHKPAszuMz1OEQM8XZdgt
 RIWOPC+oSD43JklooNbScaxDXvH34cBxrNQJGtMG3U1B8kJaEfO+ZAmG3 Q==;
X-CSE-ConnectionGUID: Da3hfhzmRtyOn+05weEjYA==
X-CSE-MsgGUID: GvtJibmeRwWO+edl2Hda1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1864108"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1864108"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 16:19:55 -0700
X-CSE-ConnectionGUID: q8wrAJ+tT6+KUjw3/ygkvQ==
X-CSE-MsgGUID: LwlIfYq/RzCmd8jqkBgN2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4727981"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 16:19:54 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 16:19:54 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 16:19:54 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.24)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 16:19:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vWfYD58IuNL1FTuXvuzLNbgUy9heROARx+VtTq+jHqNqbpl/UvSBfHNbsUlflaxsIH5HHHNUoOKVWbtOTRpW9iHWg95BwyEIlnMHlJRynXYWWVNB85IVNgzVq/ltrqFY+8uwRWjdiFNoo/KdakBCg1jayYh5n3HV592kN9PjknQKnCiVAalnimg1cBcZ6cfppoQKLFeaWTr9gp+M4j39+vR+xlk/mmpcevCGdius1JFR31iscFh8a7qHOfGwwPjgSMN/UzisdOMYuzGn9E32TUB8VKKhjdHKC/mb9jtuiZcQgzqro0TXhmE4nN5X9svaUseZLziWdhrnuA0FJr//kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=458f5e9qXfzivI7wnOlMwOaggERi/aT4S2u3z70pNGs=;
 b=jwlO9Z7A8u1QTK+Ro5ID6w21x2nXYzwSht4ZBPubmM1m/7JzhFWmJj0hieK79cKURJ3E4VdiaMyEZsqzkavddhj/3vft7v4WC4k02+s2vQk7NP6ML1tCaXHOlaYYws+vffi6OV+92A0J1qb3rIc/kUzXN7cQGoZZmt4tA13PQsU2hQoyEIuOM+834MxwlYo+uqEUZnGVdkmAsVclhvOzeebpx5SDWegjcm6xsK5/vTItR1Vn5IGs13v18JoI3iVGE1eWVgPakhKYwiW8yH2wlu2k5XcHwC93hwpHiwpvgQ8y0iO/V2gdkTUK2q32iWenWjB1HFiw4bdjM7n9eViDnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 by IA1PR11MB6394.namprd11.prod.outlook.com (2603:10b6:208:3ad::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 23:19:51 +0000
Received: from CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc]) by CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc%7]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 23:19:51 +0000
Message-ID: <482083e4-150e-4210-942d-b941e7c17b69@intel.com>
Date: Tue, 27 Oct 2026 16:19:49 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] drm/xe: Memset g2g buffer on resume
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>
References: <20261023111832.218750-5-vinay.belgaumkar@intel.com>
 <20261023111832.218750-8-vinay.belgaumkar@intel.com>
Content-Language: en-US
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20261023111832.218750-8-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0051.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::26) To CO1PR11MB4979.namprd11.prod.outlook.com
 (2603:10b6:303:99::16)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4979:EE_|IA1PR11MB6394:EE_
X-MS-Office365-Filtering-Correlation-Id: ecc7e52e-7c8f-4b8d-df51-08df3480cd40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|11063799006|261026121527099003|4143699003|5023799004|56012099006|261009223027099003|261021123027099003|261022105027099003|261022075727099003|10067099003|261021121427099003|22082099003|18002099003|6133799003|261026140227099003;
X-Microsoft-Antispam-Message-Info: uzAguRsgzDQXB52bCL0Po8Fmc6rokV5kA72P6JGXtIgZc7KgN2wDifiYHHMstUNEL7i2tjQz+gLd2wk07jPZJkbb4LPb5R/FSRM5wXqZXW/v0Guyn0ooLT9ZODU58WhV3AVhMjc6qZ172s3jmau9NzoLmEbEX4X1edbZarJpy3IbAnZw9Ho9kkfDODUso0Wh1tfgm9pwS2fexHVA9jX1z7q7sp+lWJBXZyhA2Alvcr+b9yH3U/JqvTyAASIksxkYPST/NZ82sxhF4AFoWFxxzNd/X2tZVQWJNyL106fflIj0X5tG92a7/v7nC0GBQw5YQE4yb/ExCXW01ROkR4X3wmKCtq7NG6l6J1+ja46nU/MLAfsOtDvjKHCJqZRF+tzOmvOcrceKsDl5zVorsbNvZh5E9ACmVVqTbmVfNHe0Yg1pvJ5qwYpQ7nbSF5INeo1N0nAlaBqHBSIPYUbOMLmgt9zC/ps6/upKnc4jMQjcyKI9XeXneZaI9A+La7KMzXKlhII5eQnxEE3wgtPPv9R6em4TN/0jOVLeVQOwAcTTgxFCm9+0QCGTYz7aq+NZbQeFHbEEXP0M4YfubRV7ddw0PTjtLt+IGZqSpPBN2AoG/30c/+oocppYkDpN4vFsOhS8bdj5PDxDxNozK3aaUqKWLUP/5PbniD+xlqkZmsdc7tg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(11063799006)(261026121527099003)(4143699003)(5023799004)(56012099006)(261009223027099003)(261021123027099003)(261022105027099003)(261022075727099003)(10067099003)(261021121427099003)(22082099003)(18002099003)(6133799003)(261026140227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0VpbUswNkZZNVJtYzBjby9DUDFYK0h3dTFzeVdDQllScG9lUlVIeGVCMUJk?=
 =?utf-8?B?NTl6T0xIQ3RqMkVyNHFVMkxLemhZK2x2Y1dNVHFKeEZSOWFKOTFhTzNtdFFL?=
 =?utf-8?B?cWRZUVFpZElLVU9lUTIycGgvUEN5ZjVzWEdTZWUwUnNLd0NKak80eUVBQVh2?=
 =?utf-8?B?OUdpQUF6NUlJN281bklYUlNBTmgzbVFyWERWeDFqNXkwaGlsY01Va04zRWI5?=
 =?utf-8?B?QlJ0OUp5QldMNjR0d2tBZVUrUnRaUDhUY1EvVTJZaTlaQXJpRUdrKzh5TkhF?=
 =?utf-8?B?TFZlY1lpbVpQbnBEdUFqak1tdzdCeEd0bkdJbXZiR214dStlQzhzdGlrdnBi?=
 =?utf-8?B?eHNzRUpJWHpxNllIZ1R6eTVLdlZzcHYzR1hrbDlNVkdqUW1IV1ZMbThzeEMx?=
 =?utf-8?B?MXdET3F0RjF1dnBvZEdoWmQ5VG8yMkhVZnAyVXdyZHJtNnBTbk5MQWZ3QnBv?=
 =?utf-8?B?Z0JQQm9xeVlDaUVIYmlMN1hVUDZuN1JnN2xpV2VuNEhQRkx5UmJPeS85VENr?=
 =?utf-8?B?Y1VYTEZZYURDZk91eWc2WUE1OWFVaUtDaGJNU3JyVDM3NGpzcWp1RG0vczYx?=
 =?utf-8?B?dmI1aGQ3aEtiVHVqSmpNN1B5QXVrSUxxdnZlUzh1REFzZlNKcDNraXlHSU1T?=
 =?utf-8?B?Ky94eWY0OUNMc0N5WGM0T21wL2xndllTRm5paENNYkVFcEtPUkR6SkRTdHJ1?=
 =?utf-8?B?Ti84RUtwTVFjaG1USEtVbjd5MHRnTGRSaTFRN3F4ZVlpTTU4SXVZU1JVUlV3?=
 =?utf-8?B?dmxpYUhrM1FxTlVGWnE3WlgyVXJ4ME5wT2t6eTRzVnhwa2sxNHpVR0h1M2tY?=
 =?utf-8?B?REF5TWdRWjVZZmhGUVUvWlJWYWhCQzNNWFFJbjNZMndEWEJkTUhzakVFbkdV?=
 =?utf-8?B?MDhjWkpTQmpIZnFvdlVaSFhiaFEraVd1RHluL05mRml1ZURVRXN1Yzl1RHRv?=
 =?utf-8?B?S1pCSjRZakxKY3c2ZDdGQm1HeW5aZU5LMlZXQnZ5Z21KdytWRHRMNFQ1bnVn?=
 =?utf-8?B?ejBVUlVDR1E5aFBuc2w1Y3NkTllMVk1jdHpteW9sK0s4RVA0em5OWDlJS0RF?=
 =?utf-8?B?bmZxMElOb2F3RjU5b0syT0UxUnBnaG9XVFp4MmhyMzNSN0xGa0U5V1hyMW1S?=
 =?utf-8?B?NEdQcXlubFN6dnQxUGdidVVMODhmWE9CcUJGdmhsaTd4VTUwbWRCenRJTkZv?=
 =?utf-8?B?c3VkUzRXZnJURHoyMHJacG9tcStSUytPYVh6ek1QTkcwUW9ZRUIrTFN4QmNv?=
 =?utf-8?B?cmhwcGhSWEc0eWNTeGx6RnplTXd0cTN2MWJOYnhLalMxNmxGbU11K3NJV3dM?=
 =?utf-8?B?OHJSdFYzWXMxbUE5ZkZSalA0NFJOTFoxRlRxcG81V0dLUVc1NmsveEFEZkJt?=
 =?utf-8?B?cUZ4ZGhQRHk3RmM2Q2FWaWtKUWI5cy9qNFU0eG9tMWxCeE9KOFUxV3U5ellS?=
 =?utf-8?B?SmNWbmZrVXc5UEpyMUt0WlB0MFE2QzhqTWRjUVgwWDlxaEFTRi9DOGFQOFRn?=
 =?utf-8?B?Y1BrcE9KZDFBZG5nYmVsdXV3VEY3QUJadTRwM2VHSytxQUdBbGcrRHZkOUpM?=
 =?utf-8?B?UzFXWjQwamhDZWphcXRxMHRRMnZteFdrM0FjMjcwN1I4Y0dOWlRaMHJ6a1Bt?=
 =?utf-8?B?ckdSZzJYNUNWb0dnUExVbGd2dlZmSCtaZ2xWMkc4c1hKYXFESTZZWjJSQ2dC?=
 =?utf-8?B?OXJKRjJ2MGhnd1pUYnpRdE5uQ0dJQ0R1ZUk0L1FMWm4yUDJTTm1xdmpaSUtR?=
 =?utf-8?B?QWp3TURrdzFJTUFWUWx0UlVLQ2FzczY1b2ZiMmRQc0UzUXo1aXJxRndwaWps?=
 =?utf-8?B?K3dqRGVtSThPMHNIRjRER2JxeUoxNE9aNG9TblpoSVgzVDliNHpWWm1veGtY?=
 =?utf-8?B?cktHSGw1MHR2a3c5Qjh5SnlvZVpkTVlma0ZSaTFBa0VSVmJqcWY2WEp1K2J6?=
 =?utf-8?B?OEhoSDVHYnQ0K1FxeWtkcDR3Qkwzc25GbUphTzJ3YUlRcFk5Q3hGbkpLUGxo?=
 =?utf-8?B?UjMwOFpqQkozL2VROW5Ec0s3eUhXb2FXL0hKZTR4cS9ncGxTZGp3SzhmbTZN?=
 =?utf-8?B?M3FvcVBudUo4bGVvRDA3S3lSUStaUmVXL2UzQ1hYaU5GcVhDMldHQldiY05q?=
 =?utf-8?B?T1R1SXh5U0szVklieWlDb0NVUndhWkc0UDhiSzhWU0dhcFYybzBQYXlYdVlU?=
 =?utf-8?B?UklvVU04TlYySDNqajI5UnhkRTZ3ZDlFd0ppaHFWTzJ5ZUZPclRKc1F3Mytv?=
 =?utf-8?B?N1VBRUt3NkF1Um9nRXBWSVRpMEs3MVV5S1NvT25LUFFrbkFvVHRuNFNCdlBI?=
 =?utf-8?B?cEJzU2MwMFFhbEJqNktLTEpyZlpacFBaYTJxZmFyOXRndnM5dGhKYVJYSEhv?=
 =?utf-8?Q?/G5xXsKTLyKBU4bM=3D?=
X-Exchange-RoutingPolicyChecked: e4+Jx0C4vheBusT4A8fZ7Tv87zXwom0VE6flTmpom9NgyKrf1WRaX+vk8xLGhR3ILe4xWipowwW35q8zvWDQn0NvHZWn6/+mgjAo3S5tg9UpJt/s6pPkxIkbMZ3KRs/5gfUHraBoi57ToqYydQdZ4JLNy1gWyC3hK4XDDXuOwzzJu5NbUa2/0fYbywWziolOwVwKL9GIDVBXD2VB7M1Z+zVmF6EPYHSfspfRAn0gvtPom5qPlQnc7TEm//HKunz8G92eVldt6oiP7at+ic0alyx55vozS7T1lmjRzJmZWEunX3H7oXLkngsHcDABq8/tnv6mklwuowDeUmuMVFwZEA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ecc7e52e-7c8f-4b8d-df51-08df3480cd40
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 23:19:51.4824 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /6ubx/MAYPvCVfgsugu1hAATovMPltptTFS4zbbELvqcaHmv9hApMK/zhqFkwIEo9QKBtcST6PPaMgaSD8ejEZmc9rQ+lj6FQxkWj0wIH4k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6394
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 10/23/2026 4:18 AM, Vinay Belgaumkar wrote:
> KMD creates this buffer for use by GuC, it is also responsible for zeroing
> it during resume. The buffer is marked as XE_BO_FLAG_PINNED_NORESTORE,
> so we cannot trust its contents after a suspend cycle. This commit adds
> xe_*_resume_early() functions for handling this and the C6 disable
> during resume.
>
> v2: Maintain layering with _early functions for gt/uc/ct (Matt Brost)
>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt.c     | 14 +++++++++++++-
>   drivers/gpu/drm/xe/xe_gt.h     |  1 +
>   drivers/gpu/drm/xe/xe_guc_ct.c | 16 ++++++++++++++++
>   drivers/gpu/drm/xe/xe_guc_ct.h |  1 +
>   drivers/gpu/drm/xe/xe_pm.c     |  4 ++--
>   drivers/gpu/drm/xe/xe_uc.c     | 15 +++++++++++++++
>   drivers/gpu/drm/xe/xe_uc.h     |  1 +
>   7 files changed, 49 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 60d35ada2853..96b5702347c1 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -50,7 +50,6 @@
>   #include "xe_lmtt.h"
>   #include "xe_log.h"
>   #include "xe_lrc.h"
> -#include "xe_map.h"

This seems unrelated to this patch

>   #include "xe_migrate.h"
>   #include "xe_mmio.h"
>   #include "xe_pagefault.h"
> @@ -1093,6 +1092,19 @@ int xe_gt_sanitize_freq(struct xe_gt *gt)
>   	return ret;
>   }
>   
> +/**
> + * xe_gt_resume_early() - Early init for GT resume
> + * @gt: the GT object
> + *
> + * Handles GT related init before GT restart after a suspend cycle.
> + */
> +void xe_gt_resume_early(struct xe_gt *gt)
> +{
> +	xe_gt_idle_disable_c6(gt);
> +
> +	xe_uc_resume_early(&gt->uc);
> +}
> +
>   int xe_gt_resume(struct xe_gt *gt)
>   {
>   	int err;
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 7b6952fe804c..7d292f9d0be7 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -58,6 +58,7 @@ void xe_gt_record_user_engines(struct xe_gt *gt);
>   void xe_gt_suspend_prepare(struct xe_gt *gt);
>   int xe_gt_suspend(struct xe_gt *gt);
>   void xe_gt_shutdown(struct xe_gt *gt);
> +void xe_gt_resume_early(struct xe_gt *gt);
>   int xe_gt_resume(struct xe_gt *gt);
>   void xe_gt_reset_async(struct xe_gt *gt);
>   int xe_gt_runtime_resume(struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index d42f0133c1eb..435b10c29e24 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -863,6 +863,22 @@ void xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct)
>   	xe_guc_ct_disable(ct);
>   }
>   
> +/**
> + * xe_guc_ct_resume_early() - Early init for GuC CT resume
> + * @ct: the &xe_guc_ct
> + *
> + * CT init before GT restart after a suspend cycle.
> + */
> +void xe_guc_ct_resume_early(struct xe_guc_ct *ct)
> +{
> +	struct xe_guc *guc = ct_to_guc(ct);
> +	struct xe_device *xe = ct_to_xe(ct);
> +
> +	/* clear the g2g buffer which is marked as NORESTORE during alloc */
> +	if (guc->g2g.bo && guc->g2g.owned)
> +		xe_map_memset(xe, &guc->g2g.bo->vmap, 0, 0, xe_bo_size(guc->g2g.bo));

g2g has nothing to do with CT, so this should just be 
xe_guc_resume_early in xe_guc.c.

Daniele

> +}
> +
>   /**
>    * xe_guc_ct_runtime_resume() - GuC CT runtime resume
>    * @ct: the &xe_guc_ct
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index f3af15c95c75..3470ced126de 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -20,6 +20,7 @@ int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct);
>   int xe_guc_ct_enable(struct xe_guc_ct *ct);
>   int xe_guc_ct_restart(struct xe_guc_ct *ct);
>   void xe_guc_ct_disable(struct xe_guc_ct *ct);
> +void xe_guc_ct_resume_early(struct xe_guc_ct *ct);
>   void xe_guc_ct_runtime_resume(struct xe_guc_ct *ct);
>   void xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct);
>   void xe_guc_ct_stop(struct xe_guc_ct *ct);
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 1f5097875bcd..89d64aa6577d 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -249,7 +249,7 @@ int xe_pm_resume(struct xe_device *xe)
>   		return err;
>   
>   	for_each_gt(gt, xe, id)
> -		xe_gt_idle_disable_c6(gt);
> +		xe_gt_resume_early(gt);
>   
>   	xe_display_pm_resume_early(xe);
>   
> @@ -703,7 +703,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   			goto out;
>   
>   		for_each_gt(gt, xe, id)
> -			xe_gt_idle_disable_c6(gt);
> +			xe_gt_resume_early(gt);
>   
>   		xe_display_pm_resume_early(xe);
>   
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 686c28856014..2dfd525dce6f 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -12,6 +12,7 @@
>   #include "xe_gt_printk.h"
>   #include "xe_gt_sriov_vf.h"
>   #include "xe_guc.h"
> +#include "xe_guc_ct.h"
>   #include "xe_guc_pc.h"
>   #include "xe_guc_rc.h"
>   #include "xe_guc_engine_activity.h"
> @@ -297,6 +298,20 @@ int xe_uc_suspend(struct xe_uc *uc)
>   	return xe_guc_suspend(&uc->guc);
>   }
>   
> +/**
> + * xe_uc_resume_early() - Early init for UC resume
> + * @uc: the UC object
> + *
> + * UC init before a GT restart during resume.
> + */
> +void xe_uc_resume_early(struct xe_uc *uc)
> +{
> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> +		return;
> +
> +	xe_guc_ct_resume_early(&uc->guc.ct);
> +}
> +
>   /**
>    * xe_uc_runtime_suspend() - UC runtime suspend
>    * @uc: the UC object
> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> index 23bc0ce1c42f..3c56327fb3f9 100644
> --- a/drivers/gpu/drm/xe/xe_uc.h
> +++ b/drivers/gpu/drm/xe/xe_uc.h
> @@ -13,6 +13,7 @@ int xe_uc_init(struct xe_uc *uc);
>   int xe_uc_init_post_hwconfig(struct xe_uc *uc);
>   int xe_uc_load_hw(struct xe_uc *uc);
>   int xe_uc_reset_prepare(struct xe_uc *uc);
> +void xe_uc_resume_early(struct xe_uc *uc);
>   void xe_uc_runtime_resume(struct xe_uc *uc);
>   void xe_uc_runtime_suspend(struct xe_uc *uc);
>   void xe_uc_stop_prepare(struct xe_uc *uc);
