Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B51AC47071
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 18:15:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF50A10E2B6;
	Thu, 16 Nov 2023 18:15:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4B9B10E2B6
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 18:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700158502; x=1731694502;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Wf3MIQ6BRRye3OL6vsZTYv9yhlEng1pIGL/kU8UvcYs=;
 b=jqBY8fl/Yrr4bL9Yi7R8ApEH5C+6VqjBA24x9LH06J4krlRhhmXdomb4
 vUFodzcJyu88f7w8TweH8Wm78xY0ZtKddHs3whxz5M0TXbB7+J3HuRHbK
 mBBGFTAW2kn2PwIy1cnWMZta9k7UUDQpZfKovu+mbZgYWU4UUlWc/a03P
 hR8ZRy/a9BZuVrvFfHozYNuB/sQM68VORDgV4dJGFa+hYkRzn4GyJ/MsQ
 ugu3/j0lovWHt50GjCQzp8TaUVxdR8HHQ7Gb0gq43XLwLUgrA+JLjLTmb
 j8MF1GSDl9mfusRCSHEJtwFsiGJ5S2dyBHBP6XW+KK0j9ojo3UCWEiKUq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="388309489"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; d="scan'208";a="388309489"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 10:15:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="909193822"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; d="scan'208";a="909193822"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Nov 2023 10:15:02 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 10:15:01 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 16 Nov 2023 10:15:01 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 16 Nov 2023 10:14:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gTvpekYiRxBE/JrK22hLFo4AdKd3A8s1I72mX45L91Fbn+w7b+fOEqQmBA+TcYk74ztHvYlDqS3buIdxR/ijAe3svZvFXXtef/jNFjsBwfP6OmND7XEphZaBFAKkJdCMBK0TeXJa2ETUzpWI6CARHRYB3wE5bt0Iz/y/5Yoo985vRiMLQX3AYtHocHDV7WQ00jCfnMmxQ7vIVqR2Fh0ZOB82c/We4D62hEWATl4BLWkFQ+x8I6hd+jtKLprzrSmnFjw3jfM4Ton70vlGYSvurwIR2BbDku3NS4O5j3lbQMov032AtQa6L4AaTpbyHi5xfdxprr3XMk5yMc+Gb7645w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O/QD+s2lT6u+L3vQJ3Bw+09I/VPyW5O99t+DfZQrT/g=;
 b=A7tcYA7sDSmy7PW00OQm/0Abf6ZoYikKMkGW/vvi/lMBuwfSgraO4L7b02NWiamIuF92ZWXc/rspZHmn1gMXL6S1hh3CJkBrxYqF/EBIs7CujH8KvMt5KB/H7P38bv365cyCucxuPYhsJ7KeXdQbEkJMBT5Q1IMPE1+pJBv5oEHBcIUILFCOp3xKb/8UUZ25jVWDqhns1+ae9fRHNBeN4kpgmccejONtadAXnQBch5Rqcq/1KbefWj9w5UVVFt3vspPHt6UVy5M7/o/PiAnSAZlVfs8fdSk2vK6Asgwlx/nEBfxyKHiyxNEg71UtNddAHK4tWUfgV2sumLuSFI+TNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17; Thu, 16 Nov
 2023 18:14:53 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::45c4:a2b8:6411:275e]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::45c4:a2b8:6411:275e%4]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 18:14:53 +0000
Date: Thu, 16 Nov 2023 12:14:50 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Message-ID: <vwvgnbjvwi66bjbfmpdmgudgsrbzrun3dev5psrl6bill4sfdx@j2xi2rxsbqky>
References: <20231116153901.31941-2-gustavo.sousa@intel.com>
 <20231116153901.31941-4-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231116153901.31941-4-gustavo.sousa@intel.com>
