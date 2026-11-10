Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61116606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 12:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IZUtcoX4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2528F88735;
	Tue, 10 Nov 2026 12:36:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 021AF88735
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 12:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794314203; x=1825850203;
 h=date:from:to:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=OO7muEV2hyrJm8sLMxe8e8mBIwBrxAUqwjd/CyIiIRM=;
 b=IZUtcoX4BLh4cVcq1c+L7hO1A1+TOXljOGr3IWzeJeKF7yMbYj80CW9H
 UTEJP0R/VuKf/6kdpgt7AcAC1WgoHAGZlaxPFSV/Ggv5kJ+zm4b6+vFpU
 TgStwMKIsMXXDUbaXcv/UdAf3KXIMM/UunsZkfVUJIeFFEs8ZTei1fC0s
 nqMNDyJXGeC413NROAKg+g2IkHDINGMtxhsiHoOTTVJdeb2DWlecka2uY
 yV8sr/xiSkB9FC3K666KzaIlBMZOYp9cGK2ZYsSVpd9coprZPY1bnroUB
 gwOCDmNfHV82f8c3Cr+zatJTDWI25O5jriUwmKYhbWw/E1uCJL2awxr0D w==;
X-CSE-ConnectionGUID: VSJPaBp7RrSQ7gYNVWffSQ==
X-CSE-MsgGUID: XPhFZRK8SiellvSOT70u3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3094904"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3094904"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 04:36:42 -0800
X-CSE-ConnectionGUID: +9q8AuRdQO+OFjXi2SKA4Q==
X-CSE-MsgGUID: AvJN6oDyQcSdGm8sz7kPWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="9882317"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 04:36:42 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 04:36:41 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 10 Nov 2026 04:36:40 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.28) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 04:36:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cVukj2qE4dLPogjBbd1KkR1WEXTOdO9B70Ivg3ZmBMxRgWoMZReNeG5guEmJ4Q1oXQ5jiLIEyTQTsVfL+G23XbO935TLJK2rUb3URDMzLIyprPnFDMYbyLQttLQl0TFe2JvsJtU1oF+ppzypft8hyP4Ydm8KvL9UuXJ3i2IGj7Vh0tm1W4hU5ii05o5YN+h2EEvsHtkpv3pXupSazSBNlJcYUscxE7O+WNPqhu6R8YaCpn5GH7xgm1/D393mzZItjfibJc1ehNBkdoh9poNtsCFSkBl9UMaW2DQt5GHZ2mM1v4ZuF19HOyBgVYR7nUxVkWqIGauxgabaQI6QrnXHlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n67d/AKIPR2TTDPtAgsKp962VRo4Fu0U+CijDWwGKfQ=;
 b=F3WRlB4+k6oxPZaWjhBuzGzNQ+THbqD7ryExCzFpKuPMSvu126iZ/vXomNNAitEk6HYxkuLkCQ3cxRK1koUwam3jkwYW1cN2YcMKf76SjgYKknPg0Y18BF9FukViphnujhwxYA/21GaElKiK453M6FrE6RMIAvEO97kNmR8MOorjp9E1EkwpRTGrdb2PRKoWaWO9tX8GH5ceX9PBWTx9zt8uRmQmE3Sz2FkbLGPG79piAr/s5oVCZAvbuhjkk7PsjnJA6hDXH6h6mjHKiA1VtoNlYbFvMxugc8QL38jUYbd3Tf0wRqH8for5Pcl3zf4XELbv6qDRH3tIcRj2bfveZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by SN7PR11MB7667.namprd11.prod.outlook.com (2603:10b6:806:32a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 12:36:37 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%3]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 12:36:36 +0000
Date: Tue, 10 Nov 2026 13:36:30 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw=?= =?utf-8?Q?=3A?= failure for
 Prepare SR-IOV provisioning for VGPU profiles
Message-ID: <20261110123630.m3y6gua24ckqcs4j@intel.com>
References: <20261027103009.1259199-1-piotr.piorkowski@intel.com>
 <179310647489.76153.4495005985732490508@221881a7231d>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179310647489.76153.4495005985732490508@221881a7231d>
