Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC665F30298
	for <intel-xe@archiver.kernel.org>; Mon, 16 Mar 2026 02:31:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8649B10E05F;
	Mon, 16 Mar 2026 02:31:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KQfTQhu+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE3410E05F
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Mar 2026 02:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773628283; x=1805164283;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=4p0SU9lyfzeuX49gN/iMCetK3Q/8vxf0xZnzxy5NJDU=;
 b=KQfTQhu++kecCZcNjoAHSU1X+Jbvvci6fAQcLAtJrzMguaV3CLRxGfcq
 aSIBSQwzA5C9XeTAQDou/bPl1/5ISM5tM4APYQVQJ53VsSYeOTu9mSutj
 xfEy8GxILcpgB993Blv/Up2fEY07nDL8/kjRsBpFNX7c4zB0gwcsQVJGr
 YPM904pyL/TRxnNfo3dr61Zid9voTnFFj4VksZRj/COOjAgLPO44AQclA
 vTOlK2cyYs3CHdvDsPQogv4AP+x24AMaGCYIsufk2vNHu1Udwd3EnmqBv
 FAAIX9JaxkaRZc/KcMfT9VCufdNi6k5P6vqdfyeP/APlgciTAC88bagbV g==;
X-CSE-ConnectionGUID: Imje1P0oR36b3VCpxdLd4Q==
X-CSE-MsgGUID: r3SbAp4ZTESSMt51jhZzZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="78490203"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="78490203"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2026 19:31:23 -0700
X-CSE-ConnectionGUID: GxzYPsAqT76YWwTluxXtPA==
X-CSE-MsgGUID: pYrasVGQSumzC8Au5qAWOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="220999157"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2026 19:31:23 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 15 Mar 2026 19:31:22 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 15 Mar 2026 19:31:22 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.47) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 15 Mar 2026 19:31:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PRouNM4OJtv1iCq3YrhqbGMlCUf9AoQKZGR3b3fPmLNXEXKdSTO220pPJgMJm7iWP6yzs/e1OJzYv3d5YUFi+PvnFA/ki6EoY1/JKEWbB897HXtYgouOMsO7RBJU3azvbxOFHGCNguIAeqpPfQTWj45JHcSWOWOVU9vfYbjy7Zd7Ib8ELo/phhjjM+Et0VqwjBCbfLsItqBTagQGOoDN4DPHlQCau8Bs1T82u1EQyGZwOarCJvD3cRBMbvRON5MmyDKNmUfozsrk9u49aC1Qw/liWCaTvpCalzdTVzEXvAPSOCU/vIVJG+TGuzfGPVi0Wx7gu6ezpsScW2RnqYVXiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PIqzF1SqfClJoclei4Wl69XlgxB5yYeJlKB7A4/HgpQ=;
 b=aBMJQBUjIEnQ7VqnaHB4hO+/5TPF5ck39zz5LnPcgLcRUk0AD5RuIylXeYjQ2+kNRirxgyegFL/lM1MpMaSysgJwK3lcQ7OV7GHT6BWD0TT33bzr7Kngyt+vlXGoBEIaApCREVP7PGZhVeVAbtS66Y6XwbFfWyJomKS+rG6DsTCebcSvap4MM7D1W/4K6aQnxDpyRTF0HD8KOtDtV6VZvxAn5u62QRyyhQZcQiM3mar6TTzgylbDQI5yenv81v5W7Jb1XZwRqJYC5XuKk+Sh3xHh0O+Zo4Y9tM3IhpVnOSjkZFTidvQuJlkIftucm0if9d1OsXu5gs+TZ4r4ri8zQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SA2PR11MB5081.namprd11.prod.outlook.com (2603:10b6:806:118::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.8; Mon, 16 Mar
 2026 02:31:13 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9723.013; Mon, 16 Mar 2026
 02:31:13 +0000
Date: Sun, 15 Mar 2026 19:31:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: "Dong, Zhanjun" <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 03/10] drm/xe/guc_submit: Support cancelling submission
Message-ID: <abdrboTkN82XHFTw@lstrano-desk.jf.intel.com>
References: <20260308135536.3852304-1-raag.jadav@intel.com>
 <20260308135536.3852304-4-raag.jadav@intel.com>
 <91958e39-1ad7-42e6-b4d0-86e2fe38ca30@intel.com>
 <abaC4Y80fFU18eCx@black.igk.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <abaC4Y80fFU18eCx@black.igk.intel.com>
