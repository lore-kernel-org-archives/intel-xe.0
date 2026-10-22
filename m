Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA51606A31B
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 13:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IxRe85v1
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83C37112605;
	Thu, 22 Oct 2026 13:05:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAC551125EF
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Oct 2026 13:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792674331; x=1824210331;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Ja1weiGtNQgCy729XLCss+y5VAhNekXy7Rr8ZK5Dbfk=;
 b=IxRe85v1K53N8PSGnVJ55TacBqkTwla6c37ZAECp6DuUIFkZwcBPGMkU
 Og4HprcMBctHE4KGhePtezvF54ICBovc69NbWu7tzVQG5MnAvtGzUV0b4
 1e7aZrLx+FUO0SdOJ+sJmbhQTrNxk4EYh/t62jwjCHNd44jt4I1lsFdJB
 2JNwnFJvTNcGDutr1oPgq0rjC0i1qWhKZa9OEe91xvX3WQs+9U1Pk/MIQ
 oEnjUXvbjBWN+BSQLS2CMD4pKbRYFjNa9yqzzsVwsWCYoTbyzf7z/8L+D
 N4DrARFuV+6QOShS3NSRFDV+aU6iYKQTxey3n4VD9Z6Z1Zl3ecG2SNYL/ g==;
X-CSE-ConnectionGUID: 9jsB8mhUR/ic+uiygN1sfA==
X-CSE-MsgGUID: UCrxJX6iRE6FuR/HNjVKWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1321646"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1321646"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 06:05:30 -0700
X-CSE-ConnectionGUID: IgDJ/kJfT+OcQLZ/+6BUtA==
X-CSE-MsgGUID: ASq4+cd+R8OFoktpltmhNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3696518"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 06:05:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 06:05:28 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 22 Oct 2026 06:05:28 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.7) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 06:05:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fGIw2pZn9fLOZG/8ahIxAIz8BA4GDiRdyOHJ5Z8G0BqUShNEgBbcvRLCGJoQJ0wGTvW96XZUfGVgUWqwa8omTh5ZEepjAFg8kMvGCknxSW+izPTgJsHIj6xvNQUZPHUcSeVickhDwp2qfCG2TRZ+GADkZehUpYJuMVOHN/9SrIuUkQ0ZvRoIANqptMmS17sGraT9nc7KCZ+LyajiwG/kzfJUEeIVs93MKLojGCOWnq6jyyxBJ3iGJ2Gm6J52Fspe2PmaIkPXfAv9K6JilHOkt29Em+mF3629NISW8adKaXlpF3TKmnVKA5JwfhLS6DJdK0l/23bgUVDRh8uIXpT/HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e7icWKuwRoNz+eMS2LJ3RLeAC/MrS8AQe7TkhhxJUUs=;
 b=W2JNgUvEM26iGNNUIusHVf5GC1//WZb5+c63hrsUnTOnfhcE4v8XjdMvugT01C+gD+toNXmn7HkgvfUCBgrgozXY6TijsMFoBoBS+s9rUEouzyooz9IvMWzIORt1cf9kmeGF/XFS6vpiqGW939C6lH7qYdE+0CP2KrIioSbVY8NaD6bwTfK0jZE0xmfmFYuCrYQZ0NfsQSiecMBUKHC+SHBeQzTyXP2DlQLnIPmn5BHMzoeSbY68bf4LdCp0ZkMPBtgOvXQVuA15kCC05xx7CdX6ZO7BuiT8n2wLre6h4ase9XdxkMV7k8EvoC9C1M4ygEke7/5m4v0zNO3DtW/d1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5095.namprd11.prod.outlook.com (2603:10b6:510:3b::14)
 by SA3PR11MB7488.namprd11.prod.outlook.com (2603:10b6:806:313::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.17; Thu, 22 Oct
 2026 13:05:25 +0000
Received: from PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded]) by PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded%3]) with mapi id 15.21.0546.016; Thu, 22 Oct 2026
 13:05:24 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: "Tangudu, Tilak Tirumalesh" <tilak.tirumalesh.tangudu@intel.com>,
 "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH 2/2] drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p
 platforms
In-Reply-To: <DS4PR11MB131308CE13341A61366FECD6B2C8652@DS4PR11MB131308.namprd11.prod.outlook.com>
References: <20260916100545.779894-1-tilak.tirumalesh.tangudu@intel.com>
 <20260916100545.779894-3-tilak.tirumalesh.tangudu@intel.com>
 <87cxt2ewb6.fsf@intel.com>
 <DS4PR11MB131308CE13341A61366FECD6B2C8652@DS4PR11MB131308.namprd11.prod.outlook.com>
