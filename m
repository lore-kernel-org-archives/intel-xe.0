Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C47C369AB
	for <intel-xe@archiver.kernel.org>; Thu, 24 Apr 2025 17:50:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6623A10E025;
	Thu, 24 Apr 2025 17:50:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UhOWAkgn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63BD910E025
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Apr 2025 17:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745517042; x=1777053042;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=toB6+Te8SYnph+nF0VSkEMo/AeN6u9E7908cmbJ+JVU=;
 b=UhOWAkgnzA1teCC5C1Tqqeaa7EVfatBcd8eCmxroNeUwRg4LGe6RTMsO
 bn7kVh29cxr7MPCxCTmT97fg7ZjoCh1pxJJw0O964xbTFcfkYMx5LuSdD
 8EtWv7gCEAJAxse24867WE3HtGYVteyVRRUb7feAQpjkV+inK8wVn8IKT
 QlvIPsEmzQNkgZUcqfFSwYe1OqWBrMsceHDLDlgvBh5j8hqPDzmHusU/Z
 aPpYpUz/uNCqbp6UHRzK/ylBFHILFDOwvezWRiK1Nu73UfjykufqVfFub
 2NNXi8oPCVo6BaK/D1sDsSaubHRFzl8kAzO19RJoPyMpn6CXMJ/A2n43P Q==;
X-CSE-ConnectionGUID: tAud5UUuSkKBr7hg8SApuw==
X-CSE-MsgGUID: YLFdQcZRQkCT1K4binBcrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="50831032"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="50831032"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 10:50:41 -0700
X-CSE-ConnectionGUID: I7RfO080SKq/i/s+rrjbpw==
X-CSE-MsgGUID: mp5uUUtCSDyt/ZPKUqM9sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="163745200"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 10:50:40 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 24 Apr 2025 10:50:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 24 Apr 2025 10:50:39 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 24 Apr 2025 10:50:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XGxxPOLtxOattCKYi0WAuJmrF0EXU+ZxFGSBAnw8SDxmIGPdVAqfgd6UD3/ZYXBs3y85HWGH9F04pG3d5AE/Ac+LGDCoukmPdMkj/YqKKoEZqxLroMwbEOksIwoPqibq5UNikyrzHMEeutsIwqggfv/QU7nnyC9xCiqsGG02n2MKJeosZk7uO6PGURYGe5/MX5iYVI7bTiiJCo7u9LPtz6aiFWzF7p/JhnTMVN5tUeoznGxzivz5b+2NXcE9myrvPomt8XA6BYvGGEQCmwNczX6R15ftGU54C28jFvWUrXbk/pgEFegoVZnF7G3Tx9+3+C10gyehHzAEWn96qTqY3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rS895b8nk5MWAgWfKdTS3p0r/acL4uWVMc1EDyoIt8M=;
 b=kROTLfSmFkHlnv9xCXPBF29mKIrI3Y+E0sCfTY/kxwC8B88wfN4cFwerpZFTSeT7lK4RkdlWBcNNqEHfmM+OPilutKJuZya3YqOOtBAaBDUceyStbKK4xuhELRTidxuvC8RFj7zyXBX/G4A129CR1dxEi9BQ6sXVPLETeuPmbn0vtxzOOf/4GxD5PY7R85Yv7qyoufGgONKZhlp84C4Ob/7WmnkAoCIYFJsuEHskveNKI2OUKmB+i2Qz9TeItOxbHNIH6E8lmbVZxBcH8r0mk69cAqzBm51RrD/nXxebZESb2Rx8ZH46qH2cvhLJRBlkIeNnjn5jY8X1+nOykmlfRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by PH7PR11MB6793.namprd11.prod.outlook.com (2603:10b6:510:1b7::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Thu, 24 Apr
 2025 17:50:35 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%3]) with mapi id 15.20.8678.025; Thu, 24 Apr 2025
 17:50:35 +0000
Date: Thu, 24 Apr 2025 10:50:33 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.s.atwood@intel.com>
Subject: Re: [PATCH 1/1] drm/xe/eustall: Do not support EU stall on SRIOV VF
Message-ID: <aAp56TPDNKDXs7xl@intel.com>
References: <10db5d1c7e17aadca7078ff74575b7ffc0d5d6b8.1745215022.git.harish.chegondi@intel.com>
 <87fri1105c.wl-ashutosh.dixit@intel.com>
 <87ecxk256d.wl-ashutosh.dixit@intel.com>
 <aAledu4zlIpfE2_h@intel.com>
 <874iye5uuu.wl-ashutosh.dixit@intel.com>
 <8734dy5f9n.wl-ashutosh.dixit@intel.com>
 <871pti5f0n.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <871pti5f0n.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0075.namprd03.prod.outlook.com
 (2603:10b6:303:b6::20) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|PH7PR11MB6793:EE_