X-ClientProxiedBy: MW4PR03CA0260.namprd03.prod.outlook.com
 (2603:10b6:303:b4::25) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SA2PR11MB5081:EE_
X-MS-Office365-Filtering-Correlation-Id: 31d8dc31-df49-416c-1cf8-08de8304177f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: 7Np0AXfw2zQymPRzW7gIP/rXtwI3y7/xkHh0sp6+CYEPAWVGZYFw2wuIa80BOjCl3bBCjESpkvbDwioYbSfOzsQhZ2NF9lcnU9p4ywQor8jmFj9+yYSj+B7ObUrt+MUP1vvkbr2JMOspFYrZfbTWNBG1MQo0hit0qf5XJ/TREdcvfyb2T12y4dI+jhkOSDfWZZBBSo9/NN4KdcrRUrutabCBAPcP8hEzZgP4kXqpGzCnMkknUm/+rJVmyXOZ2LLs7hTSAT06RPWRgaX6WDwR0mOWFen4oSUk4GlqgME84K50UxmFuwav6GltXEGPwlFmqmooWwbFfVUdhaeYU7+hlT5URfPrLOd5RmLybAXsAbm7dLZqDPC5pfxUuUZaygrIuR4UHZf+dCvenCcAzNh3/ndXKZM0U9+mJdHClsjn+YHbjYLzqkZMTGjrPDnajRKrHtyZVyDNQ7rdh1t5h1bQr544Vy/OnzEPF+IzaZSMTvtZgN/Uzu+toZ33s2KuUV7cv0ODXFrnlWZknfX3/Dl7CQF+yvdYoFV95cJWUdhhfhL+xFn55SbEHcCh31ZaVSQicFcM9IwaHFs6nuVHA4qfYecGPXBF2bdndwzxot2XQhOKPkURW01nbjyKCg3iP3YDxLqGEnQg7pKb71wr8iYfOauwSNQgyGPdCcxZRcptqdT+7QGLiTpae/qeP8bzC0CZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlhVTDdTV21yTnFtM1RlaDNpNEpZdTZMbFAvakdXWDlibStoM1pnNitiN3Vz?=
 =?utf-8?B?c00zR1ViWmhFRWEwNTJtNEw4SUxuSWwzb01ybkxCdFNNN29YMzFWb2V1V0dN?=
 =?utf-8?B?cnlWaHc3MGxlOHd1WkhMS0pGUFhMMy93Q2hUU3NzRVdCMGRqQWE0K05CRXRv?=
 =?utf-8?B?QXIxdWNLbXgxc3JBcHNPWllveEdMK0d2cnA1MnAxRm9BeWd4bkJMTzgvMFZj?=
 =?utf-8?B?UGR0dlBBTjFRNmhLSXo2LzcyTTVEeHZ1WU5aenZSK0NCTDFvSjBXUFU2ekpH?=
 =?utf-8?B?OGtJUkdQazZxWk1WODNYUGYxWURVRTk2N1hwQTVEdEw2d3A4YU5oNElRa1gr?=
 =?utf-8?B?Wk5kK1RzUG1uWDY4clNaYkxTbnhLemF1UW51Ry9EV2NkTTI1aWJLTEpWSkNk?=
 =?utf-8?B?cW9NVEZ1ek9ZRDBaYkwrVC9tOERCTXVENDZUbi83OHpiTlF0NEtjdloybW1X?=
 =?utf-8?B?bHpuMm94bTJYTkJEZVZTbFVTMEhiTHBLeWpDc0lUbTNLcmU4cXg0KzRwOXNY?=
 =?utf-8?B?YWUxVGVMa3BSQVZIa25WS1JwUnM2RWFkSldBN0J2Rjh4MVhXYjh6VzdaRllJ?=
 =?utf-8?B?TVU5ZmJINWFvOUdCWWJDcytIdnFud3FZOUNaR2h0djNOQk9UR2ZKTmd4eGZE?=
 =?utf-8?B?eUIrL05qV0llaGdlcTR2a0FyR0l1MmpyUjRkeEFtVUZ2aC9aVjRDcXlVQ1Ny?=
 =?utf-8?B?THU3Q3ZYeHVOVTQ1V3pINHUvb2NqL0xrR1JXR0xjSFVSWmxDVFdvT0JUK0p1?=
 =?utf-8?B?cjNKNmMvNi90WjNQcDdBVjNBYkx3aUpDdjBFVkFOOUg3ZXoxNFdVeXR6SU9u?=
 =?utf-8?B?ZHBHNlg1OWRCVVVqWHpMWU9qSFZzUHJ5NHQ3T1FzMXQxWUZSR0IwTXo2YlpR?=
 =?utf-8?B?Y3Jxd2VXUi9XdzN0cDhELzEwWTNnTmQvamRocmhPUXpVTUR2SkZETGQ0MlVV?=
 =?utf-8?B?Kzh3Sk5KM0lETHdvRUZIQlpyS085S3hyeG4wYmk3M3ZXV1gvZ1dscW5NcTFU?=
 =?utf-8?B?MW4zcjkzbU44RU1oOEt2WjllR2RqRmMybG5qbStRSUVyQlpaTmlPMnRwdnVr?=
 =?utf-8?B?TVlnSFRGNUVHejRjMWlTbDNQeVhCM0crQWQ1YTY5bFd6aUw5MFRva0NrUjhD?=
 =?utf-8?B?TjJIbXBBQUFXT1dJNGdNUWVKTjQ5L1ROb1REYzlTV2hnVWljL1hSNmtOZFB5?=
 =?utf-8?B?K0JqcVJNbXZQbzV5eGJkbUhpYVN1ekQxV0k4bHA5YkUyQUdMTUd2Mm42bHpY?=
 =?utf-8?B?dm9zMmJHZ0FJK2FVM0ljQkhkTnBOL2U5TXNxempnRWNQbzZmZTVhNlg2ekRB?=
 =?utf-8?B?bTFodGJWc2NvRkg2TkxaUDJYazFuazVDRWZoTXR6b29HMmcrbm1uTUo2cHBH?=
 =?utf-8?B?cGlqMFAxWi9tbFJ3LzNhZHNGM3h1aFJsUXZSc2pyeWFPVExoUWRvQjRrUlJY?=
 =?utf-8?B?aWFMc3k2ck1nMzdWMFo0SGZ6am1BL0RvNy9qWVBOV1BFK2RNeUJKaVZqd0RS?=
 =?utf-8?B?Y3BMakdnK2VWVm5mb25FTzNxU1c5VDY3dVpMRlo2czlCSWcyRW0xNDlkQkcv?=
 =?utf-8?B?bCtBYm9rYUc0K3Nrb0xIZ3VUWjF2ZU9mVVVrR3A0RkgvN3FlVWFyZzQwa3V1?=
 =?utf-8?B?TDI1TFc1bHhka2VGeEFTa3g2Qkx0K1VCMWwrUENTelBkL3F6Qk91TU8xMmVj?=
 =?utf-8?B?MmVPUW1QejZhYUhCeFAwY1RQQ0VRZTVzeVJnUG9jYnpNS29ZUXM3L2Y5Tjk1?=
 =?utf-8?B?VFM0ai8xTDBmQ3dJclgwWnphQkp4V1Nxd2pKek9kdTMvL294UllBVGJnaWVo?=
 =?utf-8?B?MHlhTFpwN0lHeXQ0dnVLNEQ3b2pLeDlvYjJFaGJxaUpUQitsL1dGbmRyb3E3?=
 =?utf-8?B?Z21Vc0FRelRDZlVQLzFuS1JHTG5KNjhpQ2FVOGxFNkFuUlRkTGUwNUg5TDNH?=
 =?utf-8?B?L25EbEJ0M2RGTGJYOTg2bTRzeU9qQkgwOE8rS0VmSndOODRHdVRiWnl2aGxS?=
 =?utf-8?B?NVNkR3Q4UE5PbFI0ZXdSS3pEQnlSUTVsd01ZazVOQkZqQ1Y3NGhZeWc5SFNN?=
 =?utf-8?B?Y0x2eGhEdkQzMnVucVFFR2RUakpMWks4bmJybUgvYmNWSHY1U3pxTzc4WXlx?=
 =?utf-8?B?NExYMHl1RGZZREJnVVpKZmR6SlZWNVRIem9yUzRMUllSRXA1S3V1VmFDS1py?=
 =?utf-8?B?RjFkSWlHQkJQaW5pT01nMk4zZmxrOTNwVWlydk9LaTY0MW90YWpDMEtJRFdV?=
 =?utf-8?B?VDRMdUxBOWVMYlZkYlM0TC9UTkg2WUp6bEp0WTRxSExqVzVVUXZUbk5GZ0pJ?=
 =?utf-8?B?b2tlZ3BVY3JzVXV3Z09zWXZ2R01taHJQZlJlZVNkaWRyd3NwRmZ3YnVvV3VF?=
 =?utf-8?Q?zjmpODc497ObKu4Q=3D?=