Date: Thu, 22 Oct 2026 10:05:20 -0300
Message-ID: <87se1xga27.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0016.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::23) To PH0PR11MB5095.namprd11.prod.outlook.com
 (2603:10b6:510:3b::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5095:EE_|SA3PR11MB7488:EE_
X-MS-Office365-Filtering-Correlation-Id: 82a96f66-756d-4230-30b8-08df303d22f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|261021121427099003|261009223027099003|56012099006|11063799006|4143699003|10067099003|260925022911599003|261021123027099003|22082099003|260925021911599003|18002099003|260925021311599003;
X-Microsoft-Antispam-Message-Info: 6UOA98a5J7u2zcUxFd+GKUQIGlMQ7yVDFOn86zVSKYmuSQMa28nWltru4cMjKOupnXBnT5RVsMj2lAIkd6VkT8p6aj+RuIZ31WRWkyT6Y0ZtU3LoXcwgY+dnd+JEdt7CbwOHQtH+4skU63/Jpc5SVXIS4AMdR1Wepn9m73IlqtxAVLKQAMyPiIpt3lIldp46q+6lLBpXpemmlFShx4Eo+uXGRIv0oHfAyCg8OOwyL4K8niB1waET3JJ++Or0qTYducK5/aBv2rnkWPB8PN/RQplHdMC76iCLS4TzlMI+A3wUxNYG1xXsBmxG7rpZ4qlAqETdzO7L7PwgwSdV7XOOw2oXXvITPP8R66yjWx6toVV2Dc7D7XLuCQ7l33+EgpHrEdMIDZ+YNh/2Rx2CDeDoxCUGUpPTWL/l7u47g0eW7uxAIIjZh/EVcBDYnhKNH2pM2/l8fYo2R8jaCgDSswrt663U2yVmExfk13bsuih+r7zGTUB6OQeoW7XTCuN4ul7OinByHwVO8gRdxzQqAPhJ0jNMXM55OAVep5TAjtHI80r+ic+TJLiFMC2XIZE81SCiOSv6kIkMaZz6ukPsLJXXu3sBb95csGb5n88Otf7+kJVZQl5HKmhkpQd+xvWCnMI8N3ymuGj6WLlXJLBPq9qwreiRSB5wEbmajSkFvj8kA64=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5095.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(261021121427099003)(261009223027099003)(56012099006)(11063799006)(4143699003)(10067099003)(260925022911599003)(261021123027099003)(22082099003)(260925021911599003)(18002099003)(260925021311599003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MKlbVmS4sjCO39b8lkIe0Qozp3sF3jgr1twldQV/y/xOAvnPQxOKMdhC4XQa?=
 =?us-ascii?Q?0pj/SxDaIh0smtRqDkm/gHdIFJiG3ffOEhMSefgsclxxMPnK19uWiMmZxyjx?=
 =?us-ascii?Q?WmR79pVYrnq71jBEKUAkk+zpiKqNLte59lgdI8/FkAnKd1WwYMPmc6NEsTWe?=
 =?us-ascii?Q?LVesDjToNofaFk0TtINgw8S1H8bJMQP8hrEUQBjTsghTGceR6oRIARbPoN07?=
 =?us-ascii?Q?kOSvOap03lYlvW70+9GsjArugjO6t0EA1uRm4xS7w0pSn0clAxkAWmbDkHXP?=
 =?us-ascii?Q?B5TmHtEoHNHKimtuKvnaZtU4e4dILlScw+4o6APVl/Rj8J81ccScgPjajT0l?=
 =?us-ascii?Q?wAYPHelIW2y1mHu5t5FXRwHIv88FRL+o7zCLw7litybc82X4TdJ+hV2z9Xby?=
 =?us-ascii?Q?EzeOP/hhvxIfrK3sY1A+S5kjj3oUoFwpzDp/MWRsnxDTLCR8Xfx+7RYkx0mL?=
 =?us-ascii?Q?lC4VpV4Qn0um/X1NKzhoHUcBMM0KsLLN7z1rcuFsBNfLW2eanzz9pfLnSJXK?=
 =?us-ascii?Q?rlLlly90lM8Bgijnx6CVZY/IEVnCt4ZfeoypS4EmiyxhuYQ02CJBeycguwSN?=
 =?us-ascii?Q?tRXVsreDk5oSTXPMdljB1UFC2NNYZomDII7X5cHkJPaKohulBN88VJ7Rqzc7?=
 =?us-ascii?Q?gIhAH9PFClAYY6CfCmqB2gZNBOO7BI6etzjFbkhrQck3NSpu6uarmAmLkBeq?=
 =?us-ascii?Q?WU/ADL3yrEBNhT3EyFQyY103B547Ypr+++VT8rM++A/o7nZ1xrkMktJ+ujxe?=
 =?us-ascii?Q?373PHReZ7zYyY3rgkcu1RExl6uoRiUjLfiLkjRHLusx9wXnB6iI4kSh423Nb?=
 =?us-ascii?Q?QDqlPbVn+83TDwNfeCtLoS5X7PkyRcdAQm/kDpbrmtBciaoVMoxZkqpuALZc?=
 =?us-ascii?Q?GChdNm3qyrxwX0IbOpzd3/zeQXB+kpEGMoWm3S3J1LUrl4GkCVLJBFzyc03o?=
 =?us-ascii?Q?3atKk82yo6b6iuJhXtY3MJ1tO7W0gyYT5PAuVLnO6ejE2r7Hko8hH677Hq8j?=
 =?us-ascii?Q?+KOU0nfVMWj/5Mno/dY9UJcvyDO1vh7L4B15MJGtXz8a9zBOYcSIl/T9LWlX?=
 =?us-ascii?Q?C1+iseXHgTSjy7FtBpqd8iijeUBtHZsiY2gson/kQVZpzFaBIuvY5tb5SwtK?=
 =?us-ascii?Q?ZV1PObBGfDAOCVE1dHwBCMJrJnZDdcDpp81MNTr7NGmEeobZ0p2tVeDNVsSW?=
 =?us-ascii?Q?MB8CKJLrnMxbcmxKLtQ0wktB0/y3d0JBtWUYlXMQhZIVPl1i8MRVTchaVFj0?=
 =?us-ascii?Q?wugHkYrJiPre+UbeaT46eOgORH3qhdn086qvAKSJitUYx2jvIlXZojfwGnw9?=
 =?us-ascii?Q?nx9tEyflWqxLKNul0PStFh/ldVJQ7X1Sy3kFbnET7XyOAzKOa8DYzTy2mun9?=
 =?us-ascii?Q?Y0yTO2zuMHYSx9VIPtwyFrhNys4ICteuywxI42cnI+0W2d+lYtmuaGqZRO0Y?=
 =?us-ascii?Q?+VimCoD+LWzAIGF5FZzfjATZywxYSinjIQlRsJrjlIXlBhSbu5IFdumvOWSh?=
 =?us-ascii?Q?me1yxRQ2HWDQmUKrPF5A1my5xr90Ovz5J6g9YzCSZFH9PvmxNVokCB5ggCYy?=
 =?us-ascii?Q?RHYHC+FNiH2iebr7BAuB5CFF6Y+91cnnVFeXwYithpuIxWYNVesRrYUTFugO?=
 =?us-ascii?Q?CWqePK2cGX5ZQmToA5aM5mQcsUJImUYmIhY7siEWj+yTzZO+YKWm9QDswNVp?=
 =?us-ascii?Q?o+VqSwu8t+wCckmXaoY1sIBde9qY12FXicvwLyPkq/aewmBhYvdXrm4cQ5l+?=
 =?us-ascii?Q?yrkaFCrFnw=3D=3D?=
X-Exchange-RoutingPolicyChecked: 2edy1k+W99lp91Eij5dqDE5mzqKj0s/09wIeBT0U/TDxlkRc52gWbPx17KBdgl3/lILYjDD0x0GdjnJmQDKEI8fb/XZBlg7IrzSSwbRn70XyBQWf5t+HWsJpgd7DKiny1Y6a7DYQE7cT8kmdCrQJPA1/7qq2P4W2oaoxLIxdgjmDJC+Nih/Q2jW+kpSsGiu2CZ3/9frjka3Vu5o7neY7V28PLbn3pJaFRvT1LMOH9HU0Svywl6sCq+txqDqax1fU5XEz+xy3HNXCPRRCybd511am0gUsHyWV7DeSsOL3EbIfLQgrP5T36NmA9PbkvSSoZDjb8pE5ta1Jr+gwXL49aw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 82a96f66-756d-4230-30b8-08df303d22f6
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5095.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 13:05:24.8916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CuTnIqzmEfOAqGNymV64JX+rSZhEiJj5NxBNiF0OzqZ9fJhIVwNsrrjrRf0agKQTuVQ1UL3LZaR3+TZKuUqtog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7488
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

"Tangudu, Tilak Tirumalesh" <tilak.tirumalesh.tangudu@intel.com> writes:

>> -----Original Message-----
>> From: Sousa, Gustavo <gustavo.sousa@intel.com>
>> Sent: 22 October 2026 00:05
>> To: Tangudu, Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>;
>> Tangudu, Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>;
>> Belgaumkar, Vinay <vinay.belgaumkar@intel.com>; Lin, Shuicheng
>> <shuicheng.lin@intel.com>; intel-xe@lists.freedesktop.org
>> Cc: Roper, Matthew D <matthew.d.roper@intel.com>
>> Subject: Re: [PATCH 2/2] drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p
>> platforms
>> 
>> tilak.tirumalesh.tangudu@intel.com writes:
>> 
>> > From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
>> >
>> > Avoid programming the IDLEDLY timer to less than 5 microseconds.
>> > Apply wa_14025941587 to Graphics Versions 20.01 to 35.11 and Media
>> > Versions 13.01 to 35.03
>> >
>> > v2: Use xe_rtp_match_not_sriov_vf, move to local variable
>> >     Remove warn and other knits            - Matt R
>> >
>> > v3: Add verbose comment - Tejas
>> >
>> > v4: Restore IDLE_DLY register on engine reset.
>> >     Add it to GUC save-restore list. -Vivek
>> >
>> > v5: Extend WA to Media Versions 13.01 to 35.03 - Vinay
>> >
>> > v6: Avoid clearing inhibit switch - Bala
>> >     Refactor code accordingly by adding idle_reg_val.
>> >
>> > v7: Rebased with the divide-by-zero/overflow guards living in
>> >     a separate hardening patch.
>> >
>> > v8: Preserve the Wa_16023105232 floor (DIV_ROUND_DOWN_ULL) and the
>> >     maxcnt == 0 guard from the hardening patch. Round up
>> >     (DIV_ROUND_UP_ULL) the Wa_14025941587 minimum conversion
>> instead,
>> >     so the tick-quantized delay cannot round back below 5 us.
>> >
>> > v9: Evaluate the Wa_16023105232 xe_gt_WARN_ON() against the value
>> >     read from hardware instead of the Wa_14025941587-bumped value,
>> >     so it no longer fires on the driver's own floor. Re-check the
>> >     rounded-up tick value against maxcnt and floor it if tick
>> >     quantization pushed it back to/above maxcnt, logging via
>> >     xe_gt_dbg since this is the driver's own value, not a hardware
>> >     anomaly.
>> >
>> > Assisted-by: GitHub_Copilot:claude-opus-4.8
>> > Signed-off-by: Tangudu Tilak Tirumalesh
>> > <tilak.tirumalesh.tangudu@intel.com>
>> > ---
>> >  drivers/gpu/drm/xe/xe_guc_ads.c    |  2 +-
>> >  drivers/gpu/drm/xe/xe_hw_engine.c  | 93
>> > ++++++++++++++++++++++++------  drivers/gpu/drm/xe/xe_wa_oob.rules |
>> > 2 +
>> >  3 files changed, 79 insertions(+), 18 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c
>> > b/drivers/gpu/drm/xe/xe_guc_ads.c index ff8eee3831aa..58a3f6293ce4
>> > 100644
>> > --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>> > +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>> > @@ -864,7 +864,7 @@ static unsigned int guc_mmio_regset_write(struct
>> xe_guc_ads *ads,
>> >  		}
>> >  	}
>> >
>> > -	if (XE_GT_WA(hwe->gt, 16023105232))
>> > +	if (XE_GT_WA(hwe->gt, 16023105232) || XE_GT_WA(hwe->gt,
>> > +14025941587))
>> >  		guc_mmio_regset_write_one(ads, regset_map,
>> >  					  RING_IDLEDLY(hwe->mmio_base),
>> >  					  count++);
>> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c
>> > b/drivers/gpu/drm/xe/xe_hw_engine.c
>> > index d868af8e3301..9680d2a5adec 100644
>> > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>> > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>> > @@ -585,44 +585,103 @@ static void hw_engine_init_early(struct xe_gt
>> *gt, struct xe_hw_engine *hwe,
>> >  	xe_reg_whitelist_process_engine(hwe);
>> >  }
>> >
>> > +static u32 idledly_floor_ticks(u32 idledly_ns, u32 idledly_units_ps)
>> > +{
>> > +	return DIV_ROUND_DOWN_ULL((u64)idledly_ns * 1000,
>> idledly_units_ps);
>> > +}
>> > +
>> >  static void adjust_idledly(struct xe_hw_engine *hwe)  {
>> >  	struct xe_gt *gt = hwe->gt;
>> > -	u32 idledly, maxcnt;
>> > +	u32 idledly, idledly_hw, idledly_reg_val, maxcnt;
>> >  	u32 idledly_units_ps = 8 * gt->info.timestamp_base;
>> >  	u32 maxcnt_units_ns = 640;
>> > -	bool inhibit_switch = 0;
>> > +	bool inhibit_switch = false;
>> >  	bool wa_applied = false;
>> > +	bool clamped_below_maxcnt = false;
>> > +
>> > +	if ((!IS_SRIOV_VF(gt_to_xe(gt)) && XE_GT_WA(gt, 16023105232)) ||
>> > +	    XE_GT_WA(gt, 14025941587)) {
>> 
>> Hey, eveyone.
>> 
>> I came across this recently I was wondering why Wa_14025941587 doesn't
>> check for SRIOV as done for Wa_16023105232.
>> 
>> I think VF doesn't have access to the IDLEDLY register.
>> 
>> I'll be changing this section of the driver soon.  I could send a patch making
>> sure that we bail early if on a VF.
>> 
>> --
>> Gustavo Sousa
> The patch has rtp func guard below in oob rules, this should be sufficient right ?

Yep, right. I realized that after I prematurely sent this email :'-)

That said, I decided to write patch that drops
FUNC(xe_rtp_match_not_sriov_vf) and just adds an early return in the
beginning of adjust_idledly() if VF mode is detected. The justification
is that with that we simplify the conditions in the OOB rules file and
we have consistency between all workarounds related to IDLEDLY (there is
another coming soon); and that adjust_idledly() should always bail if
the driver is in VF mode irrespective of which workarounds are active.

--
Gustavo Sousa

>
> 8< -----------------------
>> > +14025941587	GRAPHICS_VERSION_RANGE(2001, 3511),
>> FUNC(xe_rtp_match_not_sriov_vf)
>> > +		MEDIA_VERSION_RANGE(1301, 3503),
>> FUNC(xe_rtp_match_not_sriov_vf)
>
> ------------------------- >8
> -Tilak
>> 
>> > +		u32 mincnt_idledly_ns = 5000;
>> >
>> > -	if (!IS_SRIOV_VF(gt_to_xe(gt)) && XE_GT_WA(gt, 16023105232)) {
>> >  		/* xe_gt_clock_init() warns and zeroes timestamp_base on
>> unknown crystal clock. */
>> >  		if (!idledly_units_ps)
>> >  			return;
>> >
>> > -		idledly = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe-
>> >mmio_base));
>> > +		idledly_reg_val = xe_mmio_read32(&gt->mmio,
>> > +RING_IDLEDLY(hwe->mmio_base));
>> >  		maxcnt = xe_mmio_read32(&gt->mmio,
>> > RING_PWRCTX_MAXCNT(hwe->mmio_base));
>> >
>> > -		inhibit_switch = idledly &
>> INHIBIT_SWITCH_UNTIL_PREEMPTED;
>> > -		idledly = REG_FIELD_GET(IDLE_DELAY, idledly);
>> > +		inhibit_switch = idledly_reg_val &
>> INHIBIT_SWITCH_UNTIL_PREEMPTED;
>> > +		idledly = REG_FIELD_GET(IDLE_DELAY, idledly_reg_val);
>> >  		idledly = DIV_ROUND_CLOSEST_ULL((u64)idledly *
>> idledly_units_ps,
>> > 1000);
>> > +		idledly_hw = idledly;
>> >  		maxcnt = REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt);
>> >  		maxcnt *= maxcnt_units_ns;
>> >
>> > -		/* Clear the inhibit switch without disturbing a valid delay. */
>> > -		if (inhibit_switch)
>> > +		/*
>> > +		 * Wa_14025941587 is applied before Wa_16023105232,
>> which takes
>> > +		 * priority if the two ever conflict (not expected in practice).
>> > +		 */
>> > +		if (XE_GT_WA(gt, 14025941587) &&
>> > +		    idledly < mincnt_idledly_ns) {
>> > +			idledly = mincnt_idledly_ns;
>> >  			wa_applied = true;
>> > +		}
>> >
>> > -		if (xe_gt_WARN_ON(gt, idledly >= maxcnt)) {
>> > -			/* Floor below maxcnt; write 0 to still clear the inhibit
>> bit. */
>> > -			idledly = maxcnt ?
>> > -				DIV_ROUND_DOWN_ULL((u64)(maxcnt - 1) *
>> 1000,
>> > -						   idledly_units_ps) : 0;
>> > -			wa_applied = true;
>> > +		if (XE_GT_WA(gt, 16023105232)) {
>> > +			/* Clear the inhibit switch without disturbing a valid
>> delay. */
>> > +			if (inhibit_switch) {
>> > +				idledly_reg_val &=
>> ~INHIBIT_SWITCH_UNTIL_PREEMPTED;
>> > +				wa_applied = true;
>> > +			}
>> > +
>> > +			/* Warn only on the value read from hardware. */
>> > +			xe_gt_WARN_ON(gt, idledly_hw >= maxcnt);
>> > +
>> > +			if (idledly >= maxcnt) {
>> > +				/* maxcnt may be 0 if IDLE_WAIT_TIME is
>> unprogrammed. */
>> > +				idledly = maxcnt ? maxcnt - 1 : 0;
>> > +				clamped_below_maxcnt = true;
>> > +				wa_applied = true;
>> > +			}
>> >  		}
>> >
>> > -		if (wa_applied)
>> > -			xe_mmio_write32(&gt->mmio, RING_IDLEDLY(hwe-
>> >mmio_base),
>> > -					REG_FIELD_PREP(IDLE_DELAY,
>> idledly));
>> > +		if (wa_applied) {
>> > +			u32 idledly_ticks;
>> > +
>> > +			/*
>> > +			 * Wa_16023105232 requires idledly < maxcnt, so
>> floor
>> > +			 * that clamp; otherwise round up to guarantee the
>> > +			 * Wa_14025941587 minimum survives tick
>> quantization.
>> > +			 */
>> > +			if (clamped_below_maxcnt)
>> > +				idledly_ticks = idledly_floor_ticks(idledly,
>> idledly_units_ps);
>> > +			else
>> > +				idledly_ticks =
>> DIV_ROUND_UP_ULL((u64)idledly * 1000,
>> > +
>> idledly_units_ps);
>> > +
>> > +			/*
>> > +			 * Tick quantization can still push the rounded-up
>> value
>> > +			 * to/above maxcnt; re-floor here so
>> Wa_16023105232 keeps
>> > +			 * priority even in that case.
>> > +			 */
>> > +			if (!clamped_below_maxcnt && XE_GT_WA(gt,
>> 16023105232) &&
>> > +			    (u64)idledly_ticks * idledly_units_ps >=
>> (u64)maxcnt * 1000) {
>> > +				xe_gt_dbg(gt, "idledly %s: %u ticks would
>> exceed maxcnt=%u, so flooring\n",
>> > +					  hwe->name, idledly_ticks, maxcnt);
>> > +				idledly = maxcnt ? maxcnt - 1 : 0;
>> > +				idledly_ticks = idledly_floor_ticks(idledly,
>> idledly_units_ps);
>> > +			}
>> > +
>> > +			idledly_reg_val &= ~IDLE_DELAY;
>> > +			idledly_reg_val |= REG_FIELD_PREP(IDLE_DELAY,
>> idledly_ticks);
>> > +			xe_gt_dbg(gt, "idledly %s: set %u max=%u inh=%u
>> ts=%u\n",
>> > +				  hwe->name, idledly, maxcnt,
>> > +				  !!inhibit_switch, gt->info.timestamp_base);
>> > +			xe_mmio_write32(&gt->mmio,
>> > +					RING_IDLEDLY(hwe->mmio_base),
>> > +					idledly_reg_val);
>> > +		}
>> >  	}
>> >  }
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules
>> > b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> > index dd69ad07f7a9..3001155f8d09 100644
>> > --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>> > +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> > @@ -72,3 +72,5 @@
>> >  16029897822	MEDIA_VERSION(3500)
>> >  		GRAPHICS_VERSION(3510)
>> >  14027054324	GRAPHICS_VERSION(3511)
>
>> > +14025941587	GRAPHICS_VERSION_RANGE(2001, 3511),
>> FUNC(xe_rtp_match_not_sriov_vf)
>> > +		MEDIA_VERSION_RANGE(1301, 3503),
>> FUNC(xe_rtp_match_not_sriov_vf)
>
>
>> > --
>> > 2.46.0
