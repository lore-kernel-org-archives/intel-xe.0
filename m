Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F91FCCF9E3
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 19:26:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EB4D10E328;
	Tue,  4 Nov 2025 19:26:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PfNkbQ32";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6793F10E328
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 19:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762284372; x=1793820372;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=b7gDNI0HMrhgXNKtBqf8rIHC9A0SHVi2HYad/PkiE88=;
 b=PfNkbQ323KkjK8HZQE2Ks0LY76CFE5khNga9up0LIVkf9rga07nygnsK
 SjqGhozV4APpl1LVPmIgIRY5POVuPEdGfn+tG3YoUcZf3NIpo1/huOVew
 wJyZBo6gpfrri8+VY7/TXM3VIMTNbgfXBsRR62mbcmNGrGWh1xVHr9VK8
 C3jNszygcrL1MQNQZv2VKS+YC8aXuzxUVuNEvumEkWqBpLxrc5y2Gigfn
 LUdYfAVhWK5LH54bzE3FZFbX9nlcyGfqkcc8qQpy2S/z7giGD1gnSYyIy
 co56aPqq9XNV8Y9WDgldzIvKAy3oKJJD44wS5Q/cPh0wX3UWSwchT+MbZ Q==;
X-CSE-ConnectionGUID: a/sraM8SRiyovoQrR6UXCw==
X-CSE-MsgGUID: SA7BNRs6SEiuAi7OlCZ9Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="67005843"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="67005843"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 11:26:12 -0800
X-CSE-ConnectionGUID: o5DQNM29QJKrkyg2sjf8Hw==
X-CSE-MsgGUID: /kSsQiujRxGgs+AWbDxBJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="210738221"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 11:26:12 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 11:26:11 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 4 Nov 2025 11:26:11 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.50) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 11:26:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nTJYPc5Z5qKydmf3i5lNeSDxee2DlBsUQYImaeiKyoDgeJ8eFNSx4L9rQW8/QMhBUC2xXFNXIK9WD/F6tuTPlivwVp7ZzxmLdOHJiVuRSkKupukpPrkr63tX4i5VP6sGvKyB3Lg4WM2WZFF7TgOZLdhrdule4+znKLSCQKkmGa+klmDiwHkbfVrIs8lB7eD2gMl2ZjxFr0kTy11DN3WaOYmn/uAnZAPU9nMEWGk4Uqd4tNZ2TmCGYsYsnS6IvJ1FetvPIZt6WmzBZEZ0AbN/xwlcHDivNRnKDyvKKFOdt7tF3M8hTrEiOXTIQ/4RpOz+6C6Ckv8oN47gNzhrtq8UTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LUlrup/+PDopuZdUDa+xf98SPlKhsa+/u/HnuieiQ+0=;
 b=R9ptKzKGIjYMu+gUqZrtoeBMPGmIDTLuDX2cMrbCW1aIEsKKSZRJEt+3X0hoFbrSbi8fJ5Y+B8zk6saTBtzB7N00waW2GQF01IZNIIo0FAFHRTyqbXLuLdqHmXqZOkhS53GIKMVHi6R7oc3/WQIXdLmXMVioIwkt54Xjxb1QKzV0vNFf0QCzhPF8UrnHHpnwaSpRdviulZVb9KzBD2qKguNmtur7kITlaKgyylCoMZuzQkhHK3dlo1Fl0ni1wP26brAj5Yu+LblAAjMJswFkMpEgKS4PG0tyFszQSmpkYeW7m+QK4nCv2o9d01k2kmMMuS0PKBUMLA+5/wj31bH+qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB7021.namprd11.prod.outlook.com (2603:10b6:510:223::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Tue, 4 Nov
 2025 19:26:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9275.013; Tue, 4 Nov 2025
 19:26:09 +0000
Date: Tue, 4 Nov 2025 11:26:05 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 03/16] drm/xe/multi_queue: Add GuC interface for multi
 queue support
Message-ID: <aQpTTQZ0Q7ipTFHB@lstrano-desk.jf.intel.com>
References: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
 <20251031182936.1882062-4-niranjana.vishwanathapura@intel.com>
 <aQZMTMd7JftUTcy5@lstrano-desk.jf.intel.com>
 <aQmHhz5htpispAv-@nvishwa1-desk>
 <aQo63JqpgA+ooy4Q@lstrano-desk.jf.intel.com>
 <aQpMOtVprHgzDxmO@nvishwa1-desk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aQpMOtVprHgzDxmO@nvishwa1-desk>
