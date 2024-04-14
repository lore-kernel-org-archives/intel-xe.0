Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C1CC4345F
	for <intel-xe@archiver.kernel.org>; Sun, 14 Apr 2024 14:24:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA3110FFCF;
	Sun, 14 Apr 2024 14:24:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OWMLCVFK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98D2910FFD0
 for <intel-xe@lists.freedesktop.org>; Sun, 14 Apr 2024 14:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713104693; x=1744640693;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=IChOtWwVC+B4mWeXcYV13NoTluqlc0sjf9iBzHeB1uM=;
 b=OWMLCVFKFK5X4gEZCzJDzOZkU+5NY32MDoL0qKkQAKY+q4b9S0t695yp
 AlVmB5Po9YCF0ZPbID45Gv0YBaExAyGeEg/4x1NIL/54xYISF1bKt2QbZ
 CVSw9+RSDAYI8960yx8Kc+ihbc2JBtuHlOSd2OuRWmV2AYILfLtkygtIC
 7VPksY2/zeF09f9Npv0pE27HXQaNTTp82qSYZmBJg6W8Z1mxVygl7qN9v
 RY1zy/YNbwFihBi62jFOaUuhAvHi3721zA3PIg5yRDVpIMtuDbv/hqh5W
 QOydVc+6saxOYqr2cDWzPia2oz7kCJu4RNI3G9zG6+46tEXsbtgUPFpq4 g==;
X-CSE-ConnectionGUID: GIL0JsHrTT2XJ3e+1iT50w==
X-CSE-MsgGUID: ruS7dMc7QESawC5TwM5vzA==
X-IronPort-AV: E=McAfee;i="6600,9927,11043"; a="12276090"
X-IronPort-AV: E=Sophos;i="6.07,201,1708416000"; d="scan'208,217";a="12276090"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2024 07:24:51 -0700
X-CSE-ConnectionGUID: RhL1e0TuSG+Hf68Ssj1JWw==
X-CSE-MsgGUID: /fOtmOeuTE+bLa182BAHOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,201,1708416000"; d="scan'208,217";a="52615960"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Apr 2024 07:24:51 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 14 Apr 2024 07:24:50 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 14 Apr 2024 07:24:50 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 14 Apr 2024 07:24:50 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 14 Apr 2024 07:24:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RlugEOd+vah7nSyxOJlSDuwd71STqLBoM/ouXL7n6A/cyV5t06PUMxw2XF9FgiWbA7Lwy90YaaQaFlae5dk/nPGY6zHH+6AI8JgG6XydD1qub7brIJEz+U6pW2CkOtHApEx/tHGX0XGbCUflKSlNipApkU8IYkPGXtu2wNOjyRMf2R8vjdRV0fel8bNMHlNYDqUBs2ydi9S+ZKYYPnryeeNIOPZB4xUkn6l5vUN/xQo55Q5XGJWHld9eXvyo0h5MNd5RUo3o2a9oWmmgjnARV2y7Z1MsuZnUj4POlmb36RlLKj5Kyk8MXRFWZEv4kctSiptXa0oMgfeOA105OMY6aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/RilSQK3nJtH3JXldcoCVUPPOiQIJdziH8q7KbxHoPM=;
 b=c006dcy9slNLpzTuL/1q8gi+zRp+nnftoY/GRQQXtj45lM4Ss+T6jFK862XgfNS8E0PzLjW2vbNQzuJQUU/uya60/ZxbaAF731Ubkg7RByB0aTlUFjBnUVxGj78l5AYk5puY+Jxj6SWgr34IWWfUB1dOua91it8lDqj9VcAjfJwfnYDsITMn/NAScLzonk9MrLKRW1WCKNq7BowItO8pGzZDNDqY6wcv5lWs69IE+7bLCxIIZhV2BFJJansFnHrvj/aMl3MjTYxkGKW5yioPj2EOyDO/tcd5vC7SGNXJUyM2b0QIyH0eVQ18yXm1f2taLb675dHrLuukcTv+ovWccw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 CY8PR11MB7196.namprd11.prod.outlook.com (2603:10b6:930:94::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7430.46; Sun, 14 Apr 2024 14:24:47 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::79b7:da48:ff3b:4c78]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::79b7:da48:ff3b:4c78%5]) with mapi id 15.20.7472.027; Sun, 14 Apr 2024
 14:24:47 +0000
