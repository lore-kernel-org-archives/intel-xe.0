Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A83CD13DA
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 04:25:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0418E10E021;
	Tue,  5 May 2026 04:25:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R1Jr4Sgr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22A0810E021
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 04:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777955136; x=1809491136;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9GNKAd4uGmCv0fSSrxhvqLneS9rKPMlh+1wk65j27mU=;
 b=R1Jr4SgrmCqjl+8JV6LtyjSu46ucGKHR/OTBiyuwJsouTLvHP+sqvP7R
 gWsbPhnYOww742vdMwFNHaAjmQ2h3Uw78QM/TX0TkEyfSg5MdaiqgRDjr
 FkalwWOehfB1DFtXsorQfWkvSXGu8LeiB4goF6eH8JUfDyHeZJ2AP0kby
 Miy4bHSioqX/nF63Zw/cVM/Ib6wxZXdG2oBJYf938hbunoeztZkg7tIBn
 UhZXZTEkv2RF0TMc1wOxT6ypfrrA9jg28/btURqb+6l9nAFQP3YEBl5Vt
 wTBu6P9U5nCt+jsZ2bPdn9Cc5axzgs8gF1aBegEVprKmkBnhscEg64voM A==;
X-CSE-ConnectionGUID: WTpjp9lpS3SefgnJLQsb7A==
X-CSE-MsgGUID: dahPwGUyQi6QaPovt9Jakg==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="77840097"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="77840097"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 21:25:35 -0700
X-CSE-ConnectionGUID: tKlwVLRESwenKSJ6G6daVQ==
X-CSE-MsgGUID: d9/nPb/JSTqcI/5byQK2Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="234686598"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 21:25:36 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 21:25:35 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 4 May 2026 21:25:35 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.47) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 21:25:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gn6C+9xHYDWIh4Bfkpt8EB3vz42/E/1cPdJbbkn1gaonSKM1G1VIMGlStpBKWr9hYc03fysK8W1w882EOY2PIqUjSyiuEzfezKNJCVDYMsXxwF5yx7a08v8OdPDXJcequunBKNzJHKJMgZw3yzgV3PR+dd5XAKQXQfBKMfx+mQ1hn24e1xEhVQWMqOfY4gtRF97hEuNEHf/2MIVQt2C/45hZXIN+FtEvg8pcvy8if+x9PlCqV7lJgLzcoP7LGyrfX2UgcuS2jQdJ8QL0fVXYXYicl2JzAl3d3tnem8v7XiwXjpJOBDSCQ3I8ZCpFlKUinWNW3Jozo2nRYIKay/glbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S+I08+jqU1xHYiv6X2xibU9KQSBK9emmli2KhYibe1Q=;
 b=ZzeungMb9MeNwKua+QykM+bIYMD0WCHj6ZscdOqwHq/1TgBa5EbaG4Rgrzoi717ZwNAj+u9XptmPwHg2Itbch0XmGiKyO1zBfD1RLH0oiqyY1xzdyaQVOtj2Ch9C0UHs96ztMKlEnfCI4BiJVjReB7O+PPf3tISHdF3X18Z3A79QXIR1ZVnqP+teoVwUcXxqBFJTWXz8yCEP+OiceTY1il3PQVlk5n4KzaMdFe4QymLCuGf8QUJdHBB3DPZozird0c0ysDBGGpx/+JO+2Sbu4NOjLC1HmSjYm5ZKqDMlcflwnfyQVM3gTj1R0QVHs4WrCsJ/KEfMLRh6rlXFe30/MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by DM3PPF1CFCD9AEC.namprd11.prod.outlook.com (2603:10b6:f:fc00::f11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Tue, 5 May
 2026 04:25:32 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 04:25:32 +0000
Date: Mon, 4 May 2026 21:25:29 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <stuart.summers@intel.com>
Subject: Re: [PATCH v2 9/9] drm/xe/multi_queue: Whitelist QUEUE_TIMESTAMP
 register
Message-ID: <aflxOe7FHs7NJqzK@nvishwa1-desk>
References: <20260502005332.3135977-11-umesh.nerlige.ramappa@intel.com>
 <20260502005332.3135977-20-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260502005332.3135977-20-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: SJ0PR13CA0168.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::23) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|DM3PPF1CFCD9AEC:EE_
