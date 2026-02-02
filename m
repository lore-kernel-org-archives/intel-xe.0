Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D6DE7DF16
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 18:12:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6E0710E12C;
	Mon,  2 Feb 2026 18:12:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U60okIZI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F0010E12C
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Feb 2026 18:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770055921; x=1801591921;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rvm3kcvm7ROHar0yOxppMmqCEsZUVB+3FBFCqDvl7r8=;
 b=U60okIZI/kuEEY+J5JMUQv+vyN22eehTirdNnR6FaJpGz/v+2qqNRfLH
 H3oZ9XWXvQqwH5WH0ADmis5p9f/CYjPYCQbDU7O24mqqZSOAeCKh0Kjdj
 frZKvU3eziAcVu/nSXb6Z95G+hK9iVS4ephEG+eKDtmnro02JFM01w1bi
 FUPwBEKTyQXfG1jIefxyuxXZtO2DXc/HboelShAzPT36R+LF9k8l+D3td
 68/8uGHNTPhwtfDGgR+hGui3oc6XeyAKWqOH/xZxidJUNz0idt8insbr/
 o+DTkhrCxNyZxuN4CincUcS5YUw0FOmyWLM6TzjqmWelrqPPAjVVJ1915 g==;
X-CSE-ConnectionGUID: 5pNDNZJaSTaFFxUu9R5XPQ==
X-CSE-MsgGUID: qvmIis9dRqyRzNb81YKL4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="71303449"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="71303449"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 10:12:01 -0800
X-CSE-ConnectionGUID: i8ckVC/ZRieuPaqN2dsHTA==
X-CSE-MsgGUID: IDJ76Ok4TxW9L+rAiZtuZg==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 10:12:02 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 10:12:01 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 2 Feb 2026 10:12:01 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.10) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 10:12:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MiZY8CdbKZG/egzpOtFV+8FY9cq8e+ajaYTCQLUWje+3TWNX0MpBmMGUsilY4z5+5SXIXm+WURUzu6UNwX7JJhFMPyGrfKqCexDRQmDXSgHf0bzJZxpmvmd9wfKMIRIAdhAFzpr3VffcOGOHpnxByldzseuEy0kWGYAIHHYBMgTcscmi5zdck4/mKZTDDf9H9xJ6Reo6zjtI9ZgcAQ35+K9sx8yKq67Ww+GVuhmEhvs3p6mAxNz2ahlXuzZQ9WE0WKLN1vnkNrnNQyCo7H6q0ByxoM0ELDQcZ8WzClpr6a78Y2g7iAMgDr9G37UJ7IJ8LJvmmrCNYU7f10zMCk59NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uMJyIbl7W41nYUGg4JJwI6sQmHHqhYWbbKA0G1wK+go=;
 b=HaSKos34JBcZCZ4U3HMEJSRp4+/Nxv6x3zKmHNLClg91TBc1DjtjBAlEscS+kpVikpfAtG2D9y43eFmkjba0uKgzPcDb+o6b5ag4MKosa0JJL2g5lt7tBxjdETh3uYRo6JbgearFsLINeJKLe2vO6jKK4jeKyElh6t87JUT2RVnipMOdIHe7MTuYpTzDV067PA0zLjfiUMN/E4uPrdKL3iNG49n/KkH6LyI7s0h5pDu7g1RLcue9HkEtksTUWoanQ8xwFhKtd9qb+ee0mTORZjqpS9O+dElfxRwg4rM/C1yV6SIBUTCxPvm/C91TWNeuObjNl6UOGabq0PGPyUQZhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY8PR11MB7196.namprd11.prod.outlook.com (2603:10b6:930:94::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 18:11:55 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 18:11:55 +0000
Date: Mon, 2 Feb 2026 10:11:52 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: "Lin, Shuicheng" <shuicheng.lin@intel.com>
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkJBVDogc3VjY2Vz?= =?utf-8?Q?s?= for
 drm/xe/query: Fix topology query pointer advance
Message-ID: <20260202181152.GH458797@mdroper-desk1.amr.corp.intel.com>
References: <20260130043907.465128-2-shuicheng.lin@intel.com>
 <177004998896.217224.1788453148917140147@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <177004998896.217224.1788453148917140147@a3b018990fe9>
X-ClientProxiedBy: SJ0PR05CA0180.namprd05.prod.outlook.com
 (2603:10b6:a03:339::35) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY8PR11MB7196:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c8a27e0-6d85-4ecd-f943-08de62868c0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1JQFVewDnrs5EqA1UftxgRhpZUiO7ZAAMnvHjsyF/R4WeenTiPaSaK1qyZSa?=
 =?us-ascii?Q?TiyIQLJmgptBLjm7cfRenz7dAJf4ggVvkDHz+iOo5JDiV41qtZoHgAyZJbf/?=
 =?us-ascii?Q?0eexZxwbX0Zi6HAE7zRq6Q1h7kqlGiyxP+xQm7LTClCcLy73LJWLhkVcuk7s?=
 =?us-ascii?Q?ttFw1FQSPKa/TSj68Z/MRLlRWIZPA/AS/YzTDLVBvw6js0Qk1LEIaAG1k83f?=
 =?us-ascii?Q?61CHtUMX2d69NWgjw/xl1PkGDJUMl/ji4XliM4hEhxrixsL53KbBhjFcE1VX?=
 =?us-ascii?Q?wD45NWCN6pC6Q0qs6UlQhY4Q8eCidQPXvv9gX3du7sRoSCmZ+/xCWkH/KTtp?=
 =?us-ascii?Q?RztAUpbGivEw4VO8GhuQ0mrWttUVaobhKRhQ5FadxQ/wtvD4roa6CbkcpqZh?=
 =?us-ascii?Q?jLDITwUr1NmDQdcWfgusbLPLrtSAVwD6YcoAKhuzCeW0noGB77ff70h2eVtF?=
 =?us-ascii?Q?FIy9ArpiaV9hGNS6zdiIodiS2m+IvZrMZ2HzQlFDD+H0LBBpcUwAW1IRr++O?=
 =?us-ascii?Q?cbaB44w85Aw9Em2KL69AIXJWcQoIhagwgClLCDhdP13iLWn1C3gJA1M50AO0?=
 =?us-ascii?Q?BXtrpWVoINPQRq09gkv/PUWmAzf2R6E2QaMY6HIlHW1bIrbafBFYnWk6SYcw?=
 =?us-ascii?Q?M0tjJ93vl6yS/Q0BumX2ZprFM6QciWl2gafzNNLh3QSs0Azw4y1pooOkDkLD?=
 =?us-ascii?Q?BGrZEegEi2aW0NgmsKdcR6E266WuEClk6VTC/ORu29wtoLV9rCj4QZ6hdBL+?=
 =?us-ascii?Q?CfyQgTtITC/5omrrOVObdna0tq0Ok2bjKwsyHDUGMsMwwIXbO4qWOsbRRJWQ?=
 =?us-ascii?Q?pxlllvyji4CTRw3Xof7ZLl8k7cnl5Z5KcAiVM+bpyteNJu2RolchR2TlHkHv?=
 =?us-ascii?Q?EMVgSQd21Tog5/Vd0EBuCQQnPsqSnBGzzsBRiOTp9HPBx4L1G0JkDv1LpIU3?=
 =?us-ascii?Q?smHpgKkSbZjG3lGMfPVCdDPoP3zol69bz7rby50BcZ0hKnKGhRxTABDeOxF8?=
 =?us-ascii?Q?MTIP6PQefM8jHK83TgRON8EI8x8aOKR2MRtSwgPjPSC5E1ZFN4ot6wGohlEL?=
 =?us-ascii?Q?B23DmIOof9O6qp9N8zKQK+U46OF05i3Mn+RajwI7YWwiAcpJShaLuNtZKoom?=
 =?us-ascii?Q?PLnJzTWtsf//5b7ms8T6Q49J0he3rmEESd4mqFvKjlwGCebry2X7UFlHd9eK?=
 =?us-ascii?Q?ekdKDmleeYY50K7bbPW/YHKgpFqD4UEFaQMu1G58Yobpl1qrY6XNmyxD7yg6?=
 =?us-ascii?Q?COPkUz6RUkHKmDV+bHQUuj3Iof5iuE4+Ymc3QYILV5e+Tlp6bAIwMxeXEZFh?=
 =?us-ascii?Q?E8AD5deUE1L+q+kt6m4PPcteS9HgDFUcl4uHclqC7S4nXWcn3h5aFVXZ1yku?=
 =?us-ascii?Q?UDaXC3x/RI/vo6QHOQrQBO3qN1rGZDbvKKBfg2lPdVI5GZ6hMKFNpryILdtf?=
 =?us-ascii?Q?gRk4sfSS/qX+I47xXDbl5OYPPozHKjmrxJUoUCKxBarUpB6juSMXXDX7LTFL?=
 =?us-ascii?Q?N0HlKnt8NwMCnTeTo+eHdfEKkYilVrLrlR0+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OHN0WmuKu5auvg+b9ZiUvNNUkiDBBR5x4c0yuR2OU8iRysf/6/EQiutIirOE?=
 =?us-ascii?Q?Dw6gjO6tDudomEp9s+RKY90FCLFeyUa8MriuizQf4+qJGbZ9WfB7+bE0R745?=
 =?us-ascii?Q?CEd4KKUc9CIbsCA8XGHjgIpTSN67cemyHDlOrNDUsDDIMVuid+0/Zq2GBHqo?=
 =?us-ascii?Q?8oA2awgc0LLQuJcjdzFGI2P//cv98GJ7UgIG24P/8+DsJjwcBl4QyXsW/UYc?=
 =?us-ascii?Q?NG97NQ8X668WInZ53wLVAp4aUSAbCtT8bMZ3A3mOmvP1J0oJmcU4vgjQU8wJ?=
 =?us-ascii?Q?YojnWPHUQLyvhLirrFXI6G4Ujf4h1NznZZWvbpqLkINgAZ3+hEFyGkF3gXav?=
 =?us-ascii?Q?s1TObzpGgdZvwHF/sKNPuYC/NTdymJJodLAotNCPSBVUoAnZLQkKWz71xPC2?=
 =?us-ascii?Q?S6BiGiWlRJVHb8yrlmtwvS3t0ggI93Qw8m0WM7IXJzV25alZkHwP0dcqe3+o?=
 =?us-ascii?Q?KJzDW65V1Lgnr/4IVMmmnZftcPFS7zDybmBUwxRmqla7elYw4FfmYcYZHadR?=
 =?us-ascii?Q?xpZWcXfElGopQTMUsiP/NjMVQxRLi0xf/Q7ZOHkZohntTE/vARGL274ARxVJ?=
 =?us-ascii?Q?Kw992xGMUmvDAw/Do4R1nyuRLgS1XWO2+bo95A5fkhFIb+MkWg+2wDQ5S0RX?=
 =?us-ascii?Q?O6SV3q6xIDXejkb5Nif22Tv3IP8J5/O+LW8VbAzzN5J9c6LrBS/Hl6wlsyYC?=
 =?us-ascii?Q?LtCv2aL7PlNouE6kfvFnI/g7VMcUnY0wurOOrrcTz1iyLS6nWZ7ArTGlQUYa?=
 =?us-ascii?Q?wytgUFaagYB0gKr1ek0DC0kqUxHYX/h+1o+bsjfudzpOcg2n0NU8aMkJRkf2?=
 =?us-ascii?Q?/tU+lL+Ew1XLqJB9fxm19tkIN967Hg0IXZFyxeVqLTbd3hEIOU9J6jHAGaJc?=
 =?us-ascii?Q?hq2JgupyqK40JBHSsn9NppyzFE1bdypj2WkqzP2rB2KfTqIElYIFopKhleuk?=
 =?us-ascii?Q?LTy/+QsdqUcD5U2ZEZ9tdBjNdgxDg+qDt2v6yBuGV15zFceDwJ5EK6ED8tAJ?=
 =?us-ascii?Q?5lKvQwR9JQLkYqlyQqoO9d/eWN9RlSf8/qYxJ61B4EoAbVgkKrwaVFl8+o8E?=
 =?us-ascii?Q?dLchV4G+Ds58UjJ8U6MHa1EJGZxGKnB0eivat4Q07WU6iGghAlPJVSJpvP6D?=
 =?us-ascii?Q?5XIARmhjcqlEK8grmL5izYKHVSp+tgt3j6GhvtPYtUiCZLCtRgs+M0kOm2jA?=
 =?us-ascii?Q?dsdYRFdJokZQ8+fxig9M30nv8rCPLQnQTL/JPUatYMWAog4EIMD8CHp1oBvw?=
 =?us-ascii?Q?pYQoh5201xbbJXUSkrk+Lo/vH29yPU2UDjV6ed5Amx15krCOzT8ZxvCLCtY4?=
 =?us-ascii?Q?vv4pywoUaly+annBtr1Da4v7yolaWKcLdz+022HRDHzjw21iVqIsAf5lWjR/?=
 =?us-ascii?Q?JCCzxJ7Hprf4MOOXfk0jKzfQhz0CSkpeLZ1oYWCR86Dyg3zphdrySxhenQW5?=
 =?us-ascii?Q?89OwEw4J2lT0G3AQAGs5kxZRziNtGyYBDV7r8ZLd8zDVfAYOEKiwwM6foWN6?=
 =?us-ascii?Q?ebULTv8YYB6Mp/3hl0pWDKknU4INSn1mR62vCFCR9m+5dbdSfu3XK6sGvykl?=
 =?us-ascii?Q?6kYREJbGPGkSSC3zJwPiqtN8Zt+PETz66Y6khF1KHWs0YXVynkgIOcwb84BX?=
 =?us-ascii?Q?WuBft3bAh1gF5f1E+jVfW7rPQYZ/JfdiqA/swAhfLRbFX7gDGK7rES/8Mo3I?=
 =?us-ascii?Q?G85oXQFJ0pN3rz76t9xDfeF6c33iAdOoE1DV/sIQgLA1Iaj1u+dXM6XpkLWI?=
 =?us-ascii?Q?Gmtg39JRVHSJ8YDzqjU1Efm1hW/x5gs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c8a27e0-6d85-4ecd-f943-08de62868c0e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 18:11:54.9814 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uPa16jCGLZnF576R+LSW0TcrBVTBQMIIKhmGK5zeWI9W1YV4v9bbf5wQAbe3vPwUofDQkSza7FkqeGrDJFN7chzbHBnBsWqaTZ4MvhiqSug=
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

On Mon, Feb 02, 2026 at 04:33:08PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/query: Fix topology query pointer advance
> URL   : https://patchwork.freedesktop.org/series/160878/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4475-69c1143407ca17d556eb4e5ead7eb43b60a3fe65_BAT -> xe-pw-160878v1_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

CI.Full results never made it to the mailing list, but they're available
in Patchwork.  The only failure there is a GT / GuC CT hang unrelated to
the query uapi change in this patch.

Applied to drm-xe-next.  Thanks for the patch.


Matt


> 
>   
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-160878v1_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Possible fixes ####
> 
>   * igt@xe_waitfence@reltime:
>     - bat-dg2-oem2:       [FAIL][1] ([Intel XE#6520]) -> [PASS][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4475-69c1143407ca17d556eb4e5ead7eb43b60a3fe65/bat-dg2-oem2/igt@xe_waitfence@reltime.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160878v1/bat-dg2-oem2/igt@xe_waitfence@reltime.html
> 
>   
>   [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-4475-69c1143407ca17d556eb4e5ead7eb43b60a3fe65 -> xe-pw-160878v1
> 
>   IGT_8725: 8725
>   xe-4475-69c1143407ca17d556eb4e5ead7eb43b60a3fe65: 69c1143407ca17d556eb4e5ead7eb43b60a3fe65
>   xe-pw-160878v1: 160878v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160878v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