X-Exchange-RoutingPolicyChecked: orwLrNz6ymxq5Gr6zF05HBcfHDvV7WjEN9+Q45DnpGme0Tlwq6E1eeBBt5Zu5lLqTc/8gBfJTCcr3g4jve0k0qam8GD2DOXWqxBgfE6WxwWYEDH9J4m4kytzOpuyVZQM/T/hYRRzm4UV4+0vtwhFYxTdoUTiSJ4TrnDWPWAXk4dM0a2b5xkxbnIN61N4aivbXTUh/UpO5EaaED89yzLHu9m6KOy6b3RYWSqjsNcxgG1RNYfdUPasutWS4q+OElMwOreEcytHEwh0+0OiNhYwoQNVVPvBfUf2u2Y+hcl+06upeTz/eCLbwzjBcligaDXREN93Th8hjPJVW2n0+Kkwbw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 31d8dc31-df49-416c-1cf8-08de8304177f
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 02:31:13.2091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KFXfIdVMQYQdnQ2SvIqMhYlLMPp1tO5wwL5seDw1Z9EaPiAjcV73aY8sAUa8QsLtRnLdKatnPRmFoV9jle9H+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5081
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

On Sun, Mar 15, 2026 at 10:58:57AM +0100, Raag Jadav wrote:
> On Fri, Mar 13, 2026 at 11:37:03AM -0400, Dong, Zhanjun wrote:
> > On 2026-03-08 9:55 a.m., Raag Jadav wrote:
> > > In preparation of usecases which require cancelling submission before
> > > PCIe FLR, introduce xe_guc_submit_cancel() helper. This cancels and
> > > frees any in-flight jobs on the scheduler.
> > 
> > Could you put more info on why add new cancel functions rather than call
> > existing xe_sched_submission_stop?
> > From commit message, it looks very similar to stop, which also do stop +
> > free action.
> 

