Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC07FEEF55
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 21:41:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F4EA10E4D9;
	Tue,  7 Apr 2026 21:41:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mZJ+NEE6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A1A10E4D9
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Apr 2026 21:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775598073; x=1807134073;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=WO1yYRquPl1pJwxK3rrXH2XC09teYH5nj9OzxXIrFfQ=;
 b=mZJ+NEE69Zu2ezlXbO1bXkhyRyJU05Ati2lzOZSKAJLK6y5NZoiN72o/
 rMmc6OTY2dMWJsmqUsjqXZ/JnGduh5r9IR/ZSlg6BIgyFRCGjks3NpPeG
 YT1gAGm9zePKKgexuvyVl+QJB1d5pWdNdOVNgK9Ei0dhPwsmKDh14ME/f
 gyoThCpOAjFvp8wFAFdwj07pVtzm0nGpnZ8Ha5vYdDaJmnq5WefSn2jHf
 /ICVFMgTVIG82KlQZHWnwTzGHQoP31xy1RvD6xwAz1tcBzdUWIpPIneJj
 NDFctO1Aoh684q1IK/Rb2s3atV/64Dq6Z/6N++5rXasdc+FbW454OBSSZ w==;
X-CSE-ConnectionGUID: 329FrnIFR56l7Tine6l+Ew==
X-CSE-MsgGUID: hNduXq0CQy2flcs7WZ1K3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76643937"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="76643937"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 14:41:13 -0700
X-CSE-ConnectionGUID: BQ56/z25Rl2FipdQESL48Q==
X-CSE-MsgGUID: 1iCmzBlGTpeJLe4T2/xuSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="232664427"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 14:41:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 14:41:12 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 7 Apr 2026 14:41:12 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.67) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 14:41:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SuZId3FQ/dz/+vugBgAayInPUvzLDIzvhmr9fONOm8ZV2JaZsdX6JlVgYK1FehFGqa3m/LQgDaoxuXGAR2RkNZ1uNGFUcWXBvTTgPWI8XUL1cDPc8QraT8ibo3CcuMk5c3qv+49wI4aWFhsVwK+isIFbigH7lHAGNmNSuYDYNdrOQ+H9A/I+wLEXHA3hYgt6Zys1WJISKpZsFFPJ3fraTrlmehHk4OXwKQ88rAtpHBzHhcMCJtm7hBB31E7AFox1yLTmhH71NLhiQuo9CGkwLm3nVcnK42lxF5LjXSAohvq+XOIBCcwks6louiKTfYvHiCIgRX5yhZBMYn8NAKeOuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3xVHEU6OjXpQtxZ79KD09Y4OMPuA8dvs3aCoyU/6LRc=;
 b=C4MP5YMh2zo9c2svzcmZWRixGRZXW2aJ7oD+1CqxXakwLSSEOpB+XNDwLVsmN8XXOp3ZcA929EVBj7afHKL8EZos1m3h/qqy44eq1hrfT4+VBY4N1llwER1ydi9CPZZHwt1ZXtHdEt+JhUYot73l1+k7CWEPOeA904j8G1q3hJ6sjhqdtdywrqbtcDjT5zcys1OKaeIJg4Hb5Jg87oSC0VS8ewpYwdFAjDRKsqkJSU9wM6m6mnompTCW9nqSv8NBmPdmKE6LV0N0zZL4BGoJtZ3LMMRtJKBMhjK+0UzuodB5Xv52HHhGD2RaYj/NVJ9UvPJKp1n7uuBHmMGB8+jJyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by BL1PR11MB5222.namprd11.prod.outlook.com (2603:10b6:208:313::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Tue, 7 Apr
 2026 21:41:10 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286%4]) with mapi id 15.20.9769.020; Tue, 7 Apr 2026
 21:41:10 +0000
Message-ID: <ca4207f5-0455-4d7f-b1c5-9a4642b3803d@intel.com>
Date: Tue, 7 Apr 2026 14:41:08 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] drm/xe/uapi: Fix kernel-doc cross-reference syntax
 in xe_drm.h