X-MS-Office365-Filtering-Correlation-Id: c3e374a3-2b3d-4b3c-d92b-08dd83588415
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L0RtWU1Dc3grQ1oydkdNWWN5MUNDQnUzMVBJT1k5bHFPZEFzMzBXcTZMMWVr?=
 =?utf-8?B?eXNpaGpQdHdSV3FxMkE5alNHVEtla2pZYkcrc0dJZVU3cStmZEJXaVl4aUJS?=
 =?utf-8?B?NVllVmQzMS96dUk1eXVINDVFSW5oOG5kK1VtZHZKa0pGdnFiQ0pMSm1jZzlk?=
 =?utf-8?B?N25tVjFrZmpNL1pYNnBwdzhMRmxvbnVhcVB5bmhBdnZVSko2RE84a3Vyekd3?=
 =?utf-8?B?ZjFQdFQ5ODhNMGs3cnB5TVh0aTY2TzVoNFRjZmd4TXJSY3VsYVdvdlBaQ2RP?=
 =?utf-8?B?TmVSdDhIZ1Vac2hrN0ZmRXdQa3NLeFBtU0cyL1lSQ1ZvcFFOQWJjdm15b3hQ?=
 =?utf-8?B?ak9xTmtydUdtUWxWNTFjUlhPbWpvMU84U2orOUxzRDZjeDNMaFRkcUxFTHoz?=
 =?utf-8?B?TmdrbEZXZ2N5bXJtSkR4WVpJUFRQK0ZaRktNczVUSnNMQ1BzRUZkWnk4RExN?=
 =?utf-8?B?ODFTVFBnUE4xSG9BSE9iRk5QY1lBQmNNN3B5eEJKRHNlQ25lUkNtMmZLaVhj?=
 =?utf-8?B?S0hTY0EvOUMvZlR2eEtoSGJhaVBMc3AzNk42VHBPNXpDK25reEw4akIvbi9V?=
 =?utf-8?B?N2MwVVRYUGRmNkRvTXp0cFRxSXplaHdEWE5randwbTFlNlRjR2VCZUpMMW5q?=
 =?utf-8?B?cWJEYnprMmNKWGdwb1FUN2psdTRrcmlrTG9vQ0U5c2lDR3FXSkFTcW8zSDh2?=
 =?utf-8?B?cWNyVkZEZXVRWW9LTm16YXVVOWQvSTlmMWlQYXpoeXAydG5zY3hGTzBCZkZ5?=
 =?utf-8?B?SlkzUndWdllXa3Job1pDay9WSTJmcGV0Q05LNW5SYW9EQmp2bHB2MWg3aG5Z?=
 =?utf-8?B?ZE5aUlNQcEd4ZFE1NlhCY29oa2RhQXZNSHB3UFFBMlZ4bkpaY1RaV2EvKzBQ?=
 =?utf-8?B?TjVTN1FqMjJyRkQ4VGJVV0NIWCttL2s4Yk5KVzAxSGtFZUEzYVgrZWRLUmln?=
 =?utf-8?B?Y21lUm9sY0hBa3cwWlFCelg2U3pweUJYbXlTcUlGbFdZSXR1R3Q5NFZBelpO?=
 =?utf-8?B?NVBQTmEvRUpObXlXdG1hbThkYUVObEZVaFBzWTdtNlRRRCtMekZUS1Z0S1d4?=
 =?utf-8?B?WG1laWVhS1pRdVk2b0ZtZk1kMU1xeG04NGRUb2xsZ2VXeVFjQTVNdlFjc0FK?=
 =?utf-8?B?YlZ4NXB2QU5oUUthSVBSYm1IdDhWQldFWEY3NFJDUU5sVUE0eG1wYmNXQW0z?=
 =?utf-8?B?b2FlREtrRHUxb2VNaTBZdzFUbXlkeTNuVWVzZi9QSFBnejl6ZDk2NThqNzZk?=
 =?utf-8?B?WkdidkpTWUxFd0JyTGpLcVo0cW9DS3BTUE1ncXhHVG05MVZxVkxWbjNodnA4?=
 =?utf-8?B?QzJySzNxeHR4QUk2cHpVc1Rqd25Gbk1ybUV3REpmeUd5VlIraFgzbVNsZWRT?=
 =?utf-8?B?dVVuMCtpUHVQQkE5Tkw0TlhOUWJhUFlzWW95WnhUSVBZUStFUFpWK2lBUHlD?=
 =?utf-8?B?RlkvSGRDNXlyaVplekw1VmlBYm5GWDE2b3d3ajlkYWdXTWNsbnNNN21nc1dh?=
 =?utf-8?B?K1lDalFQR0Jyb3lPS240cCt6bXRmZlpiTWVvYk5xemQzT2hLVmcxeitvWllw?=
 =?utf-8?B?cmlLTXVSZUhKVnZ2blR6OEZQTUJwdUcrYVZWbGJpMnlpQjlJcDBhNC9vSktQ?=
 =?utf-8?B?SW4yTmhsUEd1R2RoQk5sSUMxNFFsWVF3SDFFcGdiblFNQk0wSEpSOWdRZTJ3?=
 =?utf-8?B?N2wwQnFldFNhYmxsaXBQSGlYNmtSSENvZWV0V1BjUThtRm80Q1BaTzd3WTZ1?=
 =?utf-8?B?WXlCVi8yY296MXFielRuVkZmL1NNOGRkSE9WeUMvUHlMd1laRkIxWFpSV2pm?=
 =?utf-8?B?WTF6cWVlQ3BXT1BjR3RhMkJXZE1hZFNtVHV3VCt6NmFUZS9WY1p1WVZEbVpO?=
 =?utf-8?B?ZjR2WmFaR1NGZVdWUDBldHJKVUhQUHhuRlJyYWxBbFBoYmViMGMwNkdQVE1D?=
 =?utf-8?Q?3hn24Qdy+1s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVhpU3ltQi81enNVbTZKQThnM2ZmM2tWd3k3aktGeElXbHExTThiWXVxZXZl?=
 =?utf-8?B?dHdTbGFvNEFMcmhYb2ljMC9SSFhCMWVoaUpxS3hvNjJBbm93MU1sMDVCNlVW?=
 =?utf-8?B?MkhoeVQ3ajlGRHU2ajNySjJTSzQ3SCtrakswVHBFUDRRK2RCWDQyV01PRHpn?=
 =?utf-8?B?VHV5TEpxUzhHQ3NOQ2hWNW93TEt4VnlROWJxcDZqRlBoU0Q5aVh4NnZKQWZP?=
 =?utf-8?B?YWZmZW1JWTJhRXhERVlRdHFIeER3WHdpaHg1STB2Rk8vbkx2eUY4Ti96Q0hz?=
 =?utf-8?B?U3F5SlZKZm5PZzdJOXVQSnlNbDIyOXJyVEdQZ2hlWlJKRTFRYzdtZUhwN1oz?=
 =?utf-8?B?cmFhMU9ndHJscWJRN3g2UTFhSzVzb1lEUWthZzdLRzlqaXhhbXErY0RWNDda?=
 =?utf-8?B?TUNWUlNiL1lOSjVPZy9qL0lzK0dSSHhxZXJmUDlveWwzV29obVdBMDRack4x?=
 =?utf-8?B?dkRtNVkvN0ZPVHcxc0RxZ0x0cG13MGY5UUdHQmxLZ0JTb1psK1pyV0p5RVdZ?=
 =?utf-8?B?Y3dhTUZ0UGo2cGx6YlBBR1JWeGhjZDV6SyttTHdXOGNjeHYyNFpsZmpNY2lX?=
 =?utf-8?B?VzV1WXJYSWtUQ2tNenYxeXZMbVpCM1hkUElJYjZHRVRnWXNhQTY0QWFyd2lG?=
 =?utf-8?B?dzdVOG9NQlV5VENXcGx2c2hjR1FMdDk5V1JZYkVkR3ZicTFCQ0JDL3RlN0hS?=
 =?utf-8?B?T1lzR200dnNUV2c3cmdMNUtKUVVLdnBFRzcyQzhhR053NUl0amlkdzFZM1Uz?=
 =?utf-8?B?RS8waDJmN3lmMDBjMlFSTEJQcjBPbDIzVlZ4U0JmekJ1cUp6OFhHcGVqVXZw?=
 =?utf-8?B?VjNMTTZCNXFOOTlGU3JaQzA4eUUyTFg1L3d2R1krUUpUMnRJK2JhNzFCUUFF?=
 =?utf-8?B?WFc3cTVhTFZoN0ZHczdwOTZUWUxkRG1mZHN0V1RiZUhNYjRuV0t6ZXhFQUdD?=
 =?utf-8?B?U1AxQWl6SmxxMm9Ca0kwdDJFMzZwUlFwNTV3RThFL2JyODNnYmpCSGFkcG41?=
 =?utf-8?B?di83d0JaYlR5ZGpYUTJpWVhLYWZkaGZQeWRMNmgrNEora2o3UENVbFpza09i?=
 =?utf-8?B?KzgrN04zRXBEdW1DSHhnUlZrQnphRUswT2MzUEluYW1reU1LTWRiWG5VUHNB?=
 =?utf-8?B?aVlwMm9FZUpETHhWeDRQS0Zza0ZFdjNJT2RYclZLWXI3VXA2bWdkaXV5L0hp?=
 =?utf-8?B?ZFBnaC9OM2MvMmJlOHZhcU5QSi9OM3hrcGVHUmx3SDk3YWh1R0R1dm1vZHNS?=
 =?utf-8?B?eEh3a3l1LzMvQWcxNTV3ZDlmZFRIZDBuU0NpUk9USjNWV3RiMVBQV0xOUkJQ?=
 =?utf-8?B?enYrYTdnY1U3cDNseWIycTBwT1dzZGxkQTJ0NkErSjE1Y2NmUUNLeVAxZFpZ?=
 =?utf-8?B?cjlFWEtnZDc3MFJLV1psbVhzMGhiRlhHaElNQW5Yby82S1V6eExUZ3MyTzg3?=
 =?utf-8?B?ZlpHL0JyZVA5M0xVZVVPOEpXeVNrTi9hWjQvMVZYWDA4a3pCQkdvdHVIOVQx?=
 =?utf-8?B?QkFwRVJhRHE2bmxodTR6dTdTRHNmSGNsZ3hkeGFXdjNhRlVWYXJLalkzc2w1?=
 =?utf-8?B?aThHYzBJbTk4TExHTHpzL2xNSFJZelJtbUxLenpvRW5Uc3Fuc1NpR1FTSHNJ?=
 =?utf-8?B?MjZ4a0tQcmxLWjJlb2cwUGVZTUFLVDdtQmtJSytUODI0ZldZQUIxSHpXVTVL?=
 =?utf-8?B?Zno3TmFBeVllaVp5NFlrclFVK0hDWSs2MGxUYWRPcnFMS3d2aE9ZcXhmNWUy?=
 =?utf-8?B?U3g2RTdrK2FUWW55bVEvL1V0dHVha3R3MEZ1ZEVGbGlPOGxYTGVnSUpsNTBP?=
 =?utf-8?B?RGhXRnFZTWMybGtaN0I2R2RST0dUb0Z4ZEtpMC83SE1yNGswZ1hSZWVWNjVM?=
 =?utf-8?B?aDhKNVVlNjJ4WWZqdnRiWWlFTzhZc2hDdkUzb3ZBOTJWSm1iUjBrelczQWJa?=
 =?utf-8?B?UGJHWEJsbTVUNlR1QjhvWFJVSDhVR1Z0NU5jaENmZDZ5aElqbUo1aG92Zlhv?=
 =?utf-8?B?UytzeDJMVmJRNlRmalBRYmRUbmpwSTN3MFpNekRFbXNLY2R3SGw3YWdNSDVC?=
 =?utf-8?B?ZjJmdXhIV0cybGowUUIvU0ZuNVhmc1Z5YlJ3eUthRU4wNGlzOGJZeG51NmJK?=
 =?utf-8?B?VmFDZEFUcCtkSGRqcStZM0NJd1hGcnRSK1kxWkRqZGw3eHlMZmdZQi9pRkJ0?=
 =?utf-8?B?NWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3e374a3-2b3d-4b3c-d92b-08dd83588415
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 17:50:35.4561 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DENd1so3APYgDms+0qsYVWJTo4TqVAbRZ9sKp+RRH13g0sJ1l0u+7WlccjN0r7VzhYZ/4eZ6900rIp6jNn43ELrSnT2AjEmDsks5rVN0/as=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6793
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