X-MS-Office365-Filtering-Correlation-Id: 89f6367a-70ca-4afa-c32c-08deaa5e585b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: AN49EhrDjGV7wmSWR3tA5ghEZxltAy60f4ZHQcPAt5xmAniLzETNdqD44qdAvNBpkSz2QGOUm5nnSP0PEnu5x2ckv/5x1qQ1b4fSIXbO6tcGkx7bPUZMHvXd6+GEC6wGVH9vRkjFcw2ZdaoDYkV8bYclKG6uZwwwrCm1WSfHV6jGfw17dbfAMnfpabN7Ej9lirBfn9hPfIKuv8hDYI2QAo5ly0A6Wu6khnYFtZ/bC97NLKJfMNAK4gJoW/OpsKqySxnsgCuaYVtxC+iBTkqetUKWT2S2AwLwMatawLvAVJTQgGMJKEBvLAnhWklKhwj1zFCewVbiytL1OkV0WjCnACaBLgzzfccMge+k/LJB9msR8fYJyv3lmdaznqyJY6WZvAxYxat/dVYvIgtjpSGOqxGMiwccxLdFVQesMPC6RAN9/dxYaCoFIeXNJ2I1t8oxTZIUxBjYMLDTz33TwA6UDIrYBJTSoEsPVyP7t7dT+Lba7B73M6ZR76tDWi707c8R+tC/J48Li36WpjXgYc77yp09FKp8WxnmwaeZWJuO/SH2+QZhYdteRKgYR3+QiwKN1fn2yD9UfGlVF8tUHo3+z/MNr7rh2bRWBD2sPZxXr5vmxhbaFb4REhC9j+h/mqrXDi1MAGFEruip2u5sS45f/Yix8T2JVKDHfqGpLo2f6AjEiOYlqkV6nYAGrOgov3tZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ABis755OR8JP5ISP2CMbm6heSva3j0TYpyjCkyk/gLSsiARAHp7536glIbvT?=
 =?us-ascii?Q?qEDd8UgM6r5mTx6/zfz6kRbqfP++eXRJMGdT1DFtNy/f4Cq2PXTQrEze18uO?=
 =?us-ascii?Q?85pLVtkXqEt5ihbg3xPbu9f+FvggcRFDjyp5oqYSIMtyhe1Blk6F4xCNiZjU?=
 =?us-ascii?Q?Es99dRLmCcJcBkvxWvUxiYrNppfTx4hQN69OJF3aFjy+5x0+BDxI3rX+M2v1?=
 =?us-ascii?Q?2Agx/6QyuZustwweRPF+ZkWH6FfUggmOGTGKt4iCMpaJXJUDPNDlDv9rQa9b?=
 =?us-ascii?Q?dDSInym7H+gbfTWRXn1HR8QYW4o5z3stce1FSHVp/q8CQEasOA8PFqRjxcjV?=
 =?us-ascii?Q?hyOc86LULCuEdRB23SHb0TMQy2Mxp4zZmTz3TD6OnBmndb0wA3oXBRAZzgPF?=
 =?us-ascii?Q?ZglMJbO/mk58c4VLiV/GQI5Er3lBrBYPHbVoq9o6TLMWtKMDu38SkqzAuA98?=
 =?us-ascii?Q?NWtecXL4iU6daHdadoHckTc8hViMfJqN75jax+szR7WnZHFvDRynbSCrSBAZ?=
 =?us-ascii?Q?QPk5JmbEmd+7kNiXs3VA+xW5qp/S6DFqTj/ktXxD828PmJVQX9MsdHVVq20c?=
 =?us-ascii?Q?d0hrpXZi/tI8fi4BSPuLxc6nJ8a2cn8rmdEvaPx3comwkuc1GgP35mYdqDpe?=
 =?us-ascii?Q?sIhoei2vNMzlmjQkqoXgPr7vva4z4BxINIaOZioxKukek0jwLDbgbmj1/VnG?=
 =?us-ascii?Q?TIP9iRQir5wKVwZXr2NrRfkEdwbxZGAbX5SBiMEoj+Xv0+V7KkN+ecowPaeH?=
 =?us-ascii?Q?gUVi3jZoLSRoBPbkdh+M+UbQeCPR+UMkdjHtBAPhBFR6CZOA9rqOElFHGtny?=
 =?us-ascii?Q?BmYNNPAMvOhvpOr3VXPs589oNzp2PJvLFBf4IYvz+JaFCQnVOSYDfux1tDHN?=
 =?us-ascii?Q?CWVMfyfoNWPrlZDG1XyKQjsblO9/NJpCGLpvTV5eqdWOPfEw/+MSEQj+u2uM?=
 =?us-ascii?Q?0ggimghduI9ApMUo2pcnG1Gy2zGC2GSwR9iibFVZekOJoIt4D7DBG0NO3M9G?=
 =?us-ascii?Q?q2m9upEey0iiNZB3UjcfwD8JMjpR/YjQD6klBcV4SgRjmy/qPJRVWfa0xix8?=
 =?us-ascii?Q?HBi+CRC43J7WKi+5Htns7ZOnriU252N6LoXCAl4qMJIh5iF77hj66DRBpPjH?=
 =?us-ascii?Q?1wNrcdColPb/x7hLwX5n6Pybf7I03cuaSkzG6xuLNmrwi2s/X8PlS9PpipC7?=
 =?us-ascii?Q?6qjcRRITNTr6/Mbq3wKKh8PUbk6K6AaOlj/WiOOewEYqTUjHlB6mvX/zijdW?=
 =?us-ascii?Q?0VhxgjS9wAjp3CRjDKo2OkMgNsF7uTTKsm2RG13Xu4UdWqrYyjOyK5Legg8D?=
 =?us-ascii?Q?2IAIOlh58XNQF0K6acgTaFD2NPbKYqbHUNbq+mljTUaPk6WRLnR5y0l4+6rV?=
 =?us-ascii?Q?0ALEojWHRYtwx1HKDAY5x0TjvtOOIf8GGvcrVwk7pVfPtTp020OfS+sCsFwP?=
 =?us-ascii?Q?mrY4rWAbn3eQqk0oEefPq7B1xoy4QI7dHFmTKZcfNFGlcbLSjpmIEjlSLDwh?=
 =?us-ascii?Q?kCLh2GL8Ql5N/CRhLtJy5LT405LXr345E/bPa/1tyuxZomQK0xOfFoMSRPGv?=
 =?us-ascii?Q?Xu77dBy2xJWa/Q18IdU/B/fULbHcNZYb+C9U4zd2cVIA03GIBa0HgyYycG2p?=
 =?us-ascii?Q?ZqVoHVUvlWzh8Pc/ieMBXwXhKRLLyLIQe7sam7tuxYfpCIAIbZ4Aikz8yoAQ?=
 =?us-ascii?Q?qeDd20LoxpDC373mVkG+NiT7CkjJV1rhwQW/e+r5DjalmpelwCuI5GB1IH7f?=
 =?us-ascii?Q?71Qc6SA7rubM1Iax3bL+uRDbcKmwdfJnYOFurvxSWcprq64Hk1Vl?=