X-ClientProxiedBy: TL2P290CA0028.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::10) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|SN7PR11MB7667:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b508662-2bdd-4b93-7fee-08df3f2742c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|18002099003|22082099003|6133799003|10067099003|4143699003|11063799006|5023799004|261026130827099003|261102123227099003|261022105027099003|261022115727099003|261026140227099003|261026121527099003|261009221227099003|261022075727099003|261021133027099003|261021123027099003|261009223327099003|261021135927099003|261021121427099003|261021130227099003|261026135527099003|261009223027099003|261022113327099003|261009220027099003|56012099006|261028144727099003|261009221727099003;
X-Microsoft-Antispam-Message-Info: G76xyrIOd7vUKbPYTD1fN3iAZU4ZDEf4UkzAJnx5wabqfOQTJ4/0qVU4FGeJmNEDl+3rabwIfmzhc+7JXPFhRY/ZMqNyasv2OamKbtiaMpDlKG/KDbEv6P0IPTXYJdN/SryXTzzIGMGxyQ51+a6/K5UprrK4ZFaHT3yNav7m/PiA+tZWRBICH9T4rmVoDM7RunRp4/VM1jQdpeJPHEhe8oPAvYvvZyImuaH8h0fn5rCfrWjKkFOtflLoULGN+uRMIxAFiPdezSRSZvcNWfEuyIUHlGrXdi8uxmi5b8K2eU77Jh5oSXwJnRdrmdob3R9a38dhHgULTCdOcUdzP7Y0oU712ndvf/PfYKnwz6AcG7FzdZ7QdXEycfK69oi67Aw9avAt0bYxqVURZVJ091Iy+TcJeovyPJHGyViCSwotGy9nXlJYvuLnsJY5m9qP2OsDPxaNDRb8ZzLKvFxj6+TpR5MTHh52zRoeoJtCb7/7UPunV5Pqr+zbshSD7f9VZAqy7M3Nzzk8FTkfi+lCz3ouCpLsCfEZ6J2XQKtUNnnZppgIx/EMvsxpqGHJ/+L83f7zKv0r+rFH5iT4LDp3tz+eUGWC4i73pH1VyNrrxkbdF3k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(22082099003)(6133799003)(10067099003)(4143699003)(11063799006)(5023799004)(261026130827099003)(261102123227099003)(261022105027099003)(261022115727099003)(261026140227099003)(261026121527099003)(261009221227099003)(261022075727099003)(261021133027099003)(261021123027099003)(261009223327099003)(261021135927099003)(261021121427099003)(261021130227099003)(261026135527099003)(261009223027099003)(261022113327099003)(261009220027099003)(56012099006)(261028144727099003)(261009221727099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXBIcE8zNnFMeGJZd1dTZEZSalpoZ1lLVXprbFU2Y1hMbUpnUUFsM2FYMFBx?=
 =?utf-8?B?RE4zRzRYTnVYQmtlOHVCbHoxK24zREc3K1RwZGRmZzl2SnBWd2t1SHRKcFdq?=
 =?utf-8?B?OUFDZ2lvVG9aU01LMHMrTHkzWU5RdUIyYkdmOWVpRCtvQVBvY2piSm9YeWlF?=
 =?utf-8?B?NGVRL2QwaVFCaW1tVDBmSWxkZ3BzUTBxT3hRSmxkK3Vpd1kvL1VtZ3hORVZq?=
 =?utf-8?B?SkpsRVphR1l5a2dmeUZCMUtCVmlzMU1qakpacmVIbTZTdWJsaU9XcTA4THNV?=
 =?utf-8?B?cE9xdjBrVXgrRytpdlNDRUxkNGxFRThCVEl4RXpxK1VoTWJOSVdzY203a3c3?=
 =?utf-8?B?MHB3bWRxandUSEd1WE5wZHRQaDFZOUdVZGlMc2owaHZ3QUJXNXJUblR5UlVZ?=
 =?utf-8?B?R0ZpNE9OTG1wSFNLTm01bGwwL2VLYkg4MDZPVStUVzM0elk2L0hEc3BmRWI0?=
 =?utf-8?B?Tk5FYVBqQVBzTDdFd2FjTmxIWFd0QVJJZnRUMXh1elVHR29VcHQyVGtiZU9O?=
 =?utf-8?B?V2tLOS9tQUt6ZjhHMWhaWERpVURiTytTcEZCQWhnSFR1SDMwNHNOaFRSNTFl?=
 =?utf-8?B?YUljMnZ1QURPU21oVERzSkY1SHlpcmNMREdQWnA4VjVpdFBMV0hESzhzWEVI?=
 =?utf-8?B?MFd6TmtpeWhDWC8wWldDalhTN0tJcGpNOTZER1owZDZOZDV2d0Voc1YrOFJZ?=
 =?utf-8?B?RVQ4T29venB3UGxRS2FOT1pzUG9pYUhjRit5ZUFSZ0lnNWpCcFpId3I0N0cr?=
 =?utf-8?B?SHdFeUZ0RXQ0aWQyVFN5UlY4Tlc4WS81aXgxU25OQUR4UGI2cXY2aFN6eElY?=
 =?utf-8?B?bzJRQWE3OGlXMFJwOVNtUjhzTmpZTnhEcFlXb1E3b2ZzRDNEN3RZTWF5bWVL?=
 =?utf-8?B?UDF2T1ptWm5vMkRSdHZ3NkRjNnEySlF1eERwYnNYRHBKZXdjOWs1MjN3L2Qy?=
 =?utf-8?B?RFFLRTZxVUtwdllQYnc1OEpNdW1Udk0rUUdocDVkZk1pbVdYZU5wb3hDYzRs?=
 =?utf-8?B?ZHdneUkrNVpMV1QyajVKTnNURUVTZExBZGYvQjlDTWwwc1J1aDBSa2dqcWZL?=
 =?utf-8?B?UXB4RVBOeldheS90ZEpaSkQ2R0MrUVRoNnZ6U3owZkcwejA0UXVjRHl6T2hs?=
 =?utf-8?B?MGlMU3UxTHVIOUpJNi9kOVBtcy9XWkloUWx6bU5SZGNSQVcyczBSblc5blRt?=
 =?utf-8?B?dXk4U2d3V2w0TXpMaUhDdzlVWGYrR2hwK2hyQWxGL3RoNDljUkFVYXZ3dTFu?=
 =?utf-8?B?UEpkK25HVDI5NHhJYzMva1Zudy9uYnlyWDgxVTZBaC9UajZIUUVDVUFLYndv?=
 =?utf-8?B?cWlJdEJ5UFV2VldEWkJTTk1jbWNJZzBaV0NWZ3hoNjZuRW9xSmxkaDhYcm9E?=
 =?utf-8?B?VTBIckRnWENKZE05TTAwZW9DZ082Q0tnMlFtTWxhbGtXTHI2ejBPQmJBczlr?=
 =?utf-8?B?R2dwM1M0K0JGNFhDZXdoTXEzSWpxTkxHYldCTjZsU0RjZFJCQXc0STY2S0Zx?=
 =?utf-8?B?eGxaanVtN2VLNWtCaitSRmNKZ3kwSkh5Y0JDbFZnYUg4RVhUMkhzb1ZvSlJQ?=
 =?utf-8?B?dDdvVTlCZGMzR0E1bnlWTm5uNmV3RERKN3Vkb3l5enZLUk9HMXlRK0ZRbHpz?=
 =?utf-8?B?Y0dURDUvdnVNOFFQa0hON2RYQzRnRlp0TzREWkpqY1BmazNSRFRLZzRTVWhw?=
 =?utf-8?B?d2FJaC83Unc2TTZTbEE4TC9oY08xZnkyMGM5UG02ajBiTzJBV1Q5VTZOWHB6?=
 =?utf-8?B?NTNld2VYU3hHRkcweVd2TTIyT2pZNzdqU2l6aldMc1k4N3pPczd2WFRCNEk4?=
 =?utf-8?B?SytkbUg2YTZMNzZtdVE1cU1SUFBJMjdQNTdpSkt0dm5qRWQ4ZHRLRHNtc0Nm?=
 =?utf-8?B?NS8xaGRVL3pWWHJ1QW9HWTJoRWROSFhwRUxXc0c5NDVubCtpRG8vUFBwUE82?=
 =?utf-8?B?TmRvdHY5VUQ4WFRoTlRtQ1UyMkY1bU9wRjNHaTBZa3ZSY25Sd1dVQ0FFTURU?=
 =?utf-8?B?dzJxNkE5Vjh0WEcvdEJmaHRVNCtCbzFiMGNNSmZjQXVnS1creUphNnlhN2to?=
 =?utf-8?B?Y3VSUnowRVl6Mk11VFdqTzRZS0NOUFV0djBRVlhNdWxxSEIzaTZqcjF1V1kz?=
 =?utf-8?B?LzlwTEJ0SGlmTW8xNFRSZy9FYXVOM0VibnJRWTkrRm5BYjdzci9PZmE1Q2JT?=
 =?utf-8?B?UnNzUytOQzcvejBzNU10QnJOV2N0RkEvU1RvK1FRREpHbHdFVEJIWEtXdnBB?=
 =?utf-8?B?THN3K2tNQWplRmJJYnZ0NjVPa1duSUZaaGI1bGtZMzNVR0o1RHhVRlZidUxB?=
 =?utf-8?B?TUI2Nno3cHJvcCs4amh5Ykp4RTZra0E0RU9JcnhKQWsxbzFZb1pwTFJGZ1hl?=
 =?utf-8?Q?EDaLArM7IoCd4NFM=3D?=
X-Exchange-RoutingPolicyChecked: nC9out0YF+6+1lFIrMmKWq6iTvWHUevTNrdefyXfpC8Q8WZaecvCkkNPGCJsuTtyLQDiskng3fSHaml6Jj16e0d+f9sI19JABHKpSPjS9s5gAafC3eXQNbgSBIRqhEbiA4orhxexORloQg6LaHuHha2yje6NSNl51X/K0SxM6acHfzUAsmt638ezeGSXznxC+wAVHw3vpJGe8udDrxMn5E54625yTXcC66uwXcYSCCNPf7LbjiYrnzQtsaIOyR5rxMVmbPDLrrbSGq/v73M/zmTStriMHXFYSg24JcXALlCxfvadVIc1qmy8J/VnNPdhkpFNSvOxz0UWKxBnYggfBA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b508662-2bdd-4b93-7fee-08df3f2742c1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 12:36:36.9206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a/nF4vvZjEkBnr0TM2anZGClYdhyQEn3gAMlhm0cTz3AZe/s65a7HKLdCErEXPTzUrMzQcvY73dDXh7qtx8nXqqeZePt6NJLN5dOQ0/K2SQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7667
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Patchwork <patchwork@emeril.freedesktop.org> wrote on wto [2026-paź-27 13:07:54 +0000]:
> == Series Details ==
> 
> Series: Prepare SR-IOV provisioning for VGPU profiles
> URL   : https://patchwork.freedesktop.org/series/176934/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-6014-d645db52a6b60d0f0d921077f0233085b41b3a1e_FULL -> xe-pw-176934v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-176934v1_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-176934v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (3 -> 3)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-176934v1_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_pm@s4-vm-bind-userptr:
>     - shard-lnl:          [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6014-d645db52a6b60d0f0d921077f0233085b41b3a1e/shard-lnl-1/igt@xe_pm@s4-vm-bind-userptr.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-lnl-6/igt@xe_pm@s4-vm-bind-userptr.html
> 

False positive: the WARN is in printk core (nbcon_kthreads_wake(), console irq_work blocked
during hibernation) triggered by a display drm_dbg from edp_panel_vdd_work; the stack
has no PF provisioning code and the series only touches SR-IOV PF paths, unused on this LNL s4 test.

Thanks,
Piotr
>   
> New tests
> ---------
> 
>   New tests have been introduced between xe-6014-d645db52a6b60d0f0d921077f0233085b41b3a1e_FULL and xe-pw-176934v1_FULL:
> 
> ### New IGT tests (2) ###
> 
>   * igt@xe_oa@tail-address-wrap@oam-2-1m:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.14] s
> 
>   * igt@xe_oa@tail-address-wrap@sag-1-1m:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.14] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-176934v1_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-lnl:          NOTRUN -> [SKIP][3] ([Intel XE#3658] / [Intel XE#7360])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
>     - shard-ptl:          NOTRUN -> [SKIP][4] ([Intel XE#5808]) +2 other tests skip
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-ptl-3/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>     - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#1407]) +1 other test skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-lnl-5/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
>     - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#1124]) +2 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-lnl-8/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>     - shard-ptl:          NOTRUN -> [SKIP][7] ([Intel XE#5855])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-ptl-3/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:
>     - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#8365])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-lnl-5/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-target-2560x1440p:
>     - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#367])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-lnl-8/igt@kms_bw@linear-tiling-2-displays-target-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:
>     - shard-ptl:          NOTRUN -> [SKIP][10] ([Intel XE#367])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-ptl-3/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
>     - shard-ptl:          NOTRUN -> [SKIP][11] ([Intel XE#5822]) +3 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-ptl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#2887]) +4 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-lnl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-b-dp-1:
>     - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2652]) +3 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-b-dp-1.html
> 
>   * igt@kms_chamelium_color@ctm-0-50:
>     - shard-ptl:          NOTRUN -> [SKIP][14] ([Intel XE#5824])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-ptl-3/igt@kms_chamelium_color@ctm-0-50.html
> 
>   * igt@kms_chamelium_color_pipeline@plane-lut1d:
>     - shard-ptl:          NOTRUN -> [SKIP][15] ([Intel XE#8391])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-ptl-3/igt@kms_chamelium_color_pipeline@plane-lut1d.html
> 
>   * igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:
>     - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#7358])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-lnl-5/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html
> 
>   * igt@kms_chamelium_hpd@common-hpd-after-hibernate:
>     - shard-ptl:          NOTRUN -> [SKIP][17] ([Intel XE#2252])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-ptl-3/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd:
>     - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#373]) +1 other test skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-lnl-5/igt@kms_chamelium_hpd@hdmi-hpd.html
> 
>   * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-4:
>     - shard-ptl:          NOTRUN -> [SKIP][19] ([Intel XE#6969]) +20 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-ptl-3/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-4.html
> 
>   * igt@kms_content_protection@atomic-dpms-hdcp14:
>     - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#7642])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-lnl-5/igt@kms_content_protection@atomic-dpms-hdcp14.html
> 
>   * igt@kms_content_protection@lic-type-0:
>     - shard-ptl:          NOTRUN -> [SKIP][21] ([Intel XE#7642])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-ptl-3/igt@kms_content_protection@lic-type-0.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x512:
>     - shard-ptl:          NOTRUN -> [SKIP][22] ([Intel XE#5846])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-ptl-3/igt@kms_cursor_crc@cursor-random-512x512.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>     - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#309] / [Intel XE#7343]) +1 other test skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
>     - shard-ptl:          NOTRUN -> [SKIP][24] ([Intel XE#5962] / [Intel XE#7343])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-ptl-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>     - shard-bmg:          [PASS][25] -> [FAIL][26] ([Intel XE#7809])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6014-d645db52a6b60d0f0d921077f0233085b41b3a1e/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
> 
>   * igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:
>     - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#9539])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-lnl-5/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html
> 
>   * igt@kms_dp_linktrain_fallback@dp-fallback:
>     - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#9009])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-lnl-5/igt@kms_dp_linktrain_fallback@dp-fallback.html
> 
>   * igt@kms_dsc@dsc-fractional-bpp-bigjoiner:
>     - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#8265])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-lnl-8/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html
> 
>   * igt@kms_dsc@dsc-with-formats-ultrajoiner:
>     - shard-ptl:          NOTRUN -> [SKIP][30] ([Intel XE#5907]) +1 other test skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-ptl-3/igt@kms_dsc@dsc-with-formats-ultrajoiner.html
> 
>   * igt@kms_feature_discovery@chamelium:
>     - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#701] / [Intel XE#7359])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-lnl-5/igt@kms_feature_discovery@chamelium.html
> 
>   * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
>     - shard-ptl:          NOTRUN -> [SKIP][32] ([Intel XE#2316]) +1 other test skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-ptl-3/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
>     - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#1421])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-lnl-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x:
>     - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#7179])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
>     - shard-ptl:          NOTRUN -> [SKIP][35] ([Intel XE#7178]) +2 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-ptl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#7178] / [Intel XE#7351])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-rte:
>     - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#656] / [Intel XE#7905]) +12 other tests skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-2p-rte.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:
>     - shard-ptl:          NOTRUN -> [SKIP][39] ([Intel XE#5800] / [Intel XE#6312]) +1 other test skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-ptl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-mmap-wc:
>     - shard-ptl:          NOTRUN -> [SKIP][40] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-ptl-3/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:
>     - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#6312] / [Intel XE#651]) +3 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-indfb-draw-blt:
>     - shard-ptl:          NOTRUN -> [SKIP][42] ([Intel XE#6312]) +2 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-ptl-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#6312]) +5 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-draw-render:
>     - shard-ptl:          NOTRUN -> [SKIP][44] ([Intel XE#5812]) +16 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-ptl-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#7061])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-plflip-blt:
>     - shard-ptl:          NOTRUN -> [SKIP][46] ([Intel XE#7865]) +1 other test skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-ptl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-blt:
>     - shard-ptl:          NOTRUN -> [SKIP][47] ([Intel XE#7061]) +2 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-ptl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-indfb-msflip-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#7905]) +8 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-lnl-5/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#7865]) +9 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-lnl-5/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-render.html
> 
>   * igt@kms_joiner@invalid-modeset-big-joiner:
>     - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#6901])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-lnl-5/igt@kms_joiner@invalid-modeset-big-joiner.html
> 
>   * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
>     - shard-ptl:          NOTRUN -> [SKIP][51] ([Intel XE#6912])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-ptl-3/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:
>     - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#7283]) +1 other test skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-lnl-5/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html
> 
>   * igt@kms_plane_lowres@tiling-4:
>     - shard-ptl:          NOTRUN -> [SKIP][53] ([Intel XE#5844]) +4 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-ptl-3/igt@kms_plane_lowres@tiling-4.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a:
>     - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#2763] / [Intel XE#6886]) +3 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-lnl-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a.html
> 
>   * igt@kms_pm_dc@dc5-dpms-negative:
>     - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#1131])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-lnl-5/igt@kms_pm_dc@dc5-dpms-negative.html
> 
>   * igt@kms_pm_rpm@dpms-non-lpsp:
>     - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-lnl-5/igt@kms_pm_rpm@dpms-non-lpsp.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
>     - shard-ptl:          NOTRUN -> [SKIP][57] ([Intel XE#5858] / [Intel XE#7304]) +1 other test skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-ptl-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:
>     - shard-ptl:          NOTRUN -> [SKIP][58] ([Intel XE#5858])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-ptl-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1.html
> 
>   * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
>     - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#2893] / [Intel XE#7304]) +1 other test skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-lnl-5/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-blt@edp-1:
>     - shard-ptl:          NOTRUN -> [SKIP][60] ([Intel XE#1406] / [Intel XE#5835]) +1 other test skip
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-ptl-3/igt@kms_psr@fbc-psr2-sprite-blt@edp-1.html
> 
>   * igt@kms_psr@pr-sprite-plane-move:
>     - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#1406]) +1 other test skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-lnl-5/igt@kms_psr@pr-sprite-plane-move.html
> 
>   * igt@kms_rotation_crc@primary-rotation-270:
>     - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#3904] / [Intel XE#7342])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-lnl-5/igt@kms_rotation_crc@primary-rotation-270.html
> 
>   * igt@kms_vrr@flip-dpms@pipe-a-edp-1:
>     - shard-ptl:          [PASS][63] -> [FAIL][64] ([Intel XE#4227] / [Intel XE#7397]) +3 other tests fail
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6014-d645db52a6b60d0f0d921077f0233085b41b3a1e/shard-ptl-2/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-ptl-7/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html
> 
>   * igt@kms_vrr@lobf:
>     - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#1499] / [Intel XE#9271])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-lnl-5/igt@kms_vrr@lobf.html
> 
>   * igt@kms_vrr@lobf@pipe-a-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#7638] / [Intel XE#9271])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-lnl-5/igt@kms_vrr@lobf@pipe-a-edp-1.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-bmg:          [PASS][67] -> [INCOMPLETE][68] ([Intel XE#6321] / [Intel XE#8355])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6014-d645db52a6b60d0f0d921077f0233085b41b3a1e/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-threads-large-multi-vm:
>     - shard-ptl:          NOTRUN -> [SKIP][69] ([Intel XE#5764]) +1 other test skip
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-ptl-3/igt@xe_evict@evict-threads-large-multi-vm.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:
>     - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#6540] / [Intel XE#688]) +2 other tests skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-lnl-5/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html
> 
>   * igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race:
>     - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#7482]) +4 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-lnl-5/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race.html
> 
>   * igt@xe_exec_balancer@twice-cm-virtual-userptr:
>     - shard-ptl:          NOTRUN -> [SKIP][72] ([Intel XE#7482]) +2 other tests skip
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-ptl-3/igt@xe_exec_balancer@twice-cm-virtual-userptr.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
>     - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#1392]) +1 other test skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-lnl-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
>     - shard-ptl:          NOTRUN -> [SKIP][74] ([Intel XE#5575] / [Intel XE#7484]) +1 other test skip
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-ptl-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html
> 
>   * igt@xe_exec_fault_mode@once-multi-queue-invalid-userptr-fault:
>     - shard-ptl:          NOTRUN -> [SKIP][75] ([Intel XE#8374]) +2 other tests skip
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-ptl-3/igt@xe_exec_fault_mode@once-multi-queue-invalid-userptr-fault.html
> 
>   * igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch:
>     - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#8374]) +3 other tests skip
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-lnl-5/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch.html
> 
>   * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-close-fd-smem:
>     - shard-ptl:          NOTRUN -> [SKIP][77] ([Intel XE#8364]) +4 other tests skip
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-ptl-3/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-close-fd-smem.html
> 
>   * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-priority-smem:
>     - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#8364]) +7 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-lnl-5/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-priority-smem.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-cm-basic:
>     - shard-ptl:          NOTRUN -> [SKIP][79] ([Intel XE#8378])
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-ptl-3/igt@xe_exec_threads@threads-multi-queue-cm-basic.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-cm-userptr:
>     - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#8378]) +1 other test skip
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-lnl-5/igt@xe_exec_threads@threads-multi-queue-cm-userptr.html
> 
>   * igt@xe_mmap@pci-membarrier:
>     - shard-ptl:          NOTRUN -> [SKIP][81] ([Intel XE#5100] / [Intel XE#7408])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-ptl-3/igt@xe_mmap@pci-membarrier.html
> 
>   * igt@xe_mmap@pci-membarrier-bad-pagesize:
>     - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#5100] / [Intel XE#7322] / [Intel XE#7408])
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-lnl-5/igt@xe_mmap@pci-membarrier-bad-pagesize.html
> 
>   * igt@xe_mmap@vram:
>     - shard-ptl:          NOTRUN -> [SKIP][83] ([Intel XE#5776])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-ptl-3/igt@xe_mmap@vram.html
> 
>   * igt@xe_multigpu_svm@mgpu-coherency-prefetch:
>     - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#6964])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-lnl-5/igt@xe_multigpu_svm@mgpu-coherency-prefetch.html
> 
>   * igt@xe_page_reclaim@binds-large-split:
>     - shard-ptl:          NOTRUN -> [SKIP][85] ([Intel XE#7793])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-ptl-3/igt@xe_page_reclaim@binds-large-split.html
> 
>   * igt@xe_pm@s4-basic:
>     - shard-lnl:          [PASS][86] -> [ABORT][87] ([Intel XE#9362]) +1 other test abort
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6014-d645db52a6b60d0f0d921077f0233085b41b3a1e/shard-lnl-4/igt@xe_pm@s4-basic.html
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-lnl-5/igt@xe_pm@s4-basic.html
> 
>   * igt@xe_pm@s4-exec-after:
>     - shard-ptl:          [PASS][88] -> [ABORT][89] ([Intel XE#9362])
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6014-d645db52a6b60d0f0d921077f0233085b41b3a1e/shard-ptl-3/igt@xe_pm@s4-exec-after.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-ptl-1/igt@xe_pm@s4-exec-after.html
> 
>   * igt@xe_pm@s4-vm-bind-prefetch:
>     - shard-lnl:          NOTRUN -> [ABORT][90] ([Intel XE#9362])
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-lnl-8/igt@xe_pm@s4-vm-bind-prefetch.html
> 
>   * igt@xe_prefetch_fault@prefetch-fault:
>     - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#7599])
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-lnl-5/igt@xe_prefetch_fault@prefetch-fault.html
> 
>   * igt@xe_query@multigpu-query-cs-cycles:
>     - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#944])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-lnl-3/igt@xe_query@multigpu-query-cs-cycles.html
> 
>   * igt@xe_query@multigpu-query-invalid-query:
>     - shard-ptl:          NOTRUN -> [SKIP][93] ([Intel XE#6019])
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-ptl-3/igt@xe_query@multigpu-query-invalid-query.html
> 
>   * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
>     - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#4130] / [Intel XE#7366])
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-lnl-5/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
> 
>   * igt@xe_sriov_vram@vf-access-beyond:
>     - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#6376] / [Intel XE#7330] / [Intel XE#7422])
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-lnl-5/igt@xe_sriov_vram@vf-access-beyond.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@core_hotunplug@hotreplug-lateclose-with-load:
>     - shard-lnl:          [ABORT][96] -> [PASS][97]
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6014-d645db52a6b60d0f0d921077f0233085b41b3a1e/shard-lnl-5/igt@core_hotunplug@hotreplug-lateclose-with-load.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-lnl-8/igt@core_hotunplug@hotreplug-lateclose-with-load.html
> 
>   * igt@kms_async_flips@alternate-sync-async-flip-atomic:
>     - shard-bmg:          [FAIL][98] ([Intel XE#3718] / [Intel XE#6078]) -> [PASS][99]
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6014-d645db52a6b60d0f0d921077f0233085b41b3a1e/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
> 
>   * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-3:
>     - shard-bmg:          [FAIL][100] ([Intel XE#6078]) -> [PASS][101]
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6014-d645db52a6b60d0f0d921077f0233085b41b3a1e/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-3.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-3.html
> 
>   * igt@kms_atomic_transition@plane-toggle-modeset-transition:
>     - shard-bmg:          [FAIL][102] ([Intel XE#8098] / [Intel XE#9561]) -> [PASS][103] +1 other test pass
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6014-d645db52a6b60d0f0d921077f0233085b41b3a1e/shard-bmg-3/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-bmg-3/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
> 
>   * igt@kms_flip@flip-vs-dpms-on-nop@c-dp2:
>     - shard-bmg:          [FAIL][104] ([Intel XE#3098]) -> [PASS][105] +2 other tests pass
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6014-d645db52a6b60d0f0d921077f0233085b41b3a1e/shard-bmg-10/igt@kms_flip@flip-vs-dpms-on-nop@c-dp2.html
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-bmg-8/igt@kms_flip@flip-vs-dpms-on-nop@c-dp2.html
> 
>   * igt@xe_pm@s4-multiple-execs:
>     - shard-ptl:          [ABORT][106] ([Intel XE#9362]) -> [PASS][107]
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6014-d645db52a6b60d0f0d921077f0233085b41b3a1e/shard-ptl-1/igt@xe_pm@s4-multiple-execs.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-ptl-3/igt@xe_pm@s4-multiple-execs.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
>     - shard-lnl:          [SKIP][108] ([Intel XE#309] / [Intel XE#7343]) -> [SKIP][109] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935])
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6014-d645db52a6b60d0f0d921077f0233085b41b3a1e/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-bmg:          [SKIP][110] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][111] ([Intel XE#3544])
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6014-d645db52a6b60d0f0d921077f0233085b41b3a1e/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-bmg:          [FAIL][112] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][113] ([Intel XE#2426] / [Intel XE#5848])
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6014-d645db52a6b60d0f0d921077f0233085b41b3a1e/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-bmg:          [SKIP][114] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][115] ([Intel XE#2509] / [Intel XE#7437])
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6014-d645db52a6b60d0f0d921077f0233085b41b3a1e/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
>   [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
>   [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
>   [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
>   [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
>   [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
>   [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
>   [Intel XE#5776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5776
>   [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
>   [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
>   [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
>   [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
>   [Intel XE#5824]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824
>   [Intel XE#5835]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5835
>   [Intel XE#5844]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5844
>   [Intel XE#5846]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5846
>   [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
>   [Intel XE#5855]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5855
>   [Intel XE#5858]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858
>   [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
>   [Intel XE#5962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
>   [Intel XE#6019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019
>   [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
>   [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
>   [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
>   [Intel XE#6376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
>   [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
>   [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
>   [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
>   [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
>   [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
>   [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
>   [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
>   [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
>   [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
>   [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
>   [Intel XE#7322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7322
>   [Intel XE#7330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7330
>   [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
>   [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
>   [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
>   [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
>   [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
>   [Intel XE#7359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7359
>   [Intel XE#7360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7360
>   [Intel XE#7366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366
>   [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
>   [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
>   [Intel XE#7408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408
>   [Intel XE#7422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422
>   [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
>   [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
>   [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
>   [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
>   [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
>   [Intel XE#7638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7638
>   [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
>   [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
>   [Intel XE#7809]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809
>   [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
>   [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
>   [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
>   [Intel XE#8098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8098
>   [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
>   [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
>   [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
>   [Intel XE#8365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365
>   [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
>   [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
>   [Intel XE#8391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391
>   [Intel XE#9009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9009
>   [Intel XE#9271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271
>   [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#9539]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9539
>   [Intel XE#9561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9561
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-6014-d645db52a6b60d0f0d921077f0233085b41b3a1e -> xe-pw-176934v1
> 
>   IGT_9166: 9166
>   xe-6014-d645db52a6b60d0f0d921077f0233085b41b3a1e: d645db52a6b60d0f0d921077f0233085b41b3a1e
>   xe-pw-176934v1: 176934v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176934v1/index.html

-- 
