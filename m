Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B2C6C27C55
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 17:42:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C749D8902A;
	Mon, 10 Jun 2024 17:42:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C30MCfLR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E0C98902A
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jun 2024 17:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718041373; x=1749577373;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2qSdg/rZvh/3WoBI206bU//8dBEjLPgwW81yVrgbuFs=;
 b=C30MCfLRn9AfxOZS7cst1HtoV1C57gCQOhyKVzWe05hNC3t3wJBLxI6X
 e70lgxD+LBMa/TakCEaaZQUQoFmkssKb+Cq6fnwANxxHZBx1vBftvN9uD
 6VFAS5evQMwQMFDjy81xG92EFgnOtXTkJ9mMsFnPJ0lRVi+r3Bh03sSdp
 rHdrKg+CS0QwcUi6qRHMX2+yWQ+KJvjFuX2fohBLi+ReCbev1B/1ZXt42
 qaD5GrtfV0fvXOc6J26BcHJ7ZVaZgKBgQS7/48+K73esqkIypYgIoDTwx
 17sJn0w2tO8o78H/UKdTd3aqYkwTFb+Tx101VIxQvA1NyOJAzk9HuCR5Z A==;
X-CSE-ConnectionGUID: 66qmvZozTY2+mEJXfXbByg==
X-CSE-MsgGUID: gnJSQWqyREiDIQTKfkSkOw==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14664853"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="14664853"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 10:42:53 -0700
X-CSE-ConnectionGUID: 9bV05H9TR/ClMNdRZ5F65A==
X-CSE-MsgGUID: dvE7T+lSRBqCIpQOXllQ6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="70303266"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jun 2024 10:42:53 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 10 Jun 2024 10:42:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 10 Jun 2024 10:42:52 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 10 Jun 2024 10:42:52 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 10 Jun 2024 10:42:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lEmf88f/A0HgTS9KKRo8pySKOQh2q+BO/GujpXjfLjC3GaTgl3X7ioMVWMOCvDZI4l6CpWzfIeOS42Ehwh45vnu1c4Qvqy4APMDTUJ5zjgcj9QOmCt+hyilY0Gja774cgpePKz5OzbTycsuBQ73EDSncd/Cx6yZ/73SWPFAIOz6lTaDJT3q3X7jDxtQhEaxf71N8Q9yT1PIDUQui3cEDgdL4ByPSgYZyBfyFRvUg0vNbWZ5/KSETcvqJ4aCoV11q5nJOso+fP/a5UNSZkL5h626G4V/jhN8PTv0LYPxpzKW9XmHJ6cpdmV9383iote4HI1MrGvASq1vFvnmdESblMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PWuM/grMzDyyWJJtUsxtd9MJCOJBU4TOeT1jtDabGhE=;
 b=RKi4GAxR8XOajykW+61KDWqanndaK6r01OECWw2vBoLnf/xFrpMN+k/aC04j6LviDaXDg+MnPi+wK67skjFegyHmf6NThmiQJRE0Q9vVFBbjzoQY8KzTxh72fiHAXg+VOCleBoDxXlV9yjydA3rhzvSpi+R1M2JJa9nNJsEWMeOLlXtck+QXomLlCsFE1Lccb/LgQOFMKhTMHXnCQ2O7vYvXCqbhVMRdb8pSysiZejzeEp5UZSEG+gxiTntwEfH7KhClCoGRkxkeMCHyQJUiweqXmUpI+J9L2jc5yco0sd7Lr468ndv0T998/pfcgmLnWOT12nH4c0U6Rd1JgO7vjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY5PR11MB6438.namprd11.prod.outlook.com (2603:10b6:930:35::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 17:42:49 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7633.036; Mon, 10 Jun 2024
 17:42:49 +0000
Date: Mon, 10 Jun 2024 12:42:46 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 1/6] drm/xe: Add LRC ctx timestamp support functions
Message-ID: <fv6kb2hy6xc4divrb23wyc4jarbzckcr5r66gfnlywtyd2v7sh@jjb7aueb5h4b>
References: <20240608002103.2371696-1-matthew.brost@intel.com>
 <20240608002103.2371696-2-matthew.brost@intel.com>
 <dloqxdmjpfyppmq57mxjbm3rpviu54uu43nykl2kq64oifc4mz@wa7jy3wqtlgw>
 <ZmcJXuiaOBGvH7R1@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZmcJXuiaOBGvH7R1@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: MW4PR04CA0296.namprd04.prod.outlook.com
 (2603:10b6:303:89::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY5PR11MB6438:EE_
X-MS-Office365-Filtering-Correlation-Id: a3f9a01c-1250-40af-70d1-08dc8974bf24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?X4TWNpiv9Hj5LX4gwqFc4XeVYGhkG0AfwWKF7ZrP3sP49/vlGqveHvQkLNE2?=
 =?us-ascii?Q?AKuU+pvUdy4gxchxXCA4jZBhyTQh9JKMFL/wUKpcu87ffk6agwzwSNSumEvB?=
 =?us-ascii?Q?o3hKg8SSuzdtc0C0rv2Z+Et0zJOJbjvCoVSZaChAdLE+1CVujFyipqlMD5F9?=
 =?us-ascii?Q?DL4fmccZKd+VPZO/xZQeVpjuPxmaZgk4zRtHVNnyXTEAQ1fvtFPVYwHxhG6O?=
 =?us-ascii?Q?1aEYnOyT0F5/5qVyAkbt2AJgyyt2kyn3fKDVO2mjxkY5z58OXhBwPmI2TRfn?=
 =?us-ascii?Q?fDsVxrT7RuxfntV0P8sa41+hrd0dz4BKMCO3N9l/N8rGXrtZv8rKev8PM3wb?=
 =?us-ascii?Q?h4cqNlTGbvGOMlWHtRFnzPS0FUtudjRQ9fWTlD0H6XkIT6AW0FXhDrmQRfLQ?=
 =?us-ascii?Q?Mg8B8H7CAGbIRZONYybLnhsSysf0gXPaTTwwxJjL17jRsEqpv3YGHf+m4GCH?=
 =?us-ascii?Q?Ar1v7+dPTI7ZYYrvCoaFnORlM+vsMiZa9XQo/I41Tg3PxODP3P/myFhMIOvr?=
 =?us-ascii?Q?U1rkXjBOy0Bkq+pA9qfxgQplHELMZAc8g+cQINRf5dYYK73Yw72/LDV0VtT1?=
 =?us-ascii?Q?HadGkpZ2qrMfgwm4WZJOHyk0g6/f9cnm/7tH34UWtCqESxQcaZxVNxeTfWc5?=
 =?us-ascii?Q?HM0QwgZFWwCMgPnkCh+HgSH8JQZ1aqsPLPyulmAfawJFsRInAvQh4KZQPUHk?=
 =?us-ascii?Q?NLGBEuWdYaIOTxq2PiC1qgTt/IEjbULm/vSza1hlIMw+HB7RyOfYDehCYOLi?=
 =?us-ascii?Q?1RGlBmRMHbvMs0n+5c0QTo14LX/AsK+ivM3rBA5wwfW2rW5lC63p9COBEKE+?=
 =?us-ascii?Q?K7EHA35l6t/BKfe8oEfoDjw1OAA+CrrT101kfO10HsjH/VN/Pzgu51Qb7tFa?=
 =?us-ascii?Q?QLTnbSWPYPE4DwaDIs1lnHHvcjtdcwqQjwq9GkB248dWGlBPMAfGm+ysLYr3?=
 =?us-ascii?Q?Zh/sFnavgPyZTYlOUSdfzWAYNpjeWyea9vdsnhlPSfWcAiFGrJSUNyfHrAat?=
 =?us-ascii?Q?Qmuo7NWGPNHgA52LA9MshCI5HTplJHTWriNuSTRkgNtSEmq8MjvgVLtPRDhg?=
 =?us-ascii?Q?ATGIpQ4MTWZgLETMy+IkRxeqAwXahhL2qJHsFdxKVMbcYoRGAjJAqR70gMvg?=
 =?us-ascii?Q?QNUyfowxw+w4jAuRtUenPLw1U3xd9YzeFfclCuEUSH6bwUy/opDVU3wSZkUU?=
 =?us-ascii?Q?g04fyMnjKEygz4r1IGuf9xCnrhBIBDsTkdbRwp46wx+x+Kn3edsZTq5wNL9+?=
 =?us-ascii?Q?uHu5q7ydYla2M3up48CxuHkXYwJNbhfp7GFbj8OprR/a8tjqtaRDa3zueHgf?=
 =?us-ascii?Q?tTdPe0XSYOgaDGq3uW64PAuX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?35BHYPv+1Q7VeuPVim9KM4zdInGBYj7hAHHWM9vUYUc74mBeic6IYaQL8DaR?=
 =?us-ascii?Q?tZKYogcS29wCXSJNI5lsFIv3VZFwPIy9zK2d+cxO33weUZsmHAgIMMdYifox?=
 =?us-ascii?Q?QMzf+fgAHAnpT+5XU3wPWpwHs48bUThTH/ERLz0wwRCQXVKzUlk1KztP07Td?=
 =?us-ascii?Q?XsfGVrIoFok3XZFTDhY0ZawvkIGo/+0PP2FyftdYzImfPmKbpBI/yYKYB1p5?=
 =?us-ascii?Q?PTnqZKu2lJuKf+BX7XOUZ2OMNDNqIzVpuCQdogaRWGUJxHI3MGaoWJDvL5wB?=
 =?us-ascii?Q?BAqpG9Ss2qArgsa51e1hMFpsPAvuQS758nIDDWdI/QVdWdf+mN8hT9OB4KFc?=
 =?us-ascii?Q?ZBefV0GZhh2AujQouyrVxMnZTI3c35eEV5Rw2hWgAO2pZYWAgg7bl9JTPmUW?=
 =?us-ascii?Q?eJa0mdE8wT6bMJGP8B919VlqorUawfODpbsxVcWzwAwtMtinYdK6gEb/babT?=
 =?us-ascii?Q?uw3TNd4j2Wz/nn2oZP7LlDoS195KCunNxWLrqithlGQYdImCN1Ixlh4g/UDU?=
 =?us-ascii?Q?igo1rXDuAWZtKTEuUPmf8uysokrn/6jpJ0R0UYRrmlto4zNNxvA6ziGAb3Hr?=
 =?us-ascii?Q?2L1m49w5U7dKZDMNMDErEabhDffXerDs3S9yp4n+FhkS2aCu3XzkoKMNuW/z?=
 =?us-ascii?Q?t8IyGkfhJEIpoHtOUykTfWCzg2qkWtKrLLbzdOInGg3xySNqyOu1j327jjD4?=
 =?us-ascii?Q?hDttdMzLvGx/ErObhW2JY4Be5hre/B38VRGaQzV+3ZkS7/FBplmxvLvUTQGR?=
 =?us-ascii?Q?Vm71iQ871RxYBHboDGOQK9q0qtSri1BdU+2kaiq4RxQ1jedgzrY+e4Wf7s0Z?=
 =?us-ascii?Q?TNzhfA+5indWSkZhPQM+yxvu9DbgkPwndgTC1duRF387FUBQK04XWyIodB8I?=
 =?us-ascii?Q?LzjrczbnS+9g2icTYE3AwJ6fDKp9ye6XnMHTBHZcRwXDJhg2D3WIKh5FOOn+?=
 =?us-ascii?Q?OPTLbHn5BL2hh86kqJfmFxX3fNuunUG4ONAInIAphdjkMFPOPYesH7yyPC0A?=
 =?us-ascii?Q?qYle3Grb3H717FI5+nLynbwQqQv51eJX3Ph9deK92BulAUxQ62pZ9hIM1C0d?=
 =?us-ascii?Q?KoJ+JQGXmlNmuSmQzy2KitesQ5ip8BnNkZ4Vjyly6OFlcP0mIEeFapFX1iGd?=
 =?us-ascii?Q?pWridrKBnJDYTKqIq7CARZxmL2YaYloHeBpIIIzx4ACZB0rZ/3X+HVoJz916?=
 =?us-ascii?Q?+aFMvQeKUjUOgZfvY03iRnRXTs4S8d6Dj9E7bhqAg4C5XUGjp8v/dtpAZ8Yq?=
 =?us-ascii?Q?COyVFaFTs2M7NJTPq5jnIw+qTQWQGr/FG4pbFQcmu+dFPcRKcfd3FkEbKEHc?=
 =?us-ascii?Q?Bk/2zFHb8OV+TDv8vAunrri6XV+mMwDJXXd2kXMVwVyO0blcb2qJDAp9qQNo?=
 =?us-ascii?Q?rXwvQqYDnKz4Hr3Jnxcnn21VOlXygKLLsgHvjcpMaZZ6rTzVolTFQ9GnvrZV?=
 =?us-ascii?Q?NmS1+R7BFi11YlqUzjyQXOWcDhDrc+MYRG/7D7ZjmTZeh05K558DQ/XzYJPn?=
 =?us-ascii?Q?XAgOyVi/BA8KhXlCzqHV/def/FEfuxJFBVPLS5Du2BImU+RVZLeMS2pRmUt3?=
 =?us-ascii?Q?a6znmLcNMMPLbwSkCJQ9vsP8rD4vmgtH4YQLHQ8vm0loFZp8XCzf3lRfBA/T?=
 =?us-ascii?Q?ng=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a3f9a01c-1250-40af-70d1-08dc8974bf24
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2024 17:42:49.7597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XFWPvedV+utb93A9mLNByNp3Pi1s+LLbAYwtARVgFa+K881xI89EdZvwZ6l5HB/0N6UfYaj4EMTZGNQLZPzw/6q5h5AFhzM0WGko+TWUBZU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6438
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

On Mon, Jun 10, 2024 at 02:10:38PM GMT, Matthew Brost wrote:
>On Mon, Jun 10, 2024 at 08:49:57AM -0500, Lucas De Marchi wrote:
>> On Fri, Jun 07, 2024 at 05:20:58PM GMT, Matthew Brost wrote:
>> > LRC ctx timestamp support functions are used to determine how long a job
>> > has run on the hardware.
>> >
>> > v2:
>> > - Don't use static inlines (Jani)
>> > - Kernel doc
>> > - s/ctx_timestamp_job/ctx_job_timestamp
>> >
>> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/xe_lrc.c | 66 +++++++++++++++++++++++++++++++++++++
>> > drivers/gpu/drm/xe/xe_lrc.h |  5 +++
>> > 2 files changed, 71 insertions(+)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>> > index c1bb85d2e243..0fef354c6489 100644
>> > --- a/drivers/gpu/drm/xe/xe_lrc.c
>> > +++ b/drivers/gpu/drm/xe/xe_lrc.c
>> > @@ -652,6 +652,7 @@ u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc)
>> >
>> > #define LRC_SEQNO_PPHWSP_OFFSET 512
>> > #define LRC_START_SEQNO_PPHWSP_OFFSET (LRC_SEQNO_PPHWSP_OFFSET + 8)
>> > +#define LRC_CTX_JOB_TIMESTAMP_OFFSET (LRC_START_SEQNO_PPHWSP_OFFSET + 8)
>> > #define LRC_PARALLEL_PPHWSP_OFFSET 2048
>> > #define LRC_PPHWSP_SIZE SZ_4K
>> >
>> > @@ -680,6 +681,12 @@ static inline u32 __xe_lrc_start_seqno_offset(struct xe_lrc *lrc)
>> > 	return xe_lrc_pphwsp_offset(lrc) + LRC_START_SEQNO_PPHWSP_OFFSET;
>> > }
>> >
>> > +static u32 __xe_lrc_ctx_job_timestamp_offset(struct xe_lrc *lrc)
>> > +{
>> > +	/* The start seqno is stored in the driver-defined portion of PPHWSP */
>> > +	return xe_lrc_pphwsp_offset(lrc) + LRC_CTX_JOB_TIMESTAMP_OFFSET;
>> > +}
>> > +
>> > static inline u32 __xe_lrc_parallel_offset(struct xe_lrc *lrc)
>> > {
>> > 	/* The parallel is stored in the driver-defined portion of PPHWSP */
>> > @@ -691,6 +698,11 @@ static inline u32 __xe_lrc_regs_offset(struct xe_lrc *lrc)
>> > 	return xe_lrc_pphwsp_offset(lrc) + LRC_PPHWSP_SIZE;
>> > }
>> >
>> > +static u32 __xe_lrc_ctx_timestamp_offset(struct xe_lrc *lrc)
>> > +{
>> > +	return __xe_lrc_regs_offset(lrc) + CTX_TIMESTAMP * sizeof(u32);
>> > +}
>> > +
>> > static inline u32 __xe_lrc_indirect_ring_offset(struct xe_lrc *lrc)
>> > {
>> > 	/* Indirect ring state page is at the very end of LRC */
>> > @@ -716,11 +728,65 @@ DECL_MAP_ADDR_HELPERS(pphwsp)
>> > DECL_MAP_ADDR_HELPERS(seqno)
>> > DECL_MAP_ADDR_HELPERS(regs)
>> > DECL_MAP_ADDR_HELPERS(start_seqno)
>> > +DECL_MAP_ADDR_HELPERS(ctx_job_timestamp)
>> > +DECL_MAP_ADDR_HELPERS(ctx_timestamp)
>> > DECL_MAP_ADDR_HELPERS(parallel)
>> > DECL_MAP_ADDR_HELPERS(indirect_ring)
>> >
>> > #undef DECL_MAP_ADDR_HELPERS
>> >
>> > +/**
>> > + * xe_lrc_ctx_timestamp_ggtt_addr() - Get ctx timestamp GGTT address
>> > + * @lrc: Pointer to the lrc.
>> > + *
>> > + * Returns: ctx timestamp GGTT address
>> > + */
>> > +u32 xe_lrc_ctx_timestamp_ggtt_addr(struct xe_lrc *lrc)
>> > +{
>> > +	return __xe_lrc_ctx_timestamp_ggtt_addr(lrc);
>> > +}
>> > +
>> > +/**
>> > + * xe_lrc_ctx_timestamp_addr() - Read ctx timestamp value
>> > + * @lrc: Pointer to the lrc.
>> > + *
>> > + * Returns: ctx timestamp value
>> > + */
>> > +u32 xe_lrc_ctx_timestamp(struct xe_lrc *lrc)
>> > +{
>> > +	struct xe_device *xe = lrc_to_xe(lrc);
>> > +	struct iosys_map map;
>> > +
>> > +	map = __xe_lrc_ctx_timestamp_map(lrc);
>> > +	return xe_map_read32(xe, &map);
>> > +}
>> > +
>> > +/**
>> > + * xe_lrc_ctx_job_timestamp_ggtt_addr() - Get ctx job timestamp GGTT address
>> > + * @lrc: Pointer to the lrc.
>> > + *
>> > + * Returns: ctx timestamp job GGTT address
>> > + */
>> > +u32 xe_lrc_ctx_job_timestamp_ggtt_addr(struct xe_lrc *lrc)
>> > +{
>> > +	return __xe_lrc_ctx_job_timestamp_ggtt_addr(lrc);
>> > +}
>> > +
>> > +/**
>> > + * xe_lrc_ctx_job_timestamp_addr() - Read ctx job timestamp value
>> > + * @lrc: Pointer to the lrc.
>> > + *
>> > + * Returns: ctx timestamp job value
>> > + */
>> > +u32 xe_lrc_ctx_job_timestamp(struct xe_lrc *lrc)
>> > +{
>> > +	struct xe_device *xe = lrc_to_xe(lrc);
>> > +	struct iosys_map map;
>> > +
>> > +	map = __xe_lrc_ctx_job_timestamp_map(lrc);
>> > +	return xe_map_read32(xe, &map);
>> > +}
>> > +
>> > u32 xe_lrc_ggtt_addr(struct xe_lrc *lrc)
>> > {
>> > 	return __xe_lrc_pphwsp_ggtt_addr(lrc);
>> > diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>> > index 882c3437ba5c..001af6c79454 100644
>> > --- a/drivers/gpu/drm/xe/xe_lrc.h
>> > +++ b/drivers/gpu/drm/xe/xe_lrc.h
>> > @@ -94,6 +94,11 @@ void xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot);
>> > void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer *p);
>> > void xe_lrc_snapshot_free(struct xe_lrc_snapshot *snapshot);
>> >
>> > +u32 xe_lrc_ctx_timestamp_ggtt_addr(struct xe_lrc *lrc);
>> > +u32 xe_lrc_ctx_timestamp(struct xe_lrc *lrc);
>>
>
>Bad timing, just sent v4 at the same time.
>
>> I  think we have some clash here. See the function below where we
>> read the timestamp and cache it in the LRC. That one does something
>> slightly different, but apparently the same thing. Why are these
>> functions not using similar approch with xe_lrc_read_ctx_reg() rather
>> than defining new helper functions? And why would we return the address
>> and then having another function to read the value?
>
>xe_lrc_read_ctx_reg(lrc, CTX_TIMESTAMP); is the same as: xe_lrc_ctx_timestamp(lrc);
>
>I used 'DECL_MAP_ADDR_HELPERS' to implement the 4 exported functions
>mainly as I need the GGTT address and that macro spits out a helper
>with the GGTT address.

I was still missing the reason to export the address, but after applying
it locally and grepping I see: emit_copy_timestamp(), so it's accessed
from the GPU side.

>
>fwiw, also xe_lrc_read_ctx_reg is implemented with one of these
>functions from DECL_MAP_ADDR_HELPERS - __xe_lrc_regs_map.
>
>I'd vote, leave patch mainly as is but replace existing
>xe_lrc_read_ctx_reg(lrc, CTX_TIMESTAMP); with
>xe_lrc_ctx_timestamp(lrc);.

sounds good. While at it, please add a line in xe_lrc_update_timestamp()
doc that it's only intended to be called by places maintaining the
per-client run_ticks. When I merged that patch I wasn't thinking of
having other places reading the CTX_TIMESTAMP. Now that you exposed
other functions, I don't want to have people incorrectly calling
xe_lrc_update_timestamp() when they should be calling the new functions
you are exporting.

>
>If you want to cleanup the file itself and drop these macros, that seems
>to be an orthogonal issue to my series.

not now, at least not from my side... I don't see a pressing need for
that removal.

thanks
Lucas De Marchi