X-Exchange-RoutingPolicyChecked: PBXA8OyrLuv2nhU8UjMtqfEpFWzdA2hleK5VVoQLzws85NV0hmUfiPkgUCSO6hIBRkbaRYEFPclzFYGNA+93o7tqGBSLHDLG4D/sgD5w4neeTTw5r00x/3WMym8zM4d5jwI5fAaZsSBxndH0MLbDZT1tJv5rtkhdeTFYcxQ/22VOuPPXd8tCepbIEsYJSWC6vDfYjMH8bdYP+0wmwymHxOY7/Ga76kjzFf0hcgHZtUKIhc0sKc/Pf8WxwFwe+w3/lfIPK2yClF6ZLgilLXm/0thnE+u+VR+4ZfyKdWL9rEOaXB36AFVnGpAcwreRFLGLqLabJvpVjks2Q2Y9Y8g5nA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 89f6367a-70ca-4afa-c32c-08deaa5e585b
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 04:25:32.0394 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3CBTydNMBmVj9S+V9t5dduONMk/O3Zh7WojD9XXc/SOPe9Dnd3w+92TlhezsXljQYGca6cM7Dxc3+RjguoTPew3s25ez1jZhW+mdQ8qMggh1Off4nwgjkWkCbCeUK5r8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF1CFCD9AEC
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

On Fri, May 01, 2026 at 05:53:42PM -0700, Umesh Nerlige Ramappa wrote:
>In a multi-queue use case, when a job is running on the secondary queue,
>the CTX_TIMESTAMP does not reflect the queues run ticks. Instead, we use
>the QUEUE TIMESTAMP to check how long the job ran. For user space to see
>the run ticks for a secondary queue, whitelist the QUEUE_TIMESTAMP
>register.
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
>v2: Whitelist QUEUE_TIMESTAMP only for copy and compute engines (Niranjana)
>---
> drivers/gpu/drm/xe/xe_reg_whitelist.c | 14 ++++++++++++++
> 1 file changed, 14 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>index 80577e4b7437..37d6ac720d5c 100644
>--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
>+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>@@ -33,6 +33,14 @@ static bool match_has_mert(const struct xe_device *xe,
> 	return xe_device_has_mert((struct xe_device *)xe);
> }
>
>+static bool match_multiq_class(const struct xe_device *xe,
>+			       const struct xe_gt *gt,
>+			       const struct xe_hw_engine *hwe)

To be consistent, we have used 'multi_queue' as naming convention
and avoided 'multiq'. It would be good to keep that consistency
everywhere.

>+{
>+	return hwe->class == XE_ENGINE_CLASS_COMPUTE ||
>+	       hwe->class == XE_ENGINE_CLASS_COPY;

We already have xe_exec_queue_supports_multi_queue() function which 
does similar check. I think we need to abstract it out to a single
function and use that instead of multiple places in code that
determine whether a class supports multi-queue or not.

Niranjana

>+}
>+
> static const struct xe_rtp_entry_sr register_whitelist[] = {
> 	{ XE_RTP_NAME("WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865"),
> 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
>@@ -54,6 +62,12 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
> 				RING_FORCE_TO_NONPRIV_ACCESS_RD,
> 				XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> 	},
>+	{ XE_RTP_NAME("allow_read_queue_timestamp"),
>+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3500, 3511), FUNC(match_multiq_class)),
>+	  XE_RTP_ACTIONS(WHITELIST(RING_QUEUE_TIMESTAMP(0),
>+				   RING_FORCE_TO_NONPRIV_ACCESS_RD,
>+				   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>+	},
> 	{ XE_RTP_NAME("16014440446"),
> 	  XE_RTP_RULES(PLATFORM(PVC)),
> 	  XE_RTP_ACTIONS(WHITELIST(XE_REG(0x4400),
>-- 
>2.43.0
>