X-ClientProxiedBy: MW4PR03CA0342.namprd03.prod.outlook.com
 (2603:10b6:303:dc::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB7021:EE_
X-MS-Office365-Filtering-Correlation-Id: c9c08001-74df-44ab-c143-08de1bd80183
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SfSZWwA6kv6LSUdsVOmi72eyOjhskbWr3tHlJjq0yrl5aaTrWyixGh83na+w?=
 =?us-ascii?Q?XE1wSHg7YAjoVejA6erWGyNTki6hP7Qo3I82RHPcbCEZdbxRkOXYe8+OJ9HB?=
 =?us-ascii?Q?hcpIvc7v36cGFIDNZ3dwc7kXUO+N+71BqOFtCANaL8EHQSTf46AYChAAKxdy?=
 =?us-ascii?Q?XuLS5XGXzS1HjuslxBahB4gpT+n/EWAF53ICUCDoUp2CmEgjyRQPq95jH49Y?=
 =?us-ascii?Q?wfzegSLb/bMW4klXYvw0DU59Hw2LWDG044/t7eai/bDMFGUC/jPHao5lirlj?=
 =?us-ascii?Q?FsXHBdMQQRR/cTrWX6DKQ+GCPvVE6f/dbBMRcVEarjsSABwwVptGL5rLgbJw?=
 =?us-ascii?Q?zt1LuYhu9o3fc6wuCO6NYRD5JYe3Ifl311oKeNbKXEfjuS9oYkLcyCALD/jw?=
 =?us-ascii?Q?KugJ8AjQUEzmtuWIwkcuGlacAQ/GaRyvGH57zqULTNGByvGQenVGUebx3uU9?=
 =?us-ascii?Q?l4VMZ6Q7/2fVR/aSCD9WTsFukkSjYu100csmrM66ouaXr/x8J0EVGY6Efx4m?=
 =?us-ascii?Q?VBsS/kLpV23obZnWShP17oh+XLyYYe2wSAtBOLe+3gmQSQGhkqB7UwU5sccP?=
 =?us-ascii?Q?3EDGfiyn/hgk6rSoJEWk0VobcIwfQRgHL3HCA4Cz2OwMzPrme+rVplnQfSyx?=
 =?us-ascii?Q?GZ0PcY62hWaKa+mfDvWlEW/cbBfSye6/VoaS2KlSbJu3A6Mrtfsm0VPsOiGY?=
 =?us-ascii?Q?fm0e2lCv+90XRRLkIVGHdlpHI+DuJwDZiZ8UhxZmWkpBiUyYfxCyyJmqvzr0?=
 =?us-ascii?Q?oaa5WWNUxn7y6IlDSUKTI2JbxiQGznbPM/8+2FgUYcQS4aejtS4QMkOArPQv?=
 =?us-ascii?Q?qwZjMtGn9v/2BSURpXuf7t0Tb6r73v58z0ciJmIoJtV8B90aFdYNAJzRpxtw?=
 =?us-ascii?Q?fwq5u+vwzhr/RIxnyJUnirp89fxMZM4cJOqzg+YZwoywUZwICBKYYJZW7wV/?=
 =?us-ascii?Q?EADqcU0m1OV/MJ4NPDbLzEP+cfd3s7reWTiyNUZGGcx4ti3E7NsECLjggEiH?=
 =?us-ascii?Q?2ozHA2Q+pM3bfxIHbwvHqirfCSVAOHgcTVUFVi8VTMR7xg8qp59HLJ0hgh+G?=
 =?us-ascii?Q?w6n5mzAA/D4AO6J/UWipVOiaoBQ2IFMFiGtbMS71Q3eymQFEwSE/+5kvSfR6?=
 =?us-ascii?Q?oZEB+NHjO5ZjIhLoJa7klVcE38UHaLR78AJbpwshfmV+v7Z4ArNFJPn+7p4Y?=
 =?us-ascii?Q?2OUnWanjz1zGDvxAsUSP8ynLoQzUM44/qCredhE/5Ke1kQqAcrJkhtH/Chzn?=
 =?us-ascii?Q?5hgs8TKVViYIk6yryoRrzRH13YACfwntSBHu7on7mU9PygAC0OdySEMhmJMy?=
 =?us-ascii?Q?QAFk9yOfeE7pHgk/rS5Fusiv3PpkLME1Vx89UDPJKkxPDUoxJk4IPJkm1kKh?=
 =?us-ascii?Q?E+A2PfIn+hwahZBL2E65yxexcMFfuRsDfvCVVC3m6eQ5AQL3mA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2sR5iU/emsQ89+BnJ9xy0j2z7b/x6DVqYzcZzUxypbVbhcqhmnwP56mGua/l?=
 =?us-ascii?Q?Fp7rOLhxMYafF1x+ax4I5QNfkpGYWzQ4pXX+vy3bQcKu+X7v99GNFanH8Dif?=
 =?us-ascii?Q?1+DJJHOD2uGrqc7klQ0Uybc7f2bGKucsz9VmfpFPfnh9Rg3mCo8Obc3Jn1ea?=
 =?us-ascii?Q?omLi7VQlmqc4lNWUKakvwYeHLXke3WLHAra069m4vz6LF+U+dc/H5mQWCJ3A?=
 =?us-ascii?Q?Cvgdqg2RoprNP50nFwBd67PvqYfl3Oq64ldLcyIqRbzeV7PPUIpdBnpiFeF7?=
 =?us-ascii?Q?ZsmdlajM0DRdKtsFxCfHlkoBFkyeOpAlUzOEA2WSvy0Wd4FcUZDc5m8fAU39?=
 =?us-ascii?Q?I4Y7mfa8z1PaUPKPCqMfM+yMfKHAfKpc5sVSKI8k2kd3r36n5ELB5LGijV0i?=
 =?us-ascii?Q?eALd1DVWd9Jp15DdEqaWWlHUXeXxCzJfC5CfmxxUcEyexpUCPTlg6kb1u24U?=
 =?us-ascii?Q?js6wnfiNnHHLf7UTWrFRaKBtnJMgjWs4cI7EvM2IpVOw20LbAzqkvbplPpmd?=
 =?us-ascii?Q?ayN5CqG5edBpKUkf5ZwgHMQeuqF0hKIBCatF36v19Zi5ZAETNrp4HAqf5AWc?=
 =?us-ascii?Q?Q84Uenu73pmOaFNBDmgMAZpSkEUAgBKrtzYWmWeinywzioCOH9Md78HQbE9G?=
 =?us-ascii?Q?etMMvZa+NdTjvTTOYsK1N2vloKlGWsqnoJdkjxpIAoclgXd2RGm6uEZJkD+E?=
 =?us-ascii?Q?T8TVuCYmvu4dRqpyXWcNAaZb3l8UlE8NKbk/acCQ2hzSXrNW6aEqQ2iURz67?=
 =?us-ascii?Q?1sX3ps5CWR4CwGgob262irZGsSokn/Sz/FPsYKpGXEIEdBxloy/5t3Ma4xfa?=
 =?us-ascii?Q?7sW8XXwuS5ilp05sg6GATjG2GQYJ4zPB3wQ0AiKNUD54YJ579ja3wdpKvwxb?=
 =?us-ascii?Q?IPto+pSdAUFUgpbDFuMkbDpsfnUwy03lugQgc/20jYuipTctKlEZ2E0OMvEy?=
 =?us-ascii?Q?qlLse4JULCVEbZOfGRWndFDUykSs0ucAKjP00TOy+NoSzrN+5MBX5jtMv7Hz?=
 =?us-ascii?Q?KOM+HwV9ylELrDe8f1TS0Xy8MkOZIBTJMSgAl/fx+Kz60af3dxiG1mhbCpoc?=
 =?us-ascii?Q?ScrMgjuORw0BQKFZHr7tb9m5/XUmzCmtHmXsExs8tP6iWXXGDVW4fhjHJBYm?=
 =?us-ascii?Q?jTQkY/IonS+bJ3y455vRzj/k3tjH7Ehb/dZDOVi2w35tJ2gqeJWVSOxp47tL?=
 =?us-ascii?Q?/vLB8VLaQENkBZ/3NbBXrxjWD6KGiKHbhCgmhdADaja5PYX5p7tH0Qneesza?=
 =?us-ascii?Q?YYSDGyr+JAtpWm47/Cz8oS6fCRFg4LE9Ausij7O3SUFcNb2MvVvceMBoPxG1?=
 =?us-ascii?Q?2z2jTW96jbK6Ebxbg+EjMNvWb7E+xznROpnxcnp2FsrW36eKnTzkGj2jzTnX?=
 =?us-ascii?Q?VrCOO5eL3aIJZ+bHc4v4Wv23Qk2y6eqjPP0HdcyAQW+Hicz6x6NChGuckag2?=
 =?us-ascii?Q?topT9UwomJCRroZetjxWV+JEM7/phYKihL/RhEvlUdzqN4w5jxsV6BTqJ8MM?=
 =?us-ascii?Q?hEW8OVVbngTOA01xim5xcgQHe1GOXW3kxEYZgj1Q7yVRBxz5vjpx8Mr+iWYo?=
 =?us-ascii?Q?qo/T1LE29A7QcLLm+obVp/Mj4II335M+RIeat8izfSi6HQllCd31+qWxCPFK?=
 =?us-ascii?Q?9A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c9c08001-74df-44ab-c143-08de1bd80183
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 19:26:09.1826 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K69ydOkXstt6ADRwWtDMti11neUfC0FAoc7JHPGNWNNyjxXBU1GwFi1VueF7sdTnTQ2W5tX3gtMkNJ4FiXYnHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7021
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

On Tue, Nov 04, 2025 at 10:55:54AM -0800, Niranjana Vishwanathapura wrote:
> On Tue, Nov 04, 2025 at 09:41:48AM -0800, Matthew Brost wrote:
> > On Mon, Nov 03, 2025 at 08:56:39PM -0800, Niranjana Vishwanathapura wrote:
> > > On Sat, Nov 01, 2025 at 11:07:08AM -0700, Matthew Brost wrote:
> > > > On Fri, Oct 31, 2025 at 11:29:23AM -0700, Niranjana Vishwanathapura wrote:
> > > > > Implement GuC commands and response along with the Context
> > > > > Group Page (CGP) interface for multi queue support.
> > > > >
> > > > > Ensure that only primary queue (q0) of a multi queue group
> > > > > communicate with GuC. The secondary queues of the group only
> > > > > need to maintain LRCA and interface with drm scheduler.
> > > > >
> > > > > Use primary queue's submit_wq for all secondary queues of a multi
> > > > > queue group. This serialization avoids any locking around CGP
> > > > > synchronization with GuC.
> > > > >
> > > >
> > > > Not a complete review, but a few comments.
> > > >
> > > > > Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> > > > > Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/xe/abi/guc_actions_abi.h |   3 +
> > > > >  drivers/gpu/drm/xe/xe_exec_queue_types.h |   2 +
> > > > >  drivers/gpu/drm/xe/xe_guc_ct.c           |   4 +
> > > > >  drivers/gpu/drm/xe/xe_guc_fwif.h         |   3 +
> > > > >  drivers/gpu/drm/xe/xe_guc_submit.c       | 302 +++++++++++++++++++----
> > > > >  drivers/gpu/drm/xe/xe_guc_submit.h       |   1 +
> > > > >  6 files changed, 270 insertions(+), 45 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> > > > > index 47756e4674a1..3e9fbed9cda6 100644
> > > > > --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> > > > > +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> > > > > @@ -139,6 +139,9 @@ enum xe_guc_action {
> > > > >  	XE_GUC_ACTION_DEREGISTER_G2G = 0x4508,
> > > > >  	XE_GUC_ACTION_DEREGISTER_CONTEXT_DONE = 0x4600,
> > > > >  	XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC = 0x4601,
> > > > > +	XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_QUEUE = 0x4602,
> > > > > +	XE_GUC_ACTION_MULTI_QUEUE_CONTEXT_CGP_SYNC = 0x4603,
> > > > > +	XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE = 0x4604,
> > > > >  	XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
> > > > >  	XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
> > > > >  	XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER = 0x550C,
> > > > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > > index 3856776df5c4..38e47b003259 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > > @@ -47,6 +47,8 @@ struct xe_exec_queue_group {
> > > > >  	struct xarray xa;
> > > > >  	/** @list_lock: Secondary queue list lock */
> > > > >  	struct mutex list_lock;
> > > > > +	/** @sync_pending: CGP_SYNC_DONE g2h response pending */
> > > > > +	bool sync_pending;
> > > > >  };
> > > > >
> > > > >  /**
> > > > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > > index e68953ef3a00..48b5006eb080 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > > @@ -1304,6 +1304,7 @@ static int parse_g2h_event(struct xe_guc_ct *ct, u32 *msg, u32 len)
> > > > >  	lockdep_assert_held(&ct->lock);
> > > > >
> > > > >  	switch (action) {
> > > > > +	case XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE:
> > > > >  	case XE_GUC_ACTION_SCHED_CONTEXT_MODE_DONE:
> > > > >  	case XE_GUC_ACTION_DEREGISTER_CONTEXT_DONE:
> > > > >  	case XE_GUC_ACTION_SCHED_ENGINE_MODE_DONE:
> > > > > @@ -1570,6 +1571,9 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
> > > > >  		ret = xe_guc_g2g_test_notification(guc, payload, adj_len);
> > > > >  		break;
> > > > >  #endif
> > > > > +	case XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE:
> > > > > +		ret = xe_guc_exec_queue_cgp_sync_done_handler(guc, payload, adj_len);
> > > > > +		break;
> > > > >  	default:
> > > > >  		xe_gt_err(gt, "unexpected G2H action 0x%04x\n", action);
> > > > >  	}
> > > > > diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> > > > > index c90dd266e9cf..610dfb2f1cb5 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> > > > > @@ -16,6 +16,7 @@
> > > > >  #define G2H_LEN_DW_DEREGISTER_CONTEXT		3
> > > > >  #define G2H_LEN_DW_TLB_INVALIDATE		3
> > > > >  #define G2H_LEN_DW_G2G_NOTIFY_MIN		3
> > > > > +#define G2H_LEN_DW_MULTI_QUEUE_CONTEXT		4
> > > >
> > > > This value doesn't look right. I'm not sure where 4 is coming from.
> > > >
> > > > The length of XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE
> > > > appears to be 2. So with a value of 4, I believe the G2H credits will
> > > > leak.
> > > >
> > > > You can run a multi-q test, then check the following debugfs:
> > > >
> > > > cat /sys/kernel/debug/dri/0/gt0/uc/guc_info
> > > >
> > > > In particular, these are the interesting fields:
> > > >
> > > > G2H CTB (all sizes in DW):
> > > >        ...
> > > > 	resv_space: 16384
> > > >        ...
> > > > 	g2h outstanding: 0
> > > >
> > > > ^^^ This is what an idle G2H should look like. I suspect both G2H
> > > > outstanding values will be non-zero, and resv_space will continuously
> > > > decrease when running a multi-queue test.
> > > >
> > > 
> > > Looks like G2H_LEN_DW_MULTI_QUEUE_CONTEXT should be 3.
> > > 2 dwords header (HXG event) and 1 dword payload. Will change.
> > > 
> > > However, I always saw 'g2h outsanding' being 0 and resv_space being 16384,
> > > after running the multi-queue tests, irrespective of whether I set
> > > G2H_LEN_DW_MULTI_QUEUE_CONTEXT to 3 or 4.
> > > 
> > 
> > That is really odd the credits didn't get out screwed up. I'd double
> > check on this as that doesn't seem right. Perhaps the runtime PM refs
> > drop to zero and the GuC gets reloaded? We are removing that though here
> > [1]. Maybe try with this series.
> > 
> > [1] https://patchwork.freedesktop.org/series/154017/
> > 
> > I still think the value should be 2 here as this like deregister_done
> > which delivers a guc_id in msg[0].
> > 
> 
> Yah, it is similar to deregister_done. The value of
> G2H_LEN_DW_DEREGISTER_CONTEXT is also set to 3 above.
> I tried with 2, but got guc error.
> I have set it to 3 in the v2 patch series.
> 

Ah, is 3. I thought it was 2. So yes, 3 appears to be the correct value.

Matt

> > > > >
> > > > >  #define GUC_ID_MAX			65535
> > > > >  #define GUC_ID_UNKNOWN			0xffffffff
> > > > > @@ -62,6 +63,8 @@ struct guc_ctxt_registration_info {
> > > > >  	u32 wq_base_lo;
> > > > >  	u32 wq_base_hi;
> > > > >  	u32 wq_size;
> > > > > +	u32 cgp_lo;
> > > > > +	u32 cgp_hi;
> > > > >  	u32 hwlrca_lo;
> > > > >  	u32 hwlrca_hi;
> > > > >  };
> > > > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > index d4ffdb71ef3d..d2aa9a2524e7 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > @@ -46,6 +46,7 @@
> > > > >  #include "xe_trace.h"
> > > > >  #include "xe_uc_fw.h"
> > > > >  #include "xe_vm.h"
> > > > > +#include "xe_bo.h"
> > > > >
> > > > >  static struct xe_guc *
> > > > >  exec_queue_to_guc(struct xe_exec_queue *q)
> > > > > @@ -541,7 +542,8 @@ static void init_policies(struct xe_guc *guc, struct xe_exec_queue *q)
> > > > >  	u32 slpc_exec_queue_freq_req = 0;
> > > > >  	u32 preempt_timeout_us = q->sched_props.preempt_timeout_us;
> > > > >
> > > > > -	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
> > > > > +	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q) &&
> > > > > +		     !xe_exec_queue_is_multi_queue_secondary(q));
> > > > >
> > > > >  	if (q->flags & EXEC_QUEUE_FLAG_LOW_LATENCY)
> > > > >  		slpc_exec_queue_freq_req |= SLPC_CTX_FREQ_REQ_IS_COMPUTE;
> > > > > @@ -561,6 +563,8 @@ static void set_min_preemption_timeout(struct xe_guc *guc, struct xe_exec_queue
> > > > >  {
> > > > >  	struct exec_queue_policy policy;
> > > > >
> > > > > +	xe_assert(guc_to_xe(guc), !xe_exec_queue_is_multi_queue_secondary(q));
> > > > > +
> > > > >  	__guc_exec_queue_policy_start_klv(&policy, q->guc->id);
> > > > >  	__guc_exec_queue_policy_add_preemption_timeout(&policy, 1);
> > > > >
> > > > > @@ -575,6 +579,130 @@ static void set_min_preemption_timeout(struct xe_guc *guc, struct xe_exec_queue
> > > > >  	xe_map_wr_field(xe_, &map_, 0, struct guc_submit_parallel_scratch, \
> > > > >  			field_, val_)
> > > > >
> > > > > +#define CGP_VERSION_MAJOR_SHIFT	8
> > > > > +
> > > > > +static void xe_guc_exec_queue_group_cgp_update(struct xe_device *xe,
> > > > > +					       struct xe_exec_queue *q)
> > > > > +{
> > > > > +	struct xe_exec_queue_group *group = q->multi_queue.group;
> > > > > +	u32 guc_id = group->primary->guc->id;
> > > > > +
> > > > > +	/* Currently implementing CGP version 1.0 */
> > > > > +	xe_map_wr(xe, &group->cgp_bo->vmap, 0, u32,
> > > > > +		  1 << CGP_VERSION_MAJOR_SHIFT);
> > > > > +
> > > > > +	xe_map_wr(xe, &group->cgp_bo->vmap,
> > > > > +		  (32 + q->multi_queue.pos * 2) * sizeof(u32),
> > > > > +		  u32, lower_32_bits(xe_lrc_descriptor(q->lrc[0])));
> > > > > +
> > > > > +	xe_map_wr(xe, &group->cgp_bo->vmap,
> > > > > +		  (33 + q->multi_queue.pos * 2) * sizeof(u32),
> > > > > +		  u32, guc_id);
> > > > > +
> > > > > +	if (q->multi_queue.pos / 32) {
> > > > > +		xe_map_wr(xe, &group->cgp_bo->vmap, 17 * sizeof(u32),
> > > > > +			  u32, BIT(q->multi_queue.pos % 32));
> > > > > +		xe_map_wr(xe, &group->cgp_bo->vmap, 16 * sizeof(u32), u32, 0);
> > > > > +	} else {
> > > > > +		xe_map_wr(xe, &group->cgp_bo->vmap, 16 * sizeof(u32),
> > > > > +			  u32, BIT(q->multi_queue.pos));
> > > > > +		xe_map_wr(xe, &group->cgp_bo->vmap, 17 * sizeof(u32), u32, 0);
> > > > > +	}
> > > > > +}
> > > > > +
> > > > > +static void xe_guc_exec_queue_group_cgp_sync(struct xe_guc *guc,
> > > > > +					     struct xe_exec_queue *q,
> > > > > +					     const u32 *action, u32 len)
> > > > > +{
> > > > > +	struct xe_exec_queue_group *group = q->multi_queue.group;
> > > > > +	struct xe_device *xe = guc_to_xe(guc);
> > > > > +	long ret;
> > > > > +
> > > > > +	/*
> > > > > +	 * As all queues of a multi queue group use single drm scheduler
> > > > > +	 * submit workqueue, CGP synchronization with GuC are serialized.
> > > > > +	 * Hence, no locking is required here.
> > > > > +	 * Wait for any pending CGP_SYNC_DONE response before updating the
> > > > > +	 * CGP page and sending CGP_SYNC message.
> > > > > +	 */
> > > > > +	ret = wait_event_timeout(guc->ct.wq,
> > > > > +				 !READ_ONCE(group->sync_pending) ||
> > > > > +				 xe_guc_read_stopped(guc), HZ);
> > > > > +	if (!ret || xe_guc_read_stopped(guc)) {
> > > > > +		drm_err(&xe->drm, "Wait for CGP_SYNC_DONE response failed!\n");
> > > >
> > > > If this occurs you need a GT reset which should detect
> > > > group->sync_pending in guc_exec_queue_stop and clean it up.
> > > >
> > > 
> > > hmm...ok, let me give that a try. Not sure how urgent is this as ideally
> > > it should never occur.
> > > 
> > 
> > It shouldn't occur, but for correctness best to at least attempt to get
> > this right upfront.
> 
> Ok, will work on it.
> 
> > 
> > > > Also here is where VF migration needs to be considered. The
> > > > wait_event_timeout should pop out on vf_recovery being set, but not
> > > > trigger a GT reset. In this case we need likely need some per secondary
> > > > queue tracking state to figure out which secondary queues lost the CPG
> > > > syncs so that flow can recover. We can figure out part out a bit later
> > > > though.
> > > 
> > > Hmm...ok.
> > > 
> > > >
> > > > > +		/* Something wrong with the CTB or GuC, no need to proceed */
> > > > > +		return;
> > > > > +	}
> > > > > +
> > > > > +	xe_guc_exec_queue_group_cgp_update(xe, q);
> > > > > +
> > > > > +	WRITE_ONCE(group->sync_pending, true);
> > > > > +	xe_guc_ct_send(&guc->ct, action, len, G2H_LEN_DW_MULTI_QUEUE_CONTEXT, 1);
> > > >
> > > > The problem here appears to be two fold:
> > > >
> > > > - The value of G2H_LEN_DW_MULTI_QUEUE_CONTEXT looks incorrect
> > > > - On multi-q registration both G2H credits and count are set but multi-q
> > > >  register doesn't produce a G2H response. See my comment above thinga
> > > >  getting leaked, that can't happen as PM will be off and eventually G2H
> > > >  credits will run out and deadlock the CT channel leading to a GT reset.
> > > >
> > > 
> > > Responded above.
> > > 
> > > > > +}
> > > > > +
> > > > > +static void __register_exec_queue(struct xe_guc *guc,
> > > > > +				  struct guc_ctxt_registration_info *info)
> > > > > +{
> > > > > +	u32 action[] = {
> > > > > +		XE_GUC_ACTION_REGISTER_CONTEXT,
> > > > > +		info->flags,
> > > > > +		info->context_idx,
> > > > > +		info->engine_class,
> > > > > +		info->engine_submit_mask,
> > > > > +		info->wq_desc_lo,
> > > > > +		info->wq_desc_hi,
> > > > > +		info->wq_base_lo,
> > > > > +		info->wq_base_hi,
> > > > > +		info->wq_size,
> > > > > +		info->hwlrca_lo,
> > > > > +		info->hwlrca_hi,
> > > > > +	};
> > > > > +
> > > > > +	/* explicitly checks some fields that we might fixup later */
> > > > > +	xe_gt_assert(guc_to_gt(guc), info->wq_desc_lo ==
> > > > > +		     action[XE_GUC_REGISTER_CONTEXT_DATA_5_WQ_DESC_ADDR_LOWER]);
> > > > > +	xe_gt_assert(guc_to_gt(guc), info->wq_base_lo ==
> > > > > +		     action[XE_GUC_REGISTER_CONTEXT_DATA_7_WQ_BUF_BASE_LOWER]);
> > > > > +	xe_gt_assert(guc_to_gt(guc), info->hwlrca_lo ==
> > > > > +		     action[XE_GUC_REGISTER_CONTEXT_DATA_10_HW_LRC_ADDR]);
> > > > > +
> > > > > +	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
> > > > > +}
> > > > > +
> > > > > +static void __register_exec_queue_group(struct xe_guc *guc,
> > > > > +					struct xe_exec_queue *q,
> > > > > +					struct guc_ctxt_registration_info *info)
> > > > > +{
> > > > > +#define MAX_MULTI_QUEUE_REG_SIZE	(8)
> > > > > +	struct xe_device *xe = guc_to_xe(guc);
> > > > > +	u32 action[MAX_MULTI_QUEUE_REG_SIZE];
> > > > > +	int len = 0;
> > > > > +
> > > > > +	if (xe_exec_queue_is_multi_queue_primary(q)) {
> > > > > +		action[len++] = XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_QUEUE;
> > > >
> > > > Again as mentioned above, this command doesn't require G2H credits
> > > > unless this produces a XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE
> > > > response.
> > > >
> > > 
> > > Yes, XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_QUEUE will have a
> > > XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE response from GuC.
> > > 
> > 
> > Ah, ok. That at least explains why g2h outstanding is the correct value,
> > doesn't explain the credits though. Can you add a comment indicating
> > XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_QUEUE results in
> > XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE?
> > 
> 
> Ok, added comment in v2.
> 
> > > > > +		action[len++] = info->flags;
> > > > > +		action[len++] = info->context_idx;
> > > > > +		action[len++] = info->engine_class;
> > > > > +		action[len++] = info->engine_submit_mask;
> > > > > +		action[len++] = 0; /* Reserved */
> > > > > +		action[len++] = info->cgp_lo;
> > > > > +		action[len++] = info->cgp_hi;
> > > > > +	} else {
> > > > > +		/*
> > > > > +		 * No need to wait before CGP sync since CT descriptors
> > > > > +		 * should be ordered.
> > > > > +		 */
> > > > > +
> > > > > +		action[len++] = XE_GUC_ACTION_MULTI_QUEUE_CONTEXT_CGP_SYNC;
> > > > > +		action[len++] = q->multi_queue.group->primary->guc->id;
> > > > > +	}
> > > > > +
> > > > > +	xe_assert(xe, len <= MAX_MULTI_QUEUE_REG_SIZE);
> > > > > +#undef MAX_MULTI_QUEUE_REG_SIZE
> > > > > +
> > > > > +	xe_guc_exec_queue_group_cgp_sync(guc, q, action, len);
> > > > > +}
> > > > > +
> > > > >  static void __register_mlrc_exec_queue(struct xe_guc *guc,
> > > > >  				       struct xe_exec_queue *q,
> > > > >  				       struct guc_ctxt_registration_info *info)
> > > > > @@ -622,35 +750,6 @@ static void __register_mlrc_exec_queue(struct xe_guc *guc,
> > > > >  	xe_guc_ct_send(&guc->ct, action, len, 0, 0);
> > > > >  }
> > > > >
> > > > > -static void __register_exec_queue(struct xe_guc *guc,
> > > > > -				  struct guc_ctxt_registration_info *info)
> > > > > -{
> > > > > -	u32 action[] = {
> > > > > -		XE_GUC_ACTION_REGISTER_CONTEXT,
> > > > > -		info->flags,
> > > > > -		info->context_idx,
> > > > > -		info->engine_class,
> > > > > -		info->engine_submit_mask,
> > > > > -		info->wq_desc_lo,
> > > > > -		info->wq_desc_hi,
> > > > > -		info->wq_base_lo,
> > > > > -		info->wq_base_hi,
> > > > > -		info->wq_size,
> > > > > -		info->hwlrca_lo,
> > > > > -		info->hwlrca_hi,
> > > > > -	};
> > > > > -
> > > > > -	/* explicitly checks some fields that we might fixup later */
> > > > > -	xe_gt_assert(guc_to_gt(guc), info->wq_desc_lo ==
> > > > > -		     action[XE_GUC_REGISTER_CONTEXT_DATA_5_WQ_DESC_ADDR_LOWER]);
> > > > > -	xe_gt_assert(guc_to_gt(guc), info->wq_base_lo ==
> > > > > -		     action[XE_GUC_REGISTER_CONTEXT_DATA_7_WQ_BUF_BASE_LOWER]);
> > > > > -	xe_gt_assert(guc_to_gt(guc), info->hwlrca_lo ==
> > > > > -		     action[XE_GUC_REGISTER_CONTEXT_DATA_10_HW_LRC_ADDR]);
> > > > > -
> > > > > -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
> > > > > -}
> > > > > -
> > > > >  static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
> > > > >  {
> > > > >  	struct xe_guc *guc = exec_queue_to_guc(q);
> > > > > @@ -670,6 +769,13 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
> > > > >  	info.flags = CONTEXT_REGISTRATION_FLAG_KMD |
> > > > >  		FIELD_PREP(CONTEXT_REGISTRATION_FLAG_TYPE, ctx_type);
> > > > >
> > > > > +	if (xe_exec_queue_is_multi_queue(q)) {
> > > > > +		struct xe_exec_queue_group *group = q->multi_queue.group;
> > > > > +
> > > > > +		info.cgp_lo = xe_bo_ggtt_addr(group->cgp_bo);
> > > > > +		info.cgp_hi = 0;
> > > > > +	}
> > > > > +
> > > > >  	if (xe_exec_queue_is_parallel(q)) {
> > > > >  		u64 ggtt_addr = xe_lrc_parallel_ggtt_addr(lrc);
> > > > >  		struct iosys_map map = xe_lrc_parallel_map(lrc);
> > > > > @@ -700,11 +806,15 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
> > > > >
> > > > >  	set_exec_queue_registered(q);
> > > > >  	trace_xe_exec_queue_register(q);
> > > > > -	if (xe_exec_queue_is_parallel(q))
> > > > > +	if (xe_exec_queue_is_multi_queue(q))
> > > > > +		__register_exec_queue_group(guc, q, &info);
> > > > > +	else if (xe_exec_queue_is_parallel(q))
> > > > >  		__register_mlrc_exec_queue(guc, q, &info);
> > > > >  	else
> > > > >  		__register_exec_queue(guc, &info);
> > > > > -	init_policies(guc, q);
> > > > > +
> > > > > +	if (!xe_exec_queue_is_multi_queue_secondary(q))
> > > > > +		init_policies(guc, q);
> > > > >  }
> > > > >
> > > > >  static u32 wq_space_until_wrap(struct xe_exec_queue *q)
> > > > > @@ -833,6 +943,12 @@ static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
> > > > >  	if (exec_queue_suspended(q) && !xe_exec_queue_is_parallel(q))
> > > > >  		return;
> > > > >
> > > > > +	/*
> > > > > +	 * All queues in a multi-queue group will use the primary queue
> > > > > +	 * of the group to interface with GuC.
> > > > > +	 */
> > > > > +	q = xe_exec_queue_multi_queue_primary(q);
> > > > > +
> > > > >  	if (!exec_queue_enabled(q) && !exec_queue_suspended(q)) {
> > > > >  		action[len++] = XE_GUC_ACTION_SCHED_CONTEXT_MODE_SET;
> > > > >  		action[len++] = q->guc->id;
> > > > > @@ -879,6 +995,18 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
> > > > >  	trace_xe_sched_job_run(job);
> > > > >
> > > > >  	if (!killed_or_banned_or_wedged && !xe_sched_job_is_error(job)) {
> > > > > +		if (xe_exec_queue_is_multi_queue_secondary(q)) {
> > > > > +			struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
> > > > > +
> > > > > +			if (exec_queue_killed_or_banned_or_wedged(primary)) {
> > > > > +				killed_or_banned_or_wedged = true;
> > > > > +				goto run_job_out;
> > > > > +			}
> > > > > +
> > > > > +			if (!exec_queue_registered(primary))
> > > > > +				register_exec_queue(primary, GUC_CONTEXT_NORMAL);
> > > > > +		}
> > > > > +
> > > > >  		if (!exec_queue_registered(q))
> > > > >  			register_exec_queue(q, GUC_CONTEXT_NORMAL);
> > > > >  		if (!job->skip_emit)
> > > > > @@ -887,6 +1015,7 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
> > > > >  		job->skip_emit = false;
> > > > >  	}
> > > > >
> > > > > +run_job_out:
> > > > >  	/*
> > > > >  	 * We don't care about job-fence ordering in LR VMs because these fences
> > > > >  	 * are never exported; they are used solely to keep jobs on the pending
> > > > > @@ -912,6 +1041,11 @@ int xe_guc_read_stopped(struct xe_guc *guc)
> > > > >  	return atomic_read(&guc->submission_state.stopped);
> > > > >  }
> > > > >
> > > > > +static void handle_multi_queue_secondary_sched_done(struct xe_guc *guc,
> > > > > +						    struct xe_exec_queue *q,
> > > > > +						    u32 runnable_state);
> > > > > +static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q);
> > > > > +
> > > > >  #define MAKE_SCHED_CONTEXT_ACTION(q, enable_disable)			\
> > > > >  	u32 action[] = {						\
> > > > >  		XE_GUC_ACTION_SCHED_CONTEXT_MODE_SET,			\
> > > > > @@ -925,7 +1059,9 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
> > > > >  	MAKE_SCHED_CONTEXT_ACTION(q, DISABLE);
> > > > >  	int ret;
> > > > >
> > > > > -	set_min_preemption_timeout(guc, q);
> > > > > +	if (!xe_exec_queue_is_multi_queue_secondary(q))
> > > > > +		set_min_preemption_timeout(guc, q);
> > > > > +
> > > > >  	smp_rmb();
> > > > >  	ret = wait_event_timeout(guc->ct.wq,
> > > > >  				 (!exec_queue_pending_enable(q) &&
> > > > > @@ -953,9 +1089,12 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
> > > > >  	 * Reserve space for both G2H here as the 2nd G2H is sent from a G2H
> > > > >  	 * handler and we are not allowed to reserved G2H space in handlers.
> > > > >  	 */
> > > > > -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> > > > > -		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET +
> > > > > -		       G2H_LEN_DW_DEREGISTER_CONTEXT, 2);
> > > > > +	if (xe_exec_queue_is_multi_queue_secondary(q))
> > > > > +		handle_multi_queue_secondary_sched_done(guc, q, 0);
> > > > > +	else
> > > > > +		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> > > > > +			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET +
> > > > > +			       G2H_LEN_DW_DEREGISTER_CONTEXT, 2);
> > > > >  }
> > > > >
> > > > >  static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
> > > > > @@ -1161,8 +1300,11 @@ static void enable_scheduling(struct xe_exec_queue *q)
> > > > >  	set_exec_queue_enabled(q);
> > > > >  	trace_xe_exec_queue_scheduling_enable(q);
> > > > >
> > > > > -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> > > > > -		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> > > > > +	if (xe_exec_queue_is_multi_queue_secondary(q))
> > > > > +		handle_multi_queue_secondary_sched_done(guc, q, 1);
> > > > > +	else
> > > > > +		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> > > > > +			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> > > > >
> > > > >  	ret = wait_event_timeout(guc->ct.wq,
> > > > >  				 !exec_queue_pending_enable(q) ||
> > > > > @@ -1186,14 +1328,17 @@ static void disable_scheduling(struct xe_exec_queue *q, bool immediate)
> > > > >  	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
> > > > >  	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
> > > > >
> > > > > -	if (immediate)
> > > > > +	if (immediate && !xe_exec_queue_is_multi_queue_secondary(q))
> > > > >  		set_min_preemption_timeout(guc, q);
> > > > >  	clear_exec_queue_enabled(q);
> > > > >  	set_exec_queue_pending_disable(q);
> > > > >  	trace_xe_exec_queue_scheduling_disable(q);
> > > > >
> > > > > -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> > > > > -		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> > > > > +	if (xe_exec_queue_is_multi_queue_secondary(q))
> > > > > +		handle_multi_queue_secondary_sched_done(guc, q, 0);
> > > > > +	else
> > > > > +		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> > > > > +			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> > > > >  }
> > > > >
> > > > >  static void __deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
> > > > > @@ -1211,8 +1356,11 @@ static void __deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
> > > > >  	set_exec_queue_destroyed(q);
> > > > >  	trace_xe_exec_queue_deregister(q);
> > > > >
> > > > > -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> > > > > -		       G2H_LEN_DW_DEREGISTER_CONTEXT, 1);
> > > > > +	if (xe_exec_queue_is_multi_queue_secondary(q))
> > > > > +		handle_deregister_done(guc, q);
> > > > > +	else
> > > > > +		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> > > > > +			       G2H_LEN_DW_DEREGISTER_CONTEXT, 1);
> > > > >  }
> > > > >
> > > > >  static enum drm_gpu_sched_stat
> > > > > @@ -1660,6 +1808,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
> > > > >  {
> > > > >  	struct xe_gpu_scheduler *sched;
> > > > >  	struct xe_guc *guc = exec_queue_to_guc(q);
> > > > > +	struct workqueue_struct *submit_wq = NULL;
> > > > >  	struct xe_guc_exec_queue *ge;
> > > > >  	long timeout;
> > > > >  	int err, i;
> > > > > @@ -1680,8 +1829,20 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
> > > > >
> > > > >  	timeout = (q->vm && xe_vm_in_lr_mode(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
> > > > >  		  msecs_to_jiffies(q->sched_props.job_timeout_ms);
> > > > > +
> > > > > +	/*
> > > > > +	 * Use primary queue's submit_wq for all secondary queues of a
> > > > > +	 * multi queue group. This serialization avoids any locking around
> > > > > +	 * CGP synchronization with GuC.
> > > > > +	 */
> > > > > +	if (xe_exec_queue_is_multi_queue_secondary(q)) {
> > > > > +		struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
> > > > > +
> > > > > +		submit_wq = primary->guc->sched.base.submit_wq;
> > > > > +	}
> > > > > +
> > > > >  	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
> > > > > -			    NULL, xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES, 64,
> > > > > +			    submit_wq, xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES, 64,
> > > > >  			    timeout, guc_to_gt(guc)->ordered_wq, NULL,
> > > > >  			    q->name, gt_to_xe(q->gt)->drm.dev);
> > > > >  	if (err)
> > > > > @@ -2418,7 +2579,11 @@ static void deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
> > > > >
> > > > >  	trace_xe_exec_queue_deregister(q);
> > > > >
> > > > > -	xe_guc_ct_send_g2h_handler(&guc->ct, action, ARRAY_SIZE(action));
> > > > > +	if (xe_exec_queue_is_multi_queue_secondary(q))
> > > > > +		handle_deregister_done(guc, q);
> > > > > +	else
> > > > > +		xe_guc_ct_send_g2h_handler(&guc->ct, action,
> > > > > +					   ARRAY_SIZE(action));
> > > > >  }
> > > > >
> > > > >  static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
> > > > > @@ -2468,6 +2633,15 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
> > > > >  	}
> > > > >  }
> > > > >
> > > > > +static void handle_multi_queue_secondary_sched_done(struct xe_guc *guc,
> > > > > +						    struct xe_exec_queue *q,
> > > > > +						    u32 runnable_state)
> > > > > +{
> > > > > +	mutex_lock(&guc->ct.lock);
> > > >
> > > > I don't think you need the CT lock here. This per-queue state which
> > > > should be safe to modify without the any lock. The CT lock never
> > > > protects queue state, we just happen to have it in G2H responses because
> > > > of how the CT layer works.
> > > >
> > > 
> > > Without the CT lock here, I get lockdep warning from _guc_ct_send_locked(),
> > > h2g_has_room() etc. So, I guess we need to keep it.
> > > 
> > 
> > Ah, yes. I missed that part. If you send another H2G you will indeed
> > need the CT lock. Can you add a comment around that? Easy to forget
> > this.
> > 
> 
> Ok, added comment in v2.
> 
> Niranjana
> 
> > Matt
> > 
> > > > > +	handle_sched_done(guc, q, runnable_state);
> > > > > +	mutex_unlock(&guc->ct.lock);
> > > > > +}
> > > > > +
> > > > >  int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
> > > > >  {
> > > > >  	struct xe_exec_queue *q;
> > > > > @@ -2672,6 +2846,44 @@ int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 le
> > > > >  	return 0;
> > > > >  }
> > > > >
> > > > > +/**
> > > > > + * xe_guc_exec_queue_cgp_sync_done_handler - CGP synchronization done handler
> > > > > + * @guc: guc
> > > > > + * @msg: message indicating CGP sync done
> > > > > + * @len: length of message
> > > > > + *
> > > > > + * Set multi queue group's sync_pending flag to false and wakeup anyone waiting
> > > > > + * for CGP synchronization to complete.
> > > > > + *
> > > > > + * Return: 0 on success, -EPROTO for malformed messages.
> > > > > + */
> > > > > +int xe_guc_exec_queue_cgp_sync_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
> > > > > +{
> > > > > +	struct xe_device *xe = guc_to_xe(guc);
> > > > > +	struct xe_exec_queue *q;
> > > > > +	u32 guc_id = msg[0];
> > > > > +
> > > > > +	if (unlikely(len < 1)) {
> > > > > +		drm_err(&xe->drm, "Invalid CGP_SYNC_DONE length %u", len);
> > > > > +		return -EPROTO;
> > > > > +	}
> > > > > +
> > > > > +	q = g2h_exec_queue_lookup(guc, guc_id);
> > > > > +	if (unlikely(!q))
> > > > > +		return -EPROTO;
> > > > > +
> > > > > +	if (!xe_exec_queue_is_multi_queue_primary(q)) {
> > > > > +		drm_err(&xe->drm, "Unexpected CGP_SYNC_DONE response");
> > > > > +		return -EPROTO;
> > > > > +	}
> > > > > +
> > > > > +	/* Wakeup the serialized cgp update wait */
> > > > > +	WRITE_ONCE(q->multi_queue.group->sync_pending, false);
> > > >
> > > > So here - I suspect we need to associate the CGP_SYNC_DONE with a
> > > > secondary queue state tracking in order to get VF migration to work.
> > > > Again we can figure his part of a bit later but should be considered.
> > > >
> > > 
> > > Hmm..ok.
> > > 
> > > > Matt
> > > >
> > > > > +	wake_up_all(&guc->ct.wq);
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > >  static void
> > > > >  guc_exec_queue_wq_snapshot_capture(struct xe_exec_queue *q,
> > > > >  				   struct xe_guc_submit_exec_queue_snapshot *snapshot)
> > > > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> > > > > index b49a2748ec46..abfa94bce391 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> > > > > @@ -34,6 +34,7 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
> > > > >  					       u32 len);
> > > > >  int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len);
> > > > >  int xe_guc_error_capture_handler(struct xe_guc *guc, u32 *msg, u32 len);
> > > > > +int xe_guc_exec_queue_cgp_sync_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
> > > > >
> > > > >  struct xe_guc_submit_exec_queue_snapshot *
> > > > >  xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q);
> > > > > --
> > > > > 2.43.0
> > > > >