Content-Type: multipart/alternative;
 boundary="------------UEv9zQ0IY6xwSazi6CRzkq74"
Message-ID: <8377f1fb-54fc-4300-96e4-841367e0323f@intel.com>
Date: Sun, 14 Apr 2024 19:54:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/4] drm/xe/hwmon: Update xe_hwmon_process_reg
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>
References: <20240405130127.1392426-1-karthik.poosa@intel.com>
 <20240405130127.1392426-4-karthik.poosa@intel.com>
 <2rghstrxzerqq74k2papk3nwafptzsfzgli7ceyf4shstmejy6@n4efergznjwb>
 <ZhWOV9puU8o3-qZM@intel.com>
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <ZhWOV9puU8o3-qZM@intel.com>
X-ClientProxiedBy: SI1PR02CA0027.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::18) To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|CY8PR11MB7196:EE_
X-MS-Office365-Filtering-Correlation-Id: 244b6447-e397-4a30-c220-08dc5c8ea2e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ApZ58atfSgzYxA0YN43u2Pgq+d72ODdTwOfzNPi/wuFVuqXz6DSavdx+slmliS8nN62WJUuJzUX1it3JjiTzn1ZNq42AW8NNyHJvaHVAM85/HtYuXmSfI8/GWvp1lz6l3sVGMK0B/YldtCyi9YM4LwJKhqBXQ62Iqv5TqUao0opMDIKArP5mQJhZ1yqrBm2CARY1qP88qAMIEAWR/KQXrtK3AZQ9mLHqXuB+j8yc9AhWeaxuPE8+2txgq5vIcePmRO6/GU/LJg1C7Gyw8/5kijkgpvxl0Ssff7CTiR3XMcvNw02sHC6yTfcWoWQHuVbUmjhVWAAnl8efzW4xRNbfCjOfzQFtA5Wy2By8vjZjSBbZ+2Cezi6capejywCGj4WaAmva9WolkpHuS7C4G2ZtQWzkb8EW9QtCjiXE/pVCU3WopJuDXqGNoTh3tTH8ttUexOcITOaMTXPBzszoCBfWr5aR0VMXF481krOr/VIGIG/KXl9Hx7VaQmhmuVUkodPfelj9dUEyv7q7NzeDs7PDy2hDrvYReuw7YM15CiRQJcqVFGbUceuoXFA7VEDwQDGnggsjLOVBORqxvoPzG2QcCJIyAJh4dZ4H4FY32CX+DfvlsaTwwWn8osR3QhdmGEqcxaefG65uZXE6Lu1L8SenPwPRPCp+ZM0hG5U5FAYvg0o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2puQU5XR3Qyamw4QUlYaloxK0dPYStCdmF3MFVCU25uVUpKSVFsM0ZIODZB?=
 =?utf-8?B?dTYzei95WUFxTVdIZGhoRUJXQzNzOFBHV1BzanN1RjB3clpyNWNPUlBnL0FG?=
 =?utf-8?B?U0NBaFlhclNTdXNjMEJJNzNDVmlIcTQzVmJWSFBMcEFaNkt0RGhxZzI5dmpv?=
 =?utf-8?B?ZDZSay9YQy9DRlhwaFRMVm5EcCtuS3BvZHpSTFVoeHY0enFYQ0FKdUYvU09t?=
 =?utf-8?B?bFFsRDg4bS8xU3kzR3lqQlQyUkhOR1ZoaHU4Z0o1dFJBUHlvMGNZdXI5U0Rr?=
 =?utf-8?B?TVJlaFk3SWVpalJFd0pPT1JNMHRJRFAzYjQ3M3E3eDd4OEpuUHpGOUJDWGp2?=
 =?utf-8?B?amQrcmdTZmVoQUJkdWNPTDYrSUxjVHpYNk54MmFRRkp0TEwrdWR4bDlUdVZK?=
 =?utf-8?B?bm1GUHlhNE8rcnkvNmI5bGtoMURqMkFKcEpUUzNmSHhwandKc3g1Z2YwUUVV?=
 =?utf-8?B?aDRhWkdUQ1ExcFVZVHNVbHVPTXR4OURMOERicEpSNE13Qk4wRlN2QUw1bHU3?=
 =?utf-8?B?dGRNbGJ5NWMxOVN0TnAvUDNqQXFFUE5qUEdiRFNJMjdRdGJ0VUJRQ1VWL3d3?=
 =?utf-8?B?VUcvSEUwNHFaS2ZyOWZ1dXdqQVpuT0dYVEMwYWxQUFlRaWIzTzEremJDNVYz?=
 =?utf-8?B?VUl3Nm4xY252VU1SMmkySkJhc0UxM3VvTWhmd2NTd1ZwNWlnVjNYTzE1NmEv?=
 =?utf-8?B?T3EyTDBqSERDMWFvcjNBcURuY3FFaTNmUThBUmp2SGJRTTFzVnQvdDdLdUho?=
 =?utf-8?B?bFZ2TUd4blFTOEtibktoY3RUMnhKWWcwTVB1c1k2NG8rNy9GUGIvOFNnTmlX?=
 =?utf-8?B?NEtVelBmcjM5UDB5dnpqKzA0T3F3Y28waHJXZll5Nm5oaGk1SWJKenJ6VkJy?=
 =?utf-8?B?VUZUajNwZ2pueEhXR3paR0RqUDlCdVpRbjhpUXBObWdrejNSdUJZSW9KbUw4?=
 =?utf-8?B?UUwwWitQOVhZTXZla2E3ME0wMVdoVk90akdnbVZJeHRvdE5QdUpYSWJnWklz?=
 =?utf-8?B?ZmQ3K2Q5NUdLT2VVR085VGd1Vk1vOFRtcDZFSzRINnVTSXpiNG16REVtdTVL?=
 =?utf-8?B?dDhvUGxqeGRDZjlGc0oyL3dOdjRvT3dmdy9MZ0N1b2x3Y0cxTFhzMFN3Rksz?=
 =?utf-8?B?a1QvZGRheFdBZ0VzaFp5RXhwaWRkeitTaStxMHc3Mkd0T3BGK2Q3K2JjeEFl?=
 =?utf-8?B?U0htZDBLWnZtVXFBMEtnai8weDlyVnY4TzdYVm5xWVdzNkk5bGN0SEdhTi94?=
 =?utf-8?B?Q2JvL0xJTi8vTzArQ0laRXJTejFnQTB5bm9acGR4dWpxdHE5bEsvVUF0SWZi?=
 =?utf-8?B?NGo4YjV4QVNCQ1I2N2FndnE5Y3FHNFc0T2gvMzFSampuL3RoYkJFOXdXNC83?=
 =?utf-8?B?am0zNmZNWjJ3Y1dVVWZ4T3plUi9YUlh0VmhVODNBdHg0ckVnWDl1S3Y0ekln?=
 =?utf-8?B?YWQrd2VZSUFIZmc5T1M4TWxZSjFxOE1IYVZjY3BzZ1I1dnFwSUFmTmROa1lv?=
 =?utf-8?B?ODZnV28xY1FvclU0MTBVS0kvWXlVZDJsZjcrRjZPNWpKUUVDOWlJdXh5NG0z?=
 =?utf-8?B?M0RRcjAwSVh3UGdvYk8zcDhaVDhGRnNoTWhXVVBDNi9KR0pqRkl4N3E1SUFK?=
 =?utf-8?B?V1JIaGZlbXIyRzVJa1RFYlRHZk9iVElGUzZhdHJlRmIyQ3FldkNYczJWZ1VP?=
 =?utf-8?B?TzhOMGVJZ3JGOThTb0FTQ1ppRHJWUmFiZWdtSXhGb3Z4ZFp2OWxMRW1ERmlP?=
 =?utf-8?B?a0U4bEpWREh0MUZWNlVBcUsxTTBoSC8wY2hLc2p3Qml3RTZUZ0UrZmVZSlZn?=
 =?utf-8?B?VUpmeVlGSnVCQXRPeVZrWUVDR0RCK1lPcGQvNVNJTW9MWENNUW94UlllSnd1?=
 =?utf-8?B?MHphK2ptb0ZPSVNpUG1XMlRnNGxUMUQreTFpYlV4M0dBWHR1VFl4Q0N0ZzZI?=
 =?utf-8?B?Y3NyYUl2UUtZclN0TmpCdjVUc2JUVTdTTEVjZnptOWdNYXRLSFc5TnhxSTcy?=
 =?utf-8?B?SzJ4L1AyUHg0aENRbVE2TmV0bFo2WlZKcWV4UVNjYUd5K245WEFUWTJzT2F4?=
 =?utf-8?B?MkdNY1N5Zi9QOXF1dlJUdzZZTHRIZUNYM09NR2dYWC9jdFZxNzVKTkhMcFdm?=
 =?utf-8?B?S2l4NEhDUE1JbFB4dWRDNlh5c0FkRG1nNW5tTlZjTmdjbUxYbStZTjMxOTNS?=
 =?utf-8?B?TXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 244b6447-e397-4a30-c220-08dc5c8ea2e4
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2024 14:24:47.4760 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9qfJMwOw8+YPDTxSL5LgMGqer516dg6rGIaCNFQMjvEnqXD3b9mxR/K4GhIkg1RFfVJu+jyWZ5XpT/bbsAU8hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7196
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