Let me start by saying these GuC interfaces for global control are badly
named and undocumented, which is entirely my fault. We should clean
these up.

Let me explain what we currently have in place:

- xe_guc_submit_stop — Stops all scheduling on all queues, cleans up any
  lost expected G2H, and triggers queue teardown on any queues with jobs
  that have started but not completed.

- xe_guc_submit_start — Starts scheduling on all queues and resubmits
  any jobs on queues that were not torn down in xe_guc_submit_stop,

- xe_guc_submit_pause — Stops scheduling on all queues.

- xe_guc_submit_pause_abort — Starts scheduling on all queues and
  initiates teardown on all queues.

- xe_guc_submit_unpause — Resumes scheduling on all queues.

The use cases are:

- GT reset: xe_guc_submit_stop / xe_guc_submit_start

- Runtime PM d3cold: xe_guc_submit_stop / xe_guc_submit_start

- Runtime PM non-d3cold: xe_guc_submit_pause / xe_guc_submit_unpause

- Wedging: xe_guc_submit_stop / xe_guc_submit_pause_abort (added in [1])

- Driver unload: xe_guc_submit_stop / xe_guc_submit_pause_abort (added
  in [1])

I think for FLR the combination you want is xe_guc_submit_stop /
xe_guc_submit_pause_abort — tear down all queues (and if the device is
already wedged, we’ve already done this [1] , but doing it again is
fine). However, this will tear down the kernel queues that are required
for the driver to become functional again.

So now that I think about it, I probably gave bad advice regarding
xe_exec_queue_reinit after [1]. In xe_migrate_reinit, just drop the ref
to m->q and create a new queue instead - I assume we can allocate memory
in FLR, if not this answer changes (e.g., we'd also need a hook to reach
in GuC backend to reinit the queues flags after all of its jobs have
drained).

> IIUC submission_stop() doesn't free any jobs, it just stops the scheduler

Initiatiating queue teardown will signal all fences, thus free the jobs.
So submission_stop can do this depending queue / job state -
xe_guc_submit_pause_abort will do this all queues. We just merged patch
changing xe_guc_submit_pause_abort behavior last week too [1], which
will affect your series if the device is wedged.

[1] https://patchwork.freedesktop.org/series/162978/