On Wed, Apr 23, 2025 at 10:01:44PM -0700, Dixit, Ashutosh wrote:
> On Wed, 23 Apr 2025 21:56:20 -0700, Dixit, Ashutosh wrote:
> >
> > On Wed, 23 Apr 2025 16:19:37 -0700, Dixit, Ashutosh wrote:
> > >
> > > On Wed, 23 Apr 2025 14:41:10 -0700, Harish Chegondi wrote:
> > > >
> > > > On Mon, Apr 21, 2025 at 09:25:46PM -0700, Dixit, Ashutosh wrote:
> > > > > On Mon, 21 Apr 2025 17:59:43 -0700, Dixit, Ashutosh wrote:
> > > > > >
> > > > > > On Sun, 20 Apr 2025 22:59:01 -0700, Harish Chegondi wrote:
> > > > > > >
> > > > > > > EU stall sampling is not supported on SRIOV VF. Do not
> > > > > > > initialize or open EU stall stream on SRIOV VF.
> > > > > > >
> > > > > > > Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/xe/xe_eu_stall.c | 3 +++
> > > > > > >  drivers/gpu/drm/xe/xe_eu_stall.h | 3 ++-
> > > > > > >  2 files changed, 5 insertions(+), 1 deletion(-)
> > > > > > >
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
> > > > > > > index f2bb9168967c..64788277ea52 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_eu_stall.c
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> > > > > > > @@ -208,6 +208,9 @@ int xe_eu_stall_init(struct xe_gt *gt)
> > > > > > >	struct xe_device *xe = gt_to_xe(gt);
> > > > > > >	int ret;
> > > > > > >
> > > > > > > +	if (!xe_eu_stall_supported_on_platform(xe))
> > > > > > > +		return 0;
> > > > > >
> > > > > > This check is not strictly needed. If the check is not there, just some
> > > > > > unnecessary stuff will get initialized.
> > > > > >
> > > > > > But if you want to add this check here, you will also need to a
> > > > > > 'if (!gt->eu_stall)' check in xe_eu_stall_fini(). If you test this patch,
> > > > > > maybe you will already see oops when unloading the driver?
> > > > > >
> > > > > > So either remove this check or add the additional check in
> > > > > > xe_eu_stall_fini().
> > > > >
> > > > > If you do retain this check, maybe change the
> > > > > xe_eu_stall_supported_on_platform() check in xe_eu_stall_stream_open() to
> > > > > also 'if (!gt->eu_stall)' check, I think.
> > > >
> > > > I can change the if check to 'if (!gt->eu_stall)', but at this point in
> > > > the function GT hasn't been determined yet. I will have to move the
> > > > check later in the function after GT has been determined.
> > >
> > > Sure, let's put it after the 'if (!props.gt)' check.
> >
> > Hi Harish, sorry for the noise, but I changed my mind on this. So need to
> > change xe_eu_stall_stream_open(), the patch is good as is, so this is:
> >
> > Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> >
> > Though I do have a question: do media gt's also have eu stall hw? Since I
> > don't believe there are any gt's on media gt's, though I may be
> > wrong. Thanks.
> >
> 
> Sorry: I meant "Since I don't believe there are any eu's on media gt's".
You are correct, there are no Xecores (subslices) on media GTs and
therefore no EU stall HW on the media GTs.