X-ClientProxiedBy: MW2PR16CA0001.namprd16.prod.outlook.com (2603:10b6:907::14)
 To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DM4PR11MB6479:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a4d7ddf-3693-47a3-b434-08dbe6cfee1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1sQk6OVfZj1rY3yKGMS9S7f/1BzKJ01InUCyz/2g6ICcCw3WR31NEY8eLmB0cpWAHEhdlWCcSBZnjRDYtpnBq7BfW2vzdUnx/61hN1EEt8WZ53a6juDhWdRCJHMi3uaHlhkTNYCIAzInhB5znRWG6OrtL7wCgn1tneCoSakoz0TKfzHyRmx8o+PvSdbD6rHx1s3+VK19ICMvmL5fD+VGvAiXA3yN48bw+R2KtcAbAl1y3gm6lV1e/g/aqjwxWmmr7i+2OpxWqex8PWw0YzuhqSCIQM2nw6aSnWGqwnGtJIp18fNzVKg+HmGiDGH1/GuZZvh563dudTc19nK17rJOG9XFCtMCmMjUApIjjCKqOBeC/zPEaeL/TinJfI4HBhUQtUE5VTa/Yn7GzE7JHm3MbW2qCUAy3D+TV9H0M7dwdA0a/1Cc9wudckOgNUDJsplwDDS0/lwEiWBYhwE7eyi194C9SVrFucHevBMQZXHCeQRKpHpOgSd89fduTTTV5bgox/N0mxjTPNROS0wQsvg/X2sW5yiUzQigASzBLZ/XmNWx8o7MzzU5GdwV69rWsmSZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(376002)(366004)(136003)(39860400002)(346002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(6862004)(6506007)(9686003)(33716001)(6512007)(38100700002)(2906002)(26005)(83380400001)(82960400001)(41300700001)(86362001)(5660300002)(66556008)(107886003)(478600001)(6636002)(316002)(66476007)(6486002)(66946007)(8676002)(4326008)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LPAwM/TAIKa2Ohas9zwscUaTjTdwz2LyqErZO3WGc9z5RO474W+50Ll/2xqi?=
 =?us-ascii?Q?+5AhK5W2nPQ82jj6rh0iBUj7hTdG9fXOCL69Aeki+Fpv8ixZ+hRQPj4OJeXz?=
 =?us-ascii?Q?TWisd2EbUb3NS09o4gMOFN3y4cBjFi8fWGICBdchmo7Hx4a8d+kHgbDh7syZ?=
 =?us-ascii?Q?vpnFZFZKnJ/Euyomblaq1JOAvUVtXXp31FpZc2I7IpDdMw2Py2gr2nlWqV1N?=
 =?us-ascii?Q?j4kHHx/JPrEPLrpLi8/x2gujYgWLB4jkvjKb/cHJbur1QjYPwdQYngKdCa8e?=
 =?us-ascii?Q?+fXrGJj0GOmaMVJllGpVJaeYL8vjc39NxZCBoIuw2wGCtsR0iSKbI9xZ98EP?=
 =?us-ascii?Q?hkcg/gXrOWQVDugjfob8GI95XE8SukrQ+wOv4x7HS/BJxD2W9HHLI3vItpSp?=
 =?us-ascii?Q?HTC6JCpYw2dS8BTWM1/NrdUthhuDbyaZEdpTZnqvv8th1Hn2pJf6HnzJA2J3?=
 =?us-ascii?Q?2+ReH2DIQjP3DAitTHGJ5bSOnG6klMJ/cbpqXOpqxya01oODZAEzQy1NYdFi?=
 =?us-ascii?Q?xtq5sWxDXoouaRtxBqOQ5vSFVtl0cRghT5Q4E8/mV2kL8z2eGPL7THTwewPN?=
 =?us-ascii?Q?HyenAZqeBDS/QpkYOPQHFwzkSDttLkOOi6JKra4bRseE4eLLfUuxKoKRVwIX?=
 =?us-ascii?Q?1u/tStdBX7tLZIMAtjA02bb7Bd1Csno0BcQr23yYj6CxU7Ylmk4xvmgCSiy0?=
 =?us-ascii?Q?JSQHo9KPt7fVmXm7gb+OILak+CJDPBdvg87wtha7tXse+0AnA0Fc+BeWQXMU?=
 =?us-ascii?Q?kCaAtc/vd9Rn0oP2qOO+sb2r1FsAWLhe39P+rmOvft8v3zbykMcDaA/cS5Ic?=
 =?us-ascii?Q?mVT4CttJ8oGGWsEySWFFPzqYLvkakr5Uqb7TdRXq7otVSTOVGSMD4l8xDG10?=
 =?us-ascii?Q?P8WqwDqUwJAG7e9B663vv834LAeO3ukZSMDfGAbCr/TjWvhvdbBZPUEfDvKG?=
 =?us-ascii?Q?YWJHf75kRIk2IrrdYF6rxLoIUEVtvzPrZch9IqDgi+ALOV1sdhuDlS/X8p8+?=
 =?us-ascii?Q?7chVGwYZFkMAfrVRDXadet3FvVVi8GTXGRV/Pe+dsxui/jENaaby5+oun3GN?=
 =?us-ascii?Q?m8KhBfNLm7fMJl8LSpyPOzY1KwONn6SX5IXKeZiB0HHKmo6KisK/vUt0GPvC?=
 =?us-ascii?Q?kNuXSv4kn0d39fq7d0wCX9Wpn0vYoupfmiQjmW0+QZqwmXlvLdlRfj2G5oLt?=
 =?us-ascii?Q?eJCFDUu1Ww6M2zPCkyBfvIyOta8/x3EBIlBw2HP7xqWkvv0yfOS5/HbyYJgl?=
 =?us-ascii?Q?VPvoDOWOzEBkNCjc6xPj4C95FhyhGyUWveng0N0k19oJswdR2eTm2VbxPryh?=
 =?us-ascii?Q?fxJP1O3p2umX9sUK8VBphCjdfYhk/O3jEp3QcifT47a8JwYTlKP+dtByjjwG?=
 =?us-ascii?Q?rEKC2KGGocFjc6hX2YemDh5RBvhhJrqgK6GTLsAl7ngXRd7d2uOy8ffqyczy?=
 =?us-ascii?Q?rKR03snCVvenATPFA8lDYG9oIpp0Oce09jOARq4XX0xLDdIJR2VhSfBdI/1K?=
 =?us-ascii?Q?YY6mm2ZBsDPAZn+M7qN99Zq9149A3CDXgntdWbdFpc0PXNplWs7Q6Nk656tC?=
 =?us-ascii?Q?hSXlT+3er/9dd+5Eaoygz3NUqv0affYL0VQj1wuTlPxzMnkuWMpZ5mEaQx5t?=
 =?us-ascii?Q?sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a4d7ddf-3693-47a3-b434-08dbe6cfee1d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 18:14:53.2330 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /xDxL00/LviaB+wtfux+Wh2vz5fu8aEK1ELo+okVwfKiiVOlMS51h5iiAkGvdSgJXyk7WLlhNvMcFKLFJ/7Xxh2wPywmseY4B9TE187NQSU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6479
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe/mmio: Make xe_mmio_wait32()
 aware of interrupts
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

On Thu, Nov 16, 2023 at 12:39:02PM -0300, Gustavo Sousa wrote:
>With the current implementation, a preemption or other kind of interrupt
>might happen between xe_mmio_read32() and ktime_get_raw(). Such an
>interruption (specially in the case of preemption) might be long enough
>to cause a timeout without giving a chance of a new check on the
>register value on a next iteration, which would have happened otherwise.
>
>This issue causes some sporadic timeouts in some code paths. As an
>example, we were experiencing some rare timeouts when waiting for PLL
>unlock for C10/C20 PHYs (see intel_cx0pll_disable()). After debugging,
>we found out that the PLL unlock was happening within the expected time
>period (20us), which suggested a bug in xe_mmio_wait32().
>
>To fix the issue, ensure that we do a last check out of the loop if
>necessary.
>
>This change was tested with the aforementioned PLL unlocking code path.
>Experiments showed that, before this change, we observed reported
>timeouts in 54 of 5000 runs; and, after this change, no timeouts were
>reported in 5000 runs.
>
>v2:
>  - Prefer an implementation without a barrier (v1 switched the order of
>    xe_mmio_read32() and ktime_get_raw() calls and added a barrier() in
>    between). (Lucas, Rodrigo)
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_mmio.c | 6 ++++++
> 1 file changed, 6 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>index 12df698f6764..16b3ca97f7b4 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.c
>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>@@ -536,6 +536,12 @@ int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 t
> 		wait <<= 1;
> 	}
>
>+	if (ret != 0) {
>+		read = xe_mmio_read32(gt, reg);
>+		if ((read & mask) == val)
>+			ret = 0;
>+	}
>+
> 	if (out_val)
> 		*out_val = read;
>
>-- 
>2.42.0
>