--------------UEv9zQ0IY6xwSazi6CRzkq74
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 10-04-2024 00:22, Rodrigo Vivi wrote:
> On Tue, Apr 09, 2024 at 12:52:34PM -0500, Lucas De Marchi wrote:
>> On Fri, Apr 05, 2024 at 06:31:26PM +0530, Karthik Poosa wrote:
>>> Return u64 from xe_hwmon_process_reg, instead of a void return.
>>> u64* input pointer not needed with this change.
>>>
>>> With this caller can directly assign return value to a variable without
>>> need of explicit initialization and pass by reference.
>>>
>>> v2:
>>> - Fix checkpatch warnings.
>>>
>>> v3:
>>> - Rebase
>>> - Removed unncessary break statements.
>>>
>>> Signed-off-by: Karthik Poosa<karthik.poosa@intel.com>
>>> Suggested-by: Lucas De Marchi<lucas.demarchi@intel.com>
>>> Cc: Badal Nilawar<badal.nilawar@intel.com>
>> Applied the other patches.  This one I'm putting on hold to think about.
>>
>> I'm not sure the approach in that hwmon in general is good with the
>> xe_hwmon_get_reg() + xe_hwmon_process_reg(). It seems it's even taking
>> some pm refs when it doesn't need (to decide if attribute is visible).
> I believe this approach is fine.
> We do need to earlier get pm refs if we believe that there will be mmio
> operations underneath. Better more then less in this case.