Thank you
Harish.
> 
> >
> > >
> > > > >
> > > > > >
> > > > > > > +
> > > > > > >	gt->eu_stall = kzalloc(sizeof(*gt->eu_stall), GFP_KERNEL);
> > > > > > >	if (!gt->eu_stall) {
> > > > > > >		ret = -ENOMEM;
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_eu_stall.h b/drivers/gpu/drm/xe/xe_eu_stall.h
> > > > > > > index ed9d0f233566..d1c76e503799 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_eu_stall.h
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_eu_stall.h
> > > > > > > @@ -7,6 +7,7 @@
> > > > > > >  #define __XE_EU_STALL_H__
> > > > > > >
> > > > > > >  #include "xe_gt_types.h"
> > > > > > > +#include "xe_sriov.h"
> > > > > > >
> > > > > > >  size_t xe_eu_stall_get_per_xecore_buf_size(void);
> > > > > > >  size_t xe_eu_stall_data_record_size(struct xe_device *xe);
> > > > > > > @@ -19,6 +20,6 @@ int xe_eu_stall_stream_open(struct drm_device *dev,
> > > > > > >
> > > > > > >  static inline bool xe_eu_stall_supported_on_platform(struct xe_device *xe)
> > > > > > >  {
> > > > > > > -	return xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20;
> > > > > > > +	return !IS_SRIOV_VF(xe) && (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20);
> > > > > > >  }
> > > > > > >  #endif
> > > > > > > --
> > > > > > > 2.48.1
> > > > > > >