> and cancels wq used to run jobs. But this leaves the jobs on scheduler's
> pending list behind if they're not on the wq yet, which results in timeout.
> So perhaps I used the terminology wrong, will update this.
> 
> Also, I know it's a bit hacky to directly bork the scheduler's pending list
> so this can definitely use some standardization. Open to suggestions.
> 
> Raag
> 
> > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > ---
> > > v3: Cancel in-flight jobs before FLR
> > > ---
> > >   drivers/gpu/drm/xe/xe_gpu_scheduler.c | 11 +++++++++++
> > >   drivers/gpu/drm/xe/xe_gpu_scheduler.h |  1 +
> > >   drivers/gpu/drm/xe/xe_guc_submit.c    | 24 ++++++++++++++++++++++++
> > >   drivers/gpu/drm/xe/xe_guc_submit.h    |  1 +
> > >   4 files changed, 37 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > > index 9c8004d5dd91..c012dbe84540 100644
> > > --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > > +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > > @@ -90,6 +90,17 @@ void xe_sched_fini(struct xe_gpu_scheduler *sched)
> > >   	drm_sched_fini(&sched->base);
> > >   }
> > > +void xe_sched_submission_cancel(struct xe_gpu_scheduler *sched)
> > > +{
> > > +	struct drm_gpu_scheduler *base = &sched->base;
> > > +	struct drm_sched_job *job, *tmp;
> > > +
> > > +	list_for_each_entry_safe_reverse(job, tmp, &base->pending_list, list) {
> > > +		list_del(&job->list);
> > > +		base->ops->free_job(job);
> > > +	}

Never do this. Use the queue teardown flows, which signal the fences and
therefore free the jobs. I can see how you reasoned this, but I suggest
rebasing on [1], as I believe it includes some pieces that were
previously missing to make FLR work.

Matt

> > > +}
> > > +
> > >   void xe_sched_submission_start(struct xe_gpu_scheduler *sched)
> > >   {
> > >   	drm_sched_wqueue_start(&sched->base);
> > > diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > > index 664c2db56af3..ba7892db8428 100644
> > > --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > > +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > > @@ -19,6 +19,7 @@ int xe_sched_init(struct xe_gpu_scheduler *sched,
> > >   		  struct device *dev);
> > >   void xe_sched_fini(struct xe_gpu_scheduler *sched);
> > > +void xe_sched_submission_cancel(struct xe_gpu_scheduler *sched);
> > >   void xe_sched_submission_start(struct xe_gpu_scheduler *sched);
> > >   void xe_sched_submission_stop(struct xe_gpu_scheduler *sched);
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > index de716c1fb18e..cba544cc185c 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > @@ -2399,6 +2399,30 @@ void xe_guc_submit_stop(struct xe_guc *guc)
> > >   }
> > > +/**
> > > + * xe_guc_submit_cancel - Cancel all runs of submission tasks on given GuC.
> > > + * @guc: the &xe_guc struct instance whose scheduler is to be cancelled
> > > + */
> > > +void xe_guc_submit_cancel(struct xe_guc *guc)
> > > +{
> > > +	struct xe_exec_queue *q;
> > > +	unsigned long index;
> > > +
> > > +	mutex_lock(&guc->submission_state.lock);
> > > +
> > > +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
> > > +		struct xe_gpu_scheduler *sched = &q->guc->sched;
> > > +
> > > +		/* Prevent redundant attempts to cancel parallel queues */
> > > +		if (q->guc->id != index)
> > > +			continue;
> > > +
> > > +		xe_sched_submission_cancel(sched);
> > > +	}
> > > +
> > > +	mutex_unlock(&guc->submission_state.lock);
> > > +}
> > > +
> > >   static void guc_exec_queue_revert_pending_state_change(struct xe_guc *guc,
> > >   						       struct xe_exec_queue *q)
> > >   {
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> > > index b3839a90c142..f361a6d32fd3 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> > > @@ -16,6 +16,7 @@ int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids);
> > >   int xe_guc_submit_enable(struct xe_guc *guc);
> > >   void xe_guc_submit_disable(struct xe_guc *guc);
> > > +void xe_guc_submit_cancel(struct xe_guc *guc);
> > >   int xe_guc_submit_reset_prepare(struct xe_guc *guc);
> > >   void xe_guc_submit_reset_wait(struct xe_guc *guc);
> > >   void xe_guc_submit_stop(struct xe_guc *guc);
> > 