Rodrigo,

We are already taking pm refs in parent calls of xe_hwmon_get/process_reg.

Anything else needed here ?

>> Lucas De Marchi
--------------UEv9zQ0IY6xwSazi6CRzkq74
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10-04-2024 00:22, Rodrigo Vivi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:ZhWOV9puU8o3-qZM@intel.com">
      <pre class="moz-quote-pre" wrap="">On Tue, Apr 09, 2024 at 12:52:34PM -0500, Lucas De Marchi wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On Fri, Apr 05, 2024 at 06:31:26PM +0530, Karthik Poosa wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Return u64 from xe_hwmon_process_reg, instead of a void return.
u64* input pointer not needed with this change.

With this caller can directly assign return value to a variable without
need of explicit initialization and pass by reference.

v2:
- Fix checkpatch warnings.

v3:
- Rebase
- Removed unncessary break statements.

Signed-off-by: Karthik Poosa <a class="moz-txt-link-rfc2396E" href="mailto:karthik.poosa@intel.com">&lt;karthik.poosa@intel.com&gt;</a>
Suggested-by: Lucas De Marchi <a class="moz-txt-link-rfc2396E" href="mailto:lucas.demarchi@intel.com">&lt;lucas.demarchi@intel.com&gt;</a>
Cc: Badal Nilawar <a class="moz-txt-link-rfc2396E" href="mailto:badal.nilawar@intel.com">&lt;badal.nilawar@intel.com&gt;</a>
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Applied the other patches.  This one I'm putting on hold to think about.

I'm not sure the approach in that hwmon in general is good with the
xe_hwmon_get_reg() + xe_hwmon_process_reg(). It seems it's even taking
some pm refs when it doesn't need (to decide if attribute is visible).
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I believe this approach is fine.
We do need to earlier get pm refs if we believe that there will be mmio
operations underneath. Better more then less in this case.</pre>
    </blockquote>
    <pre class="moz-quote-pre" wrap=""></pre>
    <p>Rodrigo,<br>
    </p>
    <p>We are already taking pm refs in parent calls of
      xe_hwmon_get/process_reg.&nbsp;</p>
    <p>Anything else needed here ?<span style="white-space: pre-wrap">
</span></p>
    <blockquote type="cite" cite="mid:ZhWOV9puU8o3-qZM@intel.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Lucas De Marchi
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------UEv9zQ0IY6xwSazi6CRzkq74--
