Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A284BD6AB10
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 21:27:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C3E310F347;
	Thu,  2 Apr 2026 21:27:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KHLFufLc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E63C10F347
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 21:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775165253; x=1806701253;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=IjqJp7atM4MYjRmxBYV8eTGdH3rTvGCTiRIyOt4S1L4=;
 b=KHLFufLcGmsZko8R82bTxqJUFrQdv4ZAgTSCQp0yCVk5XhYr1sgZFOBE
 NIjzqc0ezJVBNYUWF3qOyxjXkhreX3DlY/AdNdjsThjvtBr+xXWhaW84H
 ZhTQBvoQye5Qp4NRFLLW1v2xQChf+9tcH12/V0zKEM5a66XsdBbsc4ThO
 IMEmxCoUwgYp1F/+DlZSs3nIzks6mrrjOBrpaundF/XMj8TvtS97xKuwz
 K24wOwChYQrjy3QlEm0rqaIiokP0/lMB55JKjv2HGpIFqDoDlQxylrQ5L
 Vmt/s3MLQAhU6bQcNS8J2wbnZNpKxFTlJW8YTU9MZBBpgQl/CprojnE+j A==;
X-CSE-ConnectionGUID: CB1oAcCgQiKxhptVy/h3UQ==
X-CSE-MsgGUID: PPPVZnsBTAm3sWXj/oJsNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="86854061"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="86854061"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 14:27:33 -0700
X-CSE-ConnectionGUID: Yr8zxxUrQr+ywraDO5SL2A==
X-CSE-MsgGUID: bvNhvJVATEWx1ShRkQWK2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="227028987"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 14:27:32 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 14:27:32 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 2 Apr 2026 14:27:32 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.66)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 14:27:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HNe8QZ1E5F6iCGtC2hd3LY/G7efoStD5FrCOiI+YX8/QgApcoLDdKd3pqVLZq9d4Sn/3ACRfngQroPCdHuII0Rdj3WhU+KfiViGpUVO4djJalO7OHJvK1z0uM8rMS1aC3PIFmB3OqI3DH2zfFEnXGk7X/SxMbVuMf7iUEFbHh+jEynRxm2LBgzVuW3gboZ562SQ1GgF/IP08nxWeVggMQyBJeV03b9h5tFEWKQssYE6rNpcTogt3qyE5QF57xppbHe5gwPsn7L4cNrN31FX87KvtKCwIZMTh/WU0pPy3tqzhtQIjLWcLS5aTJR429btdXeLJCYHW7jE8qzIUEuJ+OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y4RojHTtQZRsP8sm++VtrhBkK2xvPfGZnXWBEWrSbxg=;
 b=d2YDgLkbCarYZv2tmIHQ5zEQloeORdg4aF6gZPHqcrhvIVI9npeRNkX2cmf3rFnkBOymtUExzhc75nh2wH+nRF6T1s2bCE1r/VkKTlnh1lC9jz9kfj0tArUuOXIomrR+4PyS/CkBrbDUXjdDCiov7kJniCd8G6VvVAcHzTWPK+ggeabF9XBk9yKeF+FSkxQgDs/3/Y4EMbROMYcF0YP7KmQzP4G4GrFcoULanC8wav/aP296D7nr3vaCmcQbt3kbYqZynY7bVPNBpultlcrDtrqeia1T+Arg9IbUV72TevxY6mx1neDkVeSC0hkK2twsth0Zyr/NledhNukLnPbCnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SN7PR11MB7538.namprd11.prod.outlook.com (2603:10b6:806:32b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 2 Apr
 2026 21:27:29 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 21:27:29 +0000
Date: Thu, 2 Apr 2026 14:27:25 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <stuart.summers@intel.com>, <arvind.yadav@intel.com>,
 <tejas.upadhyay@intel.com>
Subject: Re: [RFC 11/15] drm/xe: Add xe_guc_access_counter layer
Message-ID: <ac7fPY4qvSxS7rE+@gsse-cloud1.jf.intel.com>
References: <20260318074456.2839499-1-himal.prasad.ghimiray@intel.com>
 <20260318074456.2839499-12-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260318074456.2839499-12-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR03CA0170.namprd03.prod.outlook.com
 (2603:10b6:303:8d::25) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SN7PR11MB7538:EE_
X-MS-Office365-Filtering-Correlation-Id: a7c9e5a9-60a4-4dd3-ad65-08de90fea46f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: 0mWoPQm62dXtBGxAWpIel0mnma47TeSR5+9uklqSfVs3XSUuZAY8W7EBjqT33ElYjddf9S/2qU7gpyOTeWm872ifOwHmHukfcTU95j2mM5qr97qyb7NbgyxzKOyzheki2oKJOav2h5ZpDPDjITEmFycIdwdsTqtIBzZCesmWnX8uE45QYU+rMs0YqBjOmvL0i2NkjJTLMSKE9Z+gh+PMQCGR6YNK1jSS6yGf+CUh9MIEVe7WAiWdrQtTI/hxyXc3E3j2O//601RBh/JPbYFS8CIhUXkFsdXdYLkO4ICToE/hL4RL5Yrq8mMB69kXXopNJK8MuhlbXSjHIW6dXi74ZNenzC/g87ImPK23xo4mDFc0TA50r00db2j/1AuMgn954AjDvxuA1ubiQUdwTUs0gts1/fVNUI5jGNxQCG9MXCQzg4eBgS70PndifxQCgpwpBoIyPy8KkJLQSn6nawjyIWI06YXoEk54QlSQh4A8NP8QAPtCkf44JCwhSoIIlW6U1b6CGFlYU7hjS/r/oXMB633g8LSD/jqot5GS/VWudY7ouY1m5DKcEd6qwL1/9Rw/UGc8gDPvY6D8zX4IVugrubtRYVQWTKTGZnC+4LosgV5eY/zIsrBbL0EJ9emareaxhDxaJBueMfwMuEEV8F4NQ5sadaXG6mSyISD04TfJxr8Ues9yav+INiDEadkOMzB3ZIVOsGhMKUMXyraUbedO0KeMiUotRp1vRtqzds7Q3a8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlV5TjZjczNWbmx2b0VxaXU1a2hHeWtRNWowaGdMM0xnVldwK0NMdXlpaW9C?=
 =?utf-8?B?MWppc2pqYldSMFJsMU9NeFNkbW8zQnU2dHhkRk5KMFNlNFdrUXd0ZlFBT0g1?=
 =?utf-8?B?TCt2RWhQYmU4a0pSVjJIZnJFUHllTUcvQkVSTWpxNWtaeDJwaVhiVmN3cXdz?=
 =?utf-8?B?L2VucEp6VFhhKzFMMWtsazVRbFN5eGRMY1hQOGhIcnovZlJtdm5RalJyR2xE?=
 =?utf-8?B?d21uR052YjVsSllvdHBzendYb0luR2JnVEhiOHVrQVJsU1F1cEtYa1p0cEp2?=
 =?utf-8?B?U1QvQTJ0aFBSUlhOYUx4NGliNW5EMU1KN3lKYmpmQnh1R3NGR3luQVIwTlFt?=
 =?utf-8?B?SDJsK0tzL2RBdHExZzZjUU96VzhnMFk1MjZPVlBpY2dtTGJ0UHR4RnBIbS84?=
 =?utf-8?B?ZHRYeEt2WWFnUHEzRmV1TjFzMXgzZksraGF6dlRVVnZOQWV0SzFaMXpqQTha?=
 =?utf-8?B?RTVCZnVLMStDZ1JEVUFISXlIQWIxa1hmU1NPQ0lEQ29PM2dYdkVxSnNWcmZz?=
 =?utf-8?B?TnlybHhVM3RyMVB4TUh1VUE5Z3pZbW9PTTNYWExQcFMxcGlRc2Z2NmlCTkNq?=
 =?utf-8?B?WmZTYjQ0eHl4eTBYSTFYTzFGZzZVWW9vZXk0YmNtT01Xa1B4U0dWWVJtZWZa?=
 =?utf-8?B?Sm5mcTBJREFWSHl2a2tTNG1peC9HOUUvUnNMUm1CLzc5L2NCWGpPazNBYUxP?=
 =?utf-8?B?UCtDbUhWQkh0U3RydzBFUEtVQ3ZjVmdVL29YR2Rnd294cHJxakFNM2tRU0Rv?=
 =?utf-8?B?OGRkdWk0NC9NQUxvVXo0N1RBTU5aYUdEQnBlbVRJNkhCZ0dnNXNiN25LN3VX?=
 =?utf-8?B?cjV6REJPdUlHWVdnOFk2cjl1eUZqRXBrV2IwMEJzTXM5QnRkb0FodlNGUEVs?=
 =?utf-8?B?ZGdsbVBoM25mTWMzZHM2TnQ1YnZFVkdDK2FSQzRTVkRkdUpnNXp1bnVhZ0I2?=
 =?utf-8?B?N2ltb0NTbmJHOC80ZFRQc000dTFTaldxaEtCWlI0ajJzVngyaUU0RUN0OURR?=
 =?utf-8?B?aEVsd2VPR1RselpKNTZOc2FOakVRV1R5SVBsNXQxVHJvaXhhVmZMRDc3cGZM?=
 =?utf-8?B?aVByNmJOeGV1andNVk1ueHpLREJDYUlmSG15d1gwaThKbXRVdjBpNWdmKzdw?=
 =?utf-8?B?UExKWStrMStEM0pxYmZrVXc4eE5ydVRDeWUyMUF6elp3Y3A4ZUJ1THZaYkVw?=
 =?utf-8?B?RWtvYW1Fd1o1VHdpMERsbnVBZEo2cmtFM1hUYnE2VlRhREhtL29DSUJlMDVR?=
 =?utf-8?B?L0MydDRMS0F6UlhIRUR6YzNXZFRRcHplbTlIKzlza3BuazdiVmFtK29QaGpQ?=
 =?utf-8?B?SFFHeUwxQ1NPc3F1dXJ4NjY4LzlOMTkxVmxqQmpUTnRLSDVSTG53d3NBQWtC?=
 =?utf-8?B?QVpKYUZ0WVJqKzFLVGpuQ2JUek01Mk1WaDR1dUcxZkFGYnc2V0VUL0RPMU92?=
 =?utf-8?B?MGN2bHdSUzkvcjMvSjNNSXBjNU9XUFVNWWEzRFAwNmE5cHZMc3JjNTlRRmky?=
 =?utf-8?B?MkFnVlNibThMRHRwWlIyalpycXZYK28weEl3ckdaOHR3aDdablAyeXdQWXVp?=
 =?utf-8?B?Yk9qaFNwbmJrQ1pVcFYrcVg2cDArMzVsRng1dVMxSUR3MGxOUVR0WS9pa2gz?=
 =?utf-8?B?M3g0ZEdKZjI3cUh6NURRaGFqL0VqbXJhSGI0S1ZsZWtLQXZFblVOZlh5dS9P?=
 =?utf-8?B?ZkIzOG5aRnp4K2I0MmEvZlZ4ZnYwb3hRNk0vcjlZbmxQQ1NUd0djWFNJRWZz?=
 =?utf-8?B?N1hzcnRTaWtQTHFVdDRFbXNQaWdjRGVEQzJtZXkvVTBwOUJKOGY0WmZlbzRJ?=
 =?utf-8?B?eHlDN0FHNzBXN2hMVXZGeVBxQVlnRXFGT2VENUVNME9RQmdjUU5zVDlodzd0?=
 =?utf-8?B?VzZTNGYxZ2drRXgrR3JuYmxCcjFOTEdSVnN1cW9LdlBrN2RVWDQ5S3NPbjF3?=
 =?utf-8?B?aWZZQ3d6dXVlSUoxUEpzeEtLekF3aWs0UXJHSVNrZFBYK1JWTWcvdnl3aXNM?=
 =?utf-8?B?YmZreUM0YVhna2EzQ1BrM3Y4ckEydHhGZThxYTd4UGVILzhqSEhudXJBUFFw?=
 =?utf-8?B?MmV0MmF3L0hhTE8vRDI5MGRCQ2txNWh3NDI2SmxrWk1yaXBZT0J5WmxKbi9r?=
 =?utf-8?B?TWlKUW9QT3MwQ2xTZjhnTEFuTGk2Mk45NVc2YUh3ZjBYWDFsb29qUmkzRDVz?=
 =?utf-8?B?NGU5NTlNVVlGbkg1VitGZjhiVnZRQUFMWUNpQ2NJSU4yb2tsZlJPT3Fxa1VC?=
 =?utf-8?B?K0dOcGduSm0yei8ra0VVQ0dhczRnSjhWbmlETFdDVmJPVXV1ZnQ3d0djdzFL?=
 =?utf-8?B?eExkVU9qeXhCcS9KK0JsWFRHQm9nUHVBVXYrR0pjV0VzTlNJM1pHQi80azhs?=
 =?utf-8?Q?CbfT5FuN+Ut2h7rY=3D?=
X-Exchange-RoutingPolicyChecked: YgheHwFWanVTRP2NTfbDZaEDZIFlC+39ZP68Gc6tRt7szSr1E3iH3qsqoZUb9UAeqwcRfDhLdBelziEYv6n7AU6VF7xOGN+oqeDG34kHp6eQePpEAjmKbCQepMBNJoJikES2lWne6VfqcNjQQziGCke5Fb4l51va3IT0Fog8jsRSLO2w7qbPklMHhqpjX6xn0pKRXFSi5u2ctBB3UyualN+YqseqmSuHumRFFIcQoThQum01TcGMml1QhhXao+JQaoxcy20zqeG7SmBOCWhRtVhjTLgQAstmI6HP9jbZp7DQaYUzezDAg1FXUewuJ1LU//cojsGGPawbVuc65Ln/vw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a7c9e5a9-60a4-4dd3-ad65-08de90fea46f
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 21:27:28.9865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CJOWcPWzad6+Ax5Bq5u0Aq94VsFL22b5/vfp4+6fMt7Xfw2sSRABUyE0OoSJw3qt2rwnJjv17ESi5kZEVK4pIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7538
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

On Wed, Mar 18, 2026 at 01:14:52PM +0530, Himal Prasad Ghimiray wrote:
> Add GuC to host (G2H) access counter notification handler to parse
> GuC firmware messages into struct xe_access_counter and forward to
> xe_access_counter_handler for processing.
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile                |  1 +
>  drivers/gpu/drm/xe/xe_guc_access_counter.c | 62 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_access_counter.h | 15 ++++++
>  drivers/gpu/drm/xe/xe_guc_ct.c             |  4 ++
>  4 files changed, 82 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_access_counter.c
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_access_counter.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 92d8d6e4a447..296b3cba0b89 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -74,6 +74,7 @@ xe-y += xe_access_counter.o \
>  	xe_guc_id_mgr.o \
>  	xe_guc_klv_helpers.o \
>  	xe_guc_log.o \
> +	xe_guc_access_counter.o \
>  	xe_guc_pagefault.o \
>  	xe_guc_pc.o \
>  	xe_guc_rc.o \
> diff --git a/drivers/gpu/drm/xe/xe_guc_access_counter.c b/drivers/gpu/drm/xe/xe_guc_access_counter.c
> new file mode 100644
> index 000000000000..2158400bc50a
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_access_counter.c
> @@ -0,0 +1,62 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include "xe_guc_access_counter.h"
> +
> +#include "xe_access_counter.h"
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_guc.h"
> +#include "xe_guc_fwif.h"
> +
> +/**
> + * xe_guc_access_counter_handler() - G2H access counter handler
> + * @guc: GuC object
> + * @msg: G2H message
> + * @len: Length of G2H message
> + *
> + * Parse GuC to host (G2H) message into a struct xe_access_counter and forward
> + * onto the Xe access counter layer.
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +int xe_guc_access_counter_handler(struct xe_guc *guc, u32 *msg, u32 len)
> +{
> +	struct xe_access_counter ac;
> +	struct xe_device *xe = guc_to_xe(guc);
> +	int i;
> +
> +#define GUC_ACC_MSG_LEN_DW	\
> +	(sizeof(struct xe_guc_acc_desc) / sizeof(u32))
> +
> +	BUILD_BUG_ON(GUC_ACC_MSG_LEN_DW > XE_ACCESS_COUNTER_PRODUCER_MSG_LEN_DW);
> +
> +	if (len != GUC_ACC_MSG_LEN_DW)
> +		return -EPROTO;
> +
> +	ac.gt = guc_to_gt(guc);
> +
> +	/* Parse access counter descriptor */
> +	ac.consumer.granularity = FIELD_GET(ACC_GRANULARITY, msg[2]);
> +	ac.consumer.sub_granularity = FIELD_GET(ACC_SUBG_HI, msg[1]) << 31 |
> +				      FIELD_GET(ACC_SUBG_LO, msg[0]);

Would it be better to move the math in xe_access_counter_get_vma() for
calculating page_va into this layer and simply pass in page_va (and
perhaps a generic length)? That would better isolate the details of the
GuC access counter interface. It would also ensure that, if we wire up a
different hardware access counter interface in the future, the common
access counter layer can remain unchanged.

> +	ac.consumer.counter_type = FIELD_GET(ACC_TYPE, msg[0]);

Should we reject bad count types here? I think that makes more sense.
The only reason we don’t reject bad page faults in the G2H handler is
because page faults issue an ACK, whereas we don’t ACK access counters.

> +	ac.consumer.va_range_base = ((u64)(msg[3] & ACC_VIRTUAL_ADDR_RANGE_HI) << 32) |
> +				    (msg[2] & ACC_VIRTUAL_ADDR_RANGE_LO);
> +	/* xe3: Use ASID and engine info */
> +	ac.consumer.xe3.asid = FIELD_GET(ACC_ASID, msg[1]);
> +	ac.consumer.xe3.engine_class = FIELD_GET(ACC_ENG_CLASS, msg[1]);
> +	ac.consumer.xe3.engine_instance = FIELD_GET(ACC_ENG_INSTANCE, msg[1]);
> +	ac.consumer.xe3.vfid = FIELD_GET(ACC_VFID, msg[2]);
> +
> +	/* Store producer message for potential acknowledgment */
> +	ac.producer.private = guc;
> +	for (i = 0; i < GUC_ACC_MSG_LEN_DW; ++i)
> +		ac.producer.msg[i] = msg[i];

Do we need this? That is, we don’t currently ACK access counters—are
there plans to change this? If there no immediate plans, I'd drop this
for now.

Matt

> +
> +#undef GUC_ACC_MSG_LEN_DW
> +
> +	return xe_access_counter_handler(xe, &ac);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_guc_access_counter.h b/drivers/gpu/drm/xe/xe_guc_access_counter.h
> new file mode 100644
> index 000000000000..1ac8e76398d2
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_access_counter.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_GUC_ACCESS_COUNTER_H_
> +#define _XE_GUC_ACCESS_COUNTER_H_
> +
> +#include <linux/types.h>
> +
> +struct xe_guc;
> +
> +int xe_guc_access_counter_handler(struct xe_guc *guc, u32 *msg, u32 len);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index a11cff7a20be..8ac0938f7a28 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -26,6 +26,7 @@
>  #include "xe_gt_sriov_pf_monitor.h"
>  #include "xe_guc.h"
>  #include "xe_guc_log.h"
> +#include "xe_guc_access_counter.h"
>  #include "xe_guc_pagefault.h"
>  #include "xe_guc_relay.h"
>  #include "xe_guc_submit.h"
> @@ -1630,6 +1631,9 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  	case XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC:
>  		ret = xe_guc_pagefault_handler(guc, payload, adj_len);
>  		break;
> +	case XE_GUC_ACTION_ACCESS_COUNTER_NOTIFY:
> +		ret = xe_guc_access_counter_handler(guc, payload, adj_len);
> +		break;
>  	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
>  		ret = xe_guc_tlb_inval_done_handler(guc, payload, adj_len);
>  		break;
> -- 
> 2.34.1
> 