To: Shuicheng Lin <shuicheng.lin@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260407030046.3394004-1-shuicheng.lin@intel.com>
 <20260407030046.3394004-5-shuicheng.lin@intel.com>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <20260407030046.3394004-5-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0333.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::8) To SA3PR11MB8046.namprd11.prod.outlook.com
 (2603:10b6:806:2fb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8046:EE_|BL1PR11MB5222:EE_
X-MS-Office365-Filtering-Correlation-Id: 79d518a3-1938-4552-eef4-08de94ee61db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|42112799006|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: OzrNBU156+8BOocXQRD/0dhkRQKvW+ua1e856NNCATGX7QiO6ex1uw1492b/SvMNM3vUqeTlJ9KgEsSIRrzBE1Vm/hXL9AeMIV2Evtc1uNEwmGI7UmFOyCD6VdfsvMw26Mr+RTsyewYz76EQN4/2XmDcuF0CmLpBv6IBj/WXGBmPlKC2vFORgyzWv+NptkY8qfUa8ThQBg2IZFU0MYM+rV9NrWYJnaOQdCv98KqhuZF8na0T4XJ+thi+SXA5Qej+luZ0acCicJ/z79iuLAfIlG9Ni5WknLhT9/wGMzutftE/FgQXhWB8g0ca3eNnARQ2NONCuRoWP4ScOiM7alyaxUvokbyayvtRJ33V+4Hwp1eiswO3c1TZsFr2cOSJE9UWF9gOspixA3x1fPbfvuYtcoQlJ6DuifEosK4iZ2nAuo1CcTkBPLda86HQWt3Bqd2STxTwVhOZx+PkeYF3S5Qmfi3x9YeeBPoKQclBgsqMvBsE1DteC6ZOiJ4f1ygp5pD7u/snAaACdkBSLlxFQYvY6W0km6S2v3RvOKWZ4AVY7UOkGWIw2j3UX6vGtX63yFYQuhDd62EavYlI4DeAChZJxYJlz8Ni9St9MrsKUfF70kpKMJkoidazy2yyCuFPYfJB/zsXZhlfTNW6Ci5jeakyZLR68qqid66F+nziqQs/Zn3Q9qgWofxjY8ZbMdmQ5Steg2layYLcQhuVQmw1bcaj517/GTz4so+oSp1oyYUMRb0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(42112799006)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VU53K2Qzck1yS2FHbDBWODJkdi96MUx5RG9zNHBXalRib3FCWVExVGpEZ1dF?=
 =?utf-8?B?cFczRUZCWURFUHgwYnd6Zjg4SExtSWNpSjQ5ZlM2dTd4bmRrZW44Z09FQzZN?=
 =?utf-8?B?L3duWFBXL0dwN011UTlPd0UxSDhRdGFqL24yUVppNzF1UmlZa0NzS1RZTEhk?=
 =?utf-8?B?NFAxc1h6amFKNEdTam5CTDVYODcyMXhDN2gxMmVlMWNZcTdJMTVJWCtOY21i?=
 =?utf-8?B?Q0MwS1h1akNFeGV1WUhGMFJ0UXB2ZmhzMUwxMVJUK2h5NEVneDFFQU94SkFR?=
 =?utf-8?B?SElwYVNFdUIzMFlPYnlnb1hKRXl6U09lRm9OblQ2R3ZJY1hZUWV6ODJoS0Rr?=
 =?utf-8?B?SGNZR3ZLNC8rZWlXbStzTmNCdHo0Yzlpd3FkZ1RVQ3VVNnFRL29IZXpITENX?=
 =?utf-8?B?R05oTWRCSTFtbVhjbCtKNGl0SFB0bWphRGtRQTFpL1VDTjUzYi9ScStTV3A0?=
 =?utf-8?B?RFJ4MlRNQlBaSjl0YzVXRmViSGJLZDk0RGs0VFh3UytLWkFIK3FWTGVJNXVW?=
 =?utf-8?B?ZVhFaldBQnVqSi83cVJ2dW12eGE1RlFFTHAwbzdnVjdxVGRUYmFIMTNFanNx?=
 =?utf-8?B?MXdBSFdXemkyQ0p1eGR0MmJLa2Z4L3RydkFubFVrWGtmV0ozUVZvN0ZYckJs?=
 =?utf-8?B?V0VvYSt0azE1dmRTRWtxUm9Xd0pkRDRwbjJFNW5iSnJSdkEyY1NYWnVFWDZV?=
 =?utf-8?B?b0pBbE9abmdqbG9mVllmZWZRWGQ4dm5VT0h0cVZTTXBmT2ZjWGdDY0JNVk1h?=
 =?utf-8?B?VFhIcHFSU2tsb2JTKzhmclA4WXpjVUNMY2h2RHlpRWk1ZFRDYUlFVXUrcVlk?=
 =?utf-8?B?ZTQ3dWl4T084WWR5dUx3L0s3OFl4VXhrVUw4c2RGenR6OUp3SWdmdFVLbjVm?=
 =?utf-8?B?S1RSQ0UxQ3QzZG9ZdTc4dzJjN3I1MThVanA0UlRTbldPSVgvUDRtYVhZRlVD?=
 =?utf-8?B?QXFrUUE3d2JRQ2pETXFtUWJaNzBXZGdUV0hWd3R4d002UHk1RTEwenhEMWhM?=
 =?utf-8?B?SUNXYlRNdlVldVR6YWJUYlBwM0l5NFNMQlpyMDZDemlYc3ExN0dWUTlpbVlP?=
 =?utf-8?B?cDlJUHpQck1ib0htMDhkTDJLZHpna1dWNEFIUjQzSlNTbFFMYkwrREp3UjJo?=
 =?utf-8?B?U2RWOFcxT3lWeUN5bXhySkRJNDNPeUFVOVh1b283UU9hQllMRnllNDF3a3Nj?=
 =?utf-8?B?N2Vjbjd1UHkwcFRNdVd1bk80UXpOZkdSVHRiWkpITDMwbk0xQjdEdURMZFBp?=
 =?utf-8?B?dHZxRUZZbUltMHJwZWw2WGx1bGVwZnlrclRvVlFkay9FOVIzL0dyU3ZZMEFS?=
 =?utf-8?B?M0RQcFBxK2RsT0t1dTlPZUQ5ZTR1SFBMQ0JDeEVvWi82RHV4OGJKR1M3RG02?=
 =?utf-8?B?NkFacExER3lCVlRoRW1maHgxcVpyRVlwdURxa1hQN0QvTnVuNzN0VmxmQ3Bm?=
 =?utf-8?B?ZTZMREhHaDAvN2ZqYmt4czhkMVdGTkY2OE54YWsySGpqZVZNa1RDcDZrVVZW?=
 =?utf-8?B?ZlFQR0ticHRNOWFBekRCWlZrK0R3U1FBQlphYkhyYkhaRWlucHcwSExlbkdU?=
 =?utf-8?B?bGhQaDBMSWE0ZmRtK1RXUTFHMnB0MzZSUmNhTzV0WTlEbHFtQTEweWcvU3Jl?=
 =?utf-8?B?WGwyUmFzaDROVUlZcmZHK1dCRjEwNUZHTUZmZndTZHpwRWxFSSt0NmRMaDNt?=
 =?utf-8?B?OXdITTZRMDY0aVRuTWgwZy9lWUx0cEhIREZoTHhhaytQamhjblNub3dxVDFS?=
 =?utf-8?B?MHZMckhJeXRjV2szNXMwaEQ2bGkzTURtY1ZQaU5Cclc2dk8wbWQ2STFYUkVq?=
 =?utf-8?B?SUFxS0d6NER3dUYxdzBIYWUxeHc0Yk0xNEpxS3MwRnllR3VRRHo1NUNjcW41?=
 =?utf-8?B?WHhCMURicUtjUlBtNTd6WTRQZ0NwdEhJclFtY3ZLNDhiQ0JyUVVqWXNSMVIv?=
 =?utf-8?B?QlBuQ1FKRFQyTWk2dzFLbDl5MnZLK2FvS3NIelVhV3B5VFEwY3Y1Ylp6aXd0?=
 =?utf-8?B?L3dqR0lDOHVGVWttVm54RmQvT1dYZmM1R3o4VktPbE01clQ2UVp5VVhGa0sx?=
 =?utf-8?B?M3h3VlF0THR3MkY1ZzJrYTNCWFhRN0IrSUVWY3NQcHN3ZGpLcW52QUpOM0JG?=
 =?utf-8?B?ekZvQk9hYU00Vy9SZElja3I0dmdBVjNPVmpLWUpoV3BLTUhJVmxuRGRPN0NR?=
 =?utf-8?B?UlY5aW5Rd0d3VTlVQWYzZkNvWmFZYnBoZEl5V2IrU2VjTzdoMkJYb2lPQVFU?=
 =?utf-8?B?c0N2OVROdHMzTnlKRUY2dmphaVd2M3NIVzRjSGNYVmIxV2RtZnh6NnZGVW9X?=
 =?utf-8?B?c1dtY2RVZlI3YmIxRnlEakhnUGJQRWlQV3RqQS9qRXVBdjdLUVZhZz09?=
X-Exchange-RoutingPolicyChecked: M5k7gWk1hF0HtvjMAfp9XbYk4UMiDzb2tnUfvY+6ECafWa6BvUA+DA1xpt9f3ikTEXTxYWvO4n11e08h1WmoyqymfqztWFzwrIbpj+qIXM6fxWKm4TgOxOnZu1cmoNFw1AnvZCggifA/FJPuTpT3Qy89Shv3vq3mIQ2J+vui9/8PewBUNfVJ3ke6yBQEI0z9i7voLgYIbYniN4zPmtRnhN8SlmhQazd0npxgArUpMf+FRPcvzIuG8zJMOKmvZ/I6vyJvVGQC6yHceUlApgroa9938dOB9XRJ6p32hFygKoeNDhkYQxiJEZJ+UEngEuVe5l/Lo6e5PmC/o3PG0PZesg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 79d518a3-1938-4552-eef4-08de94ee61db
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 21:41:09.9451 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h2butGNijf33P4g0qiRD+hrlxWN8GAoAXVkc3j/w4+PolnfPDczKFD4nn67p1VTX0hZLA5jq1j1hBQpC0iw2+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5222
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


On 4/6/2026 20:00, Shuicheng Lin wrote:
> Fix incorrect kernel-doc cross-reference markup syntax
> throughout xe_drm.h:
> - @struct_name -> &struct name for cross-references to other
>    structs (19 occurrences)
> - struct @name -> &struct name where struct keyword was
>    mixed with @ syntax (8 occurrences)
> - enum @name -> &enum name for cross-references to other
>    enums (5 occurrences)
> - &CONSTANT / @CONSTANT -> %CONSTANT for defines and enum
>    values (15 occurrences)
> - @field references to members of other structs -> plain text,
>    since @ only applies to the current struct's members
>    (9 occurrences)
>
> Per kernel-doc conventions (Documentation/doc-guide/kernel-doc.rst):
> - '&struct name' creates hyperlinks to struct definitions
> - '&enum name' creates hyperlinks to enum definitions
> - '%NAME' references constants and defines
> - '@name' is only for parameters/members of the current context
>
> Assisted-by: GitHub Copilot:claude-opus-4.6
> Suggested-by: Xin Wang <x.wang@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>   include/uapi/drm/xe_drm.h | 106 +++++++++++++++++++-------------------
>   1 file changed, 53 insertions(+), 53 deletions(-)
>
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index ad8e3b69a3d7..8751ad7b845f 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -229,9 +229,9 @@ struct drm_xe_ext_set_property {
>   /**
>    * struct drm_xe_engine_class_instance - instance of an engine class
>    *
> - * It is returned as part of the @drm_xe_engine, but it also is used as
> - * the input of engine selection for both @drm_xe_exec_queue_create and
> - * @drm_xe_query_engine_cycles
> + * It is returned as part of the &struct drm_xe_engine, but it also is used as
> + * the input of engine selection for both &struct drm_xe_exec_queue_create and
> + * &struct drm_xe_query_engine_cycles
>    *
>    * The @engine_class can be:
>    *  - %DRM_XE_ENGINE_CLASS_RENDER
> @@ -264,7 +264,7 @@ struct drm_xe_engine_class_instance {
>    * struct drm_xe_engine - describe hardware engine
>    */
>   struct drm_xe_engine {
> -	/** @instance: The @drm_xe_engine_class_instance */
> +	/** @instance: The &struct drm_xe_engine_class_instance */
>   	struct drm_xe_engine_class_instance instance;
>   
>   	/** @reserved: Reserved */
> @@ -274,9 +274,9 @@ struct drm_xe_engine {
>   /**
>    * struct drm_xe_query_engines - describe engines
>    *
> - * If a query is made with a struct @drm_xe_device_query where .query
> + * If a query is made with a &struct drm_xe_device_query where .query
>    * is equal to %DRM_XE_DEVICE_QUERY_ENGINES, then the reply uses an array of
> - * struct @drm_xe_query_engines in .data.
> + * &struct drm_xe_query_engines in .data.
>    */
>   struct drm_xe_query_engines {
>   	/** @num_engines: number of engines returned in @engines */
> @@ -825,7 +825,7 @@ struct drm_xe_device_query {
>    *
>    * This ioctl supports setting the following properties via the
>    * %DRM_XE_GEM_CREATE_EXTENSION_SET_PROPERTY extension, which uses the
> - * generic @drm_xe_ext_set_property struct:
> + * generic &struct drm_xe_ext_set_property:
>    *
>    *  - %DRM_XE_GEM_CREATE_SET_PROPERTY_PXP_TYPE - set the type of PXP session
>    *    this object will be used with. Valid values are listed in enum
> @@ -1198,10 +1198,10 @@ struct drm_xe_vm_bind_op {
>   /**
>    * struct drm_xe_vm_bind - Input of &DRM_IOCTL_XE_VM_BIND
>    *
> - * Below is an example of a minimal use of @drm_xe_vm_bind to
> + * Below is an example of a minimal use of &struct drm_xe_vm_bind to
>    * asynchronously bind the buffer `data` at address `BIND_ADDRESS` to
>    * illustrate `userptr`. It can be synchronized by using the example
> - * provided for @drm_xe_sync.
> + * provided for &struct drm_xe_sync.
>    *
>    * .. code-block:: C
>    *
> @@ -1354,7 +1354,7 @@ struct drm_xe_vm_get_property {
>    *
>    * This ioctl supports setting the following properties via the
>    * %DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY extension, which uses the
> - * generic @drm_xe_ext_set_property struct:
> + * generic &struct drm_xe_ext_set_property:
>    *
>    *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY - set the queue priority.
>    *    CAP_SYS_NICE is required to set a value above normal.
> @@ -1389,9 +1389,9 @@ struct drm_xe_vm_get_property {
>    *    enable render color cache keying on BTP+BTI instead of just BTI
>    *    (only valid for render queues).
>    *
> - * The example below shows how to use @drm_xe_exec_queue_create to create
> + * The example below shows how to use &struct drm_xe_exec_queue_create to create
>    * a simple exec_queue (no parallel submission) of class
> - * &DRM_XE_ENGINE_CLASS_RENDER.
> + * %DRM_XE_ENGINE_CLASS_RENDER.
>    *
>    * .. code-block:: C
>    *
> @@ -1514,7 +1514,7 @@ struct drm_xe_exec_queue_get_property {
>    * and the @flags can be:
>    *  - %DRM_XE_SYNC_FLAG_SIGNAL
>    *
> - * A minimal use of @drm_xe_sync looks like this:
> + * A minimal use of &struct drm_xe_sync looks like this:
>    *
>    * .. code-block:: C
>    *
> @@ -1580,10 +1580,10 @@ struct drm_xe_sync {
>   /**
>    * struct drm_xe_exec - Input of &DRM_IOCTL_XE_EXEC
>    *
> - * This is an example to use @drm_xe_exec for execution of the object
> - * at BIND_ADDRESS (see example in @drm_xe_vm_bind) by an exec_queue
> - * (see example in @drm_xe_exec_queue_create). It can be synchronized
> - * by using the example provided for @drm_xe_sync.
> + * This is an example to use &struct drm_xe_exec for execution of the object
> + * at BIND_ADDRESS (see example in &struct drm_xe_vm_bind) by an exec_queue
> + * (see example in &struct drm_xe_exec_queue_create). It can be synchronized
> + * by using the example provided for &struct drm_xe_sync.
>    *
>    * .. code-block:: C
>    *
> @@ -1749,9 +1749,9 @@ enum drm_xe_observation_op {
>   struct drm_xe_observation_param {
>   	/** @extensions: Pointer to the first extension struct, if any */
>   	__u64 extensions;
> -	/** @observation_type: observation stream type, of enum @drm_xe_observation_type */
> +	/** @observation_type: observation stream type, of &enum drm_xe_observation_type */
>   	__u64 observation_type;
> -	/** @observation_op: observation stream op, of enum @drm_xe_observation_op */
> +	/** @observation_op: observation stream op, of &enum drm_xe_observation_op */
>   	__u64 observation_op;
>   	/** @param: Pointer to actual stream params */
>   	__u64 param;
> @@ -1810,7 +1810,7 @@ struct drm_xe_oa_unit {
>   	/** @oa_unit_id: OA unit ID */
>   	__u32 oa_unit_id;
>   
> -	/** @oa_unit_type: OA unit type of @drm_xe_oa_unit_type */
> +	/** @oa_unit_type: OA unit type of &enum drm_xe_oa_unit_type */
>   	__u32 oa_unit_type;
>   
>   	/** @capabilities: OA capabilities bit-mask */
> @@ -1873,7 +1873,7 @@ struct drm_xe_query_oa_units {
>   	/** @pad: MBZ */
>   	__u32 pad;
>   	/**
> -	 * @oa_units: struct @drm_xe_oa_unit array returned for this device.
> +	 * @oa_units: &struct drm_xe_oa_unit array returned for this device.
>   	 * Written below as a u64 array to avoid problems with nested flexible
>   	 * arrays with some compilers
>   	 */
> @@ -1902,22 +1902,22 @@ enum drm_xe_oa_format_type {
>   /**
>    * enum drm_xe_oa_property_id - OA stream property IDs
>    *
> - * Stream params are specified as a chain of @drm_xe_ext_set_property
> - * structs, with @property values from enum @drm_xe_oa_property_id and
> - * @drm_xe_user_extension base.name set to @DRM_XE_OA_EXTENSION_SET_PROPERTY.
> - * @param field in struct @drm_xe_observation_param points to the first
> - * @drm_xe_ext_set_property struct.
> + * Stream params are specified as a chain of &struct drm_xe_ext_set_property
> + * structs, with property values from &enum drm_xe_oa_property_id and
> + * &struct drm_xe_user_extension base.name set to %DRM_XE_OA_EXTENSION_SET_PROPERTY.
> + * The param field in &struct drm_xe_observation_param points to the first
> + * &struct drm_xe_ext_set_property struct.
>    *
>    * Exactly the same mechanism is also used for stream reconfiguration using the
> - * @DRM_XE_OBSERVATION_IOCTL_CONFIG observation stream fd ioctl, though only a
> + * %DRM_XE_OBSERVATION_IOCTL_CONFIG observation stream fd ioctl, though only a
>    * subset of properties below can be specified for stream reconfiguration.
>    */
>   enum drm_xe_oa_property_id {
>   #define DRM_XE_OA_EXTENSION_SET_PROPERTY	0
>   	/**
>   	 * @DRM_XE_OA_PROPERTY_OA_UNIT_ID: ID of the OA unit on which to open
> -	 * the OA stream, see @oa_unit_id in 'struct
> -	 * drm_xe_oa_unit'. Defaults to 0 if not provided.
> +	 * the OA stream, see oa_unit_id in &struct drm_xe_oa_unit.
> +	 * Defaults to 0 if not provided.
>   	 */
>   	DRM_XE_OA_PROPERTY_OA_UNIT_ID = 1,
>   
> @@ -1930,7 +1930,7 @@ enum drm_xe_oa_property_id {
>   
>   	/**
>   	 * @DRM_XE_OA_PROPERTY_OA_METRIC_SET: OA metrics defining contents of OA
> -	 * reports, previously added via @DRM_XE_OBSERVATION_OP_ADD_CONFIG.
> +	 * reports, previously added via %DRM_XE_OBSERVATION_OP_ADD_CONFIG.
>   	 */
>   	DRM_XE_OA_PROPERTY_OA_METRIC_SET,
>   
> @@ -1938,7 +1938,7 @@ enum drm_xe_oa_property_id {
>   	DRM_XE_OA_PROPERTY_OA_FORMAT,
>   	/*
>   	 * OA_FORMAT's are specified the same way as in PRM/Bspec 52198/60942,
> -	 * in terms of the following quantities: a. enum @drm_xe_oa_format_type
> +	 * in terms of the following quantities: a. &enum drm_xe_oa_format_type
>   	 * b. Counter select c. Counter size and d. BC report. Also refer to the
>   	 * oa_formats array in drivers/gpu/drm/xe/xe_oa.c.
>   	 */
> @@ -1955,19 +1955,19 @@ enum drm_xe_oa_property_id {
>   
>   	/**
>   	 * @DRM_XE_OA_PROPERTY_OA_DISABLED: A value of 1 will open the OA
> -	 * stream in a DISABLED state (see @DRM_XE_OBSERVATION_IOCTL_ENABLE).
> +	 * stream in a DISABLED state (see %DRM_XE_OBSERVATION_IOCTL_ENABLE).
>   	 */
>   	DRM_XE_OA_PROPERTY_OA_DISABLED,
>   
>   	/**
>   	 * @DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID: Open the stream for a specific
> -	 * @exec_queue_id. OA queries can be executed on this exec queue.
> +	 * exec_queue_id. OA queries can be executed on this exec queue.
>   	 */
>   	DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID,
>   
>   	/**
>   	 * @DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE: Optional engine instance to
> -	 * pass along with @DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID or will default to 0.
> +	 * pass along with %DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID or will default to 0.
>   	 */
>   	DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE,
>   
> @@ -1979,16 +1979,16 @@ enum drm_xe_oa_property_id {
>   
>   	/**
>   	 * @DRM_XE_OA_PROPERTY_NUM_SYNCS: Number of syncs in the sync array
> -	 * specified in @DRM_XE_OA_PROPERTY_SYNCS
> +	 * specified in %DRM_XE_OA_PROPERTY_SYNCS
>   	 */
>   	DRM_XE_OA_PROPERTY_NUM_SYNCS,
>   
>   	/**
> -	 * @DRM_XE_OA_PROPERTY_SYNCS: Pointer to struct @drm_xe_sync array
> -	 * with array size specified via @DRM_XE_OA_PROPERTY_NUM_SYNCS. OA
> +	 * @DRM_XE_OA_PROPERTY_SYNCS: Pointer to &struct drm_xe_sync array
> +	 * with array size specified via %DRM_XE_OA_PROPERTY_NUM_SYNCS. OA
>   	 * configuration will wait till input fences signal. Output fences
>   	 * will signal after the new OA configuration takes effect. For
> -	 * @DRM_XE_SYNC_TYPE_USER_FENCE, @addr is a user pointer, similar
> +	 * %DRM_XE_SYNC_TYPE_USER_FENCE, addr is a user pointer, similar
>   	 * to the VM bind case.
>   	 */
>   	DRM_XE_OA_PROPERTY_SYNCS,
> @@ -2011,9 +2011,9 @@ enum drm_xe_oa_property_id {
>   /**
>    * struct drm_xe_oa_config - OA metric configuration
>    *
> - * Multiple OA configs can be added using @DRM_XE_OBSERVATION_OP_ADD_CONFIG. A
> + * Multiple OA configs can be added using %DRM_XE_OBSERVATION_OP_ADD_CONFIG. A
>    * particular config can be specified when opening an OA stream using
> - * @DRM_XE_OA_PROPERTY_OA_METRIC_SET property.
> + * %DRM_XE_OA_PROPERTY_OA_METRIC_SET property.
>    */
>   struct drm_xe_oa_config {
>   	/** @extensions: Pointer to the first extension struct, if any */
> @@ -2034,7 +2034,7 @@ struct drm_xe_oa_config {
>   
>   /**
>    * struct drm_xe_oa_stream_status - OA stream status returned from
> - * @DRM_XE_OBSERVATION_IOCTL_STATUS observation stream fd ioctl. Userspace can
> + * %DRM_XE_OBSERVATION_IOCTL_STATUS observation stream fd ioctl. Userspace can
>    * call the ioctl to query stream status in response to EIO errno from
>    * observation fd read().
>    */
> @@ -2055,7 +2055,7 @@ struct drm_xe_oa_stream_status {
>   
>   /**
>    * struct drm_xe_oa_stream_info - OA stream info returned from
> - * @DRM_XE_OBSERVATION_IOCTL_INFO observation stream fd ioctl
> + * %DRM_XE_OBSERVATION_IOCTL_INFO observation stream fd ioctl
>    */
>   struct drm_xe_oa_stream_info {
>   	/** @extensions: Pointer to the first extension struct, if any */
> @@ -2092,27 +2092,27 @@ enum drm_xe_pxp_session_type {
>    * enum drm_xe_eu_stall_property_id - EU stall sampling input property ids.
>    *
>    * These properties are passed to the driver at open as a chain of
> - * @drm_xe_ext_set_property structures with @property set to these
> - * properties' enums and @value set to the corresponding values of these
> - * properties. @drm_xe_user_extension base.name should be set to
> - * @DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY.
> + * &struct drm_xe_ext_set_property structures with property set to these
> + * properties' enums and value set to the corresponding values of these
> + * properties. &struct drm_xe_user_extension base.name should be set to
> + * %DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY.
>    *
>    * With the file descriptor obtained from open, user space must enable
> - * the EU stall stream fd with @DRM_XE_OBSERVATION_IOCTL_ENABLE before
> + * the EU stall stream fd with %DRM_XE_OBSERVATION_IOCTL_ENABLE before
>    * calling read(). EIO errno from read() indicates HW dropped data
>    * due to full buffer.
>    */
>   enum drm_xe_eu_stall_property_id {
>   #define DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY		0
>   	/**
> -	 * @DRM_XE_EU_STALL_PROP_GT_ID: @gt_id of the GT on which
> +	 * @DRM_XE_EU_STALL_PROP_GT_ID: gt_id of the GT on which
>   	 * EU stall data will be captured.
>   	 */
>   	DRM_XE_EU_STALL_PROP_GT_ID = 1,
>   
>   	/**
>   	 * @DRM_XE_EU_STALL_PROP_SAMPLE_RATE: Sampling rate in
> -	 * GPU cycles from @sampling_rates in struct @drm_xe_query_eu_stall
> +	 * GPU cycles from sampling_rates in &struct drm_xe_query_eu_stall
>   	 */
>   	DRM_XE_EU_STALL_PROP_SAMPLE_RATE,
>   
> @@ -2127,9 +2127,9 @@ enum drm_xe_eu_stall_property_id {
>   /**
>    * struct drm_xe_query_eu_stall - Information about EU stall sampling.
>    *
> - * If a query is made with a struct @drm_xe_device_query where .query
> - * is equal to @DRM_XE_DEVICE_QUERY_EU_STALL, then the reply uses
> - * struct @drm_xe_query_eu_stall in .data.
> + * If a query is made with a &struct drm_xe_device_query where .query
> + * is equal to %DRM_XE_DEVICE_QUERY_EU_STALL, then the reply uses
> + * &struct drm_xe_query_eu_stall in .data.
>    */
>   struct drm_xe_query_eu_stall {
>   	/** @extensions: Pointer to the first extension struct, if any */
> @@ -2240,7 +2240,7 @@ struct drm_xe_madvise {
>   
>   			/**
>   			 * @preferred_mem_loc.region_instance : Region instance.
> -			 * MBZ if @devmem_fd <= &DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE.
> +			 * MBZ if @devmem_fd <= %DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE.

Reviewed-by: Xin Wang <x.wang@intel.com>

>   			 * Otherwise should point to the desired device
>   			 * VRAM instance of the device indicated by
>   			 * @preferred_mem_loc.devmem_fd.
