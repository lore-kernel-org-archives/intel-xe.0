Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C29DAE6BF1E
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 15:55:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E7B710E0B5;
	Fri, 30 Jan 2026 15:55:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dihQE3dD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E044B10E0B5
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jan 2026 15:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769788543; x=1801324543;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=iPsX2dei4bX4Sd33MTNRJY6v0pFY7LNP/9C6katKNWI=;
 b=dihQE3dDB2uI3xLGTcedd3G9OVYFOmX7S8+IsWImRr20V1U6W3nmE5ts
 Y9gh7BN5qw+EvRdEac5jK8qtjoVhEXhaz9zd7LQIrcbbB4S8m0UiuU22I
 a2ObzXIvXwXlETLdWaFIszbF7Ax8ip8cPtMtcsXRvLnYmByVw+PwN49Si
 dDr8NWOl71mPoYypCAAhH9DaIga9itbw8a4AQByXYh0vOiGFDyOs+oLxd
 +ir8mXa9hGVl0eLC/n5/BqmU6upm/JjrpnktLCea2Pi/i3Tff0xw1sGz5
 fiBfNLOsqqpGI/3k7eSl0l5551fXHUF7S7fhg0R7wfL3H0XIDY2Tc1duy A==;
X-CSE-ConnectionGUID: jHJwMhS6R2CpOfm8UKD1HA==
X-CSE-MsgGUID: KWc+DZ2jSSm5QJihXnbRtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="58618655"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="58618655"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 07:55:42 -0800
X-CSE-ConnectionGUID: mhvgpqHsTJ2U4mxOuH+jnQ==
X-CSE-MsgGUID: c3DVsuxpT/uAvzFl6i2ojA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="208992431"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 07:55:42 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 07:55:41 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 30 Jan 2026 07:55:41 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.27)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 07:55:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bg7UZ4NQ3tiapgIl5GYIL8iogV7p4PvUqQR9Dl5Jv+PAGJ23lu8U6/5VCZIvhKXHGtFF+fLgrTMTox0IXatnqhsYxGtmpFw3Wuh1KHbmo+yglUNeMI7NYk7kdRvkzX56rGVKhZXg0AiDJ2/0phWshJHQ1HcnpG7if1+SQE6Owiazbe9X9+HjtYdQ28u8/TqZUCggL0tS0IpoRbpm3jtdH6zsWuM3nm2dO5yKPadQhtntPUgA6RcKmoZhCHP54PqhhnNzBcvXRoqaGziyNqz3JFj55qlUuWg+ACFLypiwWnt6lnIPtqIym5cfEM3CZ5rYfhxiNbj77Z6fvVfO3HX73g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hUVSqNgdUwjB1EEzQb4uE6RPyjbZIZyCngpAwe8r8TE=;
 b=Mhp6a6aYZzc45vxMXnebBTNiTsoU9IAgOqXbz093G6zaAmvZGFY0YCdduNYQGN7s8zW4sHk64gFogrTq9Dd/UhtgAvcFfQ5a6jXPNwLdMx0pnIBA7iMDK/2FbxFeSjMhqI4hGaVDoUJr+cmhOuY0sN/AgSnu5Q8X/UnYKT6hrtXCPMrVC7n8wtxKdxlnqr7efU8SZq10szO4msqZ81hKOKtljv1f+q7bQxqEW3Bp/qbcJSvML8UNTwlgxPimJRAXt/gqIpvbX2eHQccxXNtpeYqeSpIHQWx1clafL8tJ3nGa23UMLGNaSGkFY1z8hedFbFjeWz96bp1ovZZ1SadQrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CH3PR11MB8155.namprd11.prod.outlook.com (2603:10b6:610:164::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Fri, 30 Jan
 2026 15:55:39 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 15:55:39 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Matt
 Roper" <matthew.d.roper@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: [PATCH v1] drm/xe/vf: Avoid reading media version when media GT is
 disabled
Date: Fri, 30 Jan 2026 16:55:22 +0100
Message-ID: <20260130155522.2738547-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TLZP290CA0001.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::14) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CH3PR11MB8155:EE_
X-MS-Office365-Filtering-Correlation-Id: a102eb74-ac70-4cc7-5c68-08de6018038c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RVRRTzkxZ0xMZEYrWUJTQzdVRnhzZXlrNllwbXo1N3I1VXpjZUpZck8yQ3Rq?=
 =?utf-8?B?NU5QQVNZY2J0aUpFeGljODMwUVZOTjlZck03U2h6clExQ2xMR1RoZTQ5aUJQ?=
 =?utf-8?B?d0VGNHF2QWlLVzFMbWJUSzZxMlhnck0zdlB2NW9JVFNCcmNoKzcwU3RDWFRy?=
 =?utf-8?B?eGZtMm9iVmVGVkpDZ2M3RUVpeDlMRXBpMzllZ00vVTg2eEYvaTI4VFhzdm5I?=
 =?utf-8?B?NnQ4Vm92Nzc3RDRWb2J1SkF3K3hnUVF4dzdnMVpMQk9ZNHFSQkdqbGVPNUZX?=
 =?utf-8?B?NXR6UGhOLzBnMTNZZXo1MDZOcFBTdlF0OGlxMHlhc2dUMVZObDQ1RjlWTmdC?=
 =?utf-8?B?QzZoRE83SU9WYTVIVWRWUDkvOTJXamFRc1BmOG5NQndXdnN5L1lDSzFLYjJT?=
 =?utf-8?B?TVh5Z3BCL2xVeWQvcTZiMUNXdGF2MVRSZkJMekZrTmJGOUFwbUVlR2R4Rno2?=
 =?utf-8?B?WGtDWERiYytYaG1ndzVIMFRsclRGWUh1WjIrZW5iYlpRTWpiYzFIRkkrVU1W?=
 =?utf-8?B?VXRBdTZSaWd2Yjl6cy9WRjRLNWxmV1dvSzZZa1RyY1RWYnYwSmNWQU5PSVV1?=
 =?utf-8?B?SXBDL1dsMS9KQWg2SW5pVWNGRG1qTnpYTDZHS2xtOUlzL2QxQ2NSQkZSMU8v?=
 =?utf-8?B?UGs1dTVVSDVGSmNvUkprL0FGZmIxZ0toMWYrVm1uSncySGlvWmIzYlZQeXI4?=
 =?utf-8?B?bEdyQ1p5akRSOUNPdytKalNZbWlQRDlTdnZ1L3BCTmxiVThpL1N4ZVNLK2wx?=
 =?utf-8?B?aEcvUWpsY3UrSTEzYUxGbVJPNzkzbmo3d216M0tqRTlEM2VRMlZNTjgxaHBo?=
 =?utf-8?B?cEJhZG4waUl0aURiMnR0OGw1cVZDVTJtSysrVVhwVUppRzl4UElLaDBEdVVj?=
 =?utf-8?B?dXN0emhOQVFUakRZd25XSHJta1JUVHpGVVZONHBSeXBFQlA3QUppdGEraFpi?=
 =?utf-8?B?VWgxTUxJOWY1ZzRPWGFGb2JSVnFXL0RhMTBOaGk0SlE4MWdUZ1lRZFFoaUk4?=
 =?utf-8?B?T3luay84Nkd5ZERZU0FMSDFlNVRzck9yajVIK0hCSUJoR1MwcHExTzB2Z1o0?=
 =?utf-8?B?d0lUVTFtMUMwQkR2TEZLck5MZjBsUmpwcmlJaU8yRk9TRStFNHdHUFN0cTVX?=
 =?utf-8?B?bWtxaVFPcTFZb1BOR1JWaXRQRnpyWHBHejdZWUdydnZBVnlSSnAvbFhEUFdx?=
 =?utf-8?B?ODZDNmhzdklUbWZMMDd6cjJubmtZYTgzQ2poMTgvTy81aDdxWHpaTnU3RTlj?=
 =?utf-8?B?RCtZcGJNQmYrRko2RXR4OGRUTUh3WDJvaE9zS01IMUtmU1MrSElFRG9wTnBI?=
 =?utf-8?B?TEtRd0xieE1xR0dUb2JEU3VrWWhQNlFJVnluSlJ0dWhzVGRjc1ZXM1FOOXpQ?=
 =?utf-8?B?TEYySll3L28wVDBCY3FaL2RkWUx3VmJqa1hLeTgvcE4rMFNrVnhZVXE0d0pQ?=
 =?utf-8?B?SktsTWhmbDkrNWtob3FFUlhFd01GTDBwa0ovL2hEaVhhRFgzYmpoOVBqK1FO?=
 =?utf-8?B?bG83aDFSZVRyYlJhS0ovbVFBOXZZYnk0SGNWNER4ZU9rekpwVW11QzVlSWF2?=
 =?utf-8?B?b3BVWmdaY1FORnYvK2hLdEFrMXN1R2JDZHRjZHZyZzNXcG81TEFyK1paUG4r?=
 =?utf-8?B?eEVDRXZ2a3MySUY1bmd0SFhrdGI1VHo2dmU4TnhXVkxUckppMjhjTlE4OU5D?=
 =?utf-8?B?OFhzQTY3dmkrL0o1endJS2RKdTUreHZFVStoMFlIYTErQTY3QW9zYVZORHVL?=
 =?utf-8?B?VzRPYmRjL3RPb1BqMTNkU1U2QW4yc1lacDFRbGZ6UE5hRDR4WnZzMmlnNkpZ?=
 =?utf-8?B?WUxRL2grTGh4M1FFU2hZQzZoR0JSQUFKS00vdisrT3M3WGxtUDFvb3J5Qjc4?=
 =?utf-8?B?N2Y0Tko4TGZpRklZRkpvckV1TDNWYzgwV3dTK2FQYi8xTjV2Y2g0UnNwSnRh?=
 =?utf-8?B?dlpJTTBnZWU3ckROZGlNUCtkL29DbWpxMXNKMVB5bUFJWmErNHJGUDEyMTFn?=
 =?utf-8?B?bEVSRXgxckp2Vkg0dUh5YjhpNFgrLy80OUtQUEtDZ3pOek1Ya0hWNlRSQVNp?=
 =?utf-8?B?QnJNSDlQVzNEKzl0RUNHNGdwNnQwMXdsZDJwNTNwdWNNRjU4QjBnZWZnd25n?=
 =?utf-8?Q?gHwM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3V3WHVSTXhtUlo5QVBxeHZPeEZyYzNsMXpvN0YxbS9OaG8xSFpkM3lqTEVn?=
 =?utf-8?B?a1IyM3U0U0h4Tm16MWVFU1crTUplUUpaTHFrMG1YRHI3OVJuQ3dzNDNVUnk0?=
 =?utf-8?B?VVdmbmZLZ3l4b2l0OUx4a09PZ2lVKzJpQWRncDEvMSt2ME9pTTU5enpOOTJx?=
 =?utf-8?B?SGRGUi9saHA4Z3RpMWlPNEVyMXAxN2Q0djY3MkE4dkNyL09ObCtKTllsNXIy?=
 =?utf-8?B?akgwbHZkSlpVNXhRaGhNR2JjSHpWMVpqUyt3Nmhadzc4cThKNDV3b002YmFJ?=
 =?utf-8?B?YXZsUzA5MkJZVDV2Ym9sSkpZZWJqbklLcXJ4UGRLUERwbUVIUzN5ZFpwdCsv?=
 =?utf-8?B?NGNSTjJkY0RSeVlUbHRhbCt2NkFTWGl6Q2oreDVDNEp2M0cvcG5DT0N0UHFC?=
 =?utf-8?B?eGRHVzRYTDd0d1ZIaXdqSk8wbEdLNnl6ZmdwTTJWL2hvMERnNk5WSHpRVG1B?=
 =?utf-8?B?SEtEb0JsM2hiTVo3WFdNSjdYSG03QXpWUTZhZjdnaXJkM0FidEIrVmFOd3Vt?=
 =?utf-8?B?VlJ2MzdrUWtJOUUvR256Q1o1WkUwcXNwUVBlcDRLaFFDZUx2NTlFSExwOUI3?=
 =?utf-8?B?LzhIZTBDS3kvN3BnemNLb000YThjWmw2cjlZb2V5dUJFYVRQRmxSaTdKa0dB?=
 =?utf-8?B?QVN3bDNoaVpnMmxaZVQwVXVuRUg5VTZYbHo3aTI5WUpSeWVjdldpQmdjWTds?=
 =?utf-8?B?YVo2Ri9RVzN1Q3FNbFJYOXZiTDdRR2lrOGlRVHJzbXl1OE9VYkZ4WHROZDlQ?=
 =?utf-8?B?YVo1b0RjM0Jma1JVeXUwSUMyUlh5VVFzZUlDREt0R1QzQWNQNklEN1FDRFIv?=
 =?utf-8?B?QkhqQnk2V3IzRThMZ09RazY2LzNCWmRXWHVXeWNyeEFsSng2cHRGZ3hSSldL?=
 =?utf-8?B?Q28yaVEyQ2J2WStxS1ZRaFA0alhVeS9GN0UrUFlEWFNVLzJtY01udk0xb0Nm?=
 =?utf-8?B?ZjZzTmhaMzg0K1RESmNiTnlxdkV2NDlTSXp3dGg1cU02RlF5S2luLzZwOUI0?=
 =?utf-8?B?VkplbjJNRGpMMlRheXptZ0RjZkFQU1ZKUCtDR2pKeWdtVzJCb2lGbVF2K21l?=
 =?utf-8?B?Ui83dGVaMk5HSW9xbEhzbjdZMkZndW05WUZpTytmblRwaU5oSEpoUjE3dEVT?=
 =?utf-8?B?ZDFDQ0JQT3MrRWgySjZOaGh5N0JlRCtpc2JKemhOTksxRmc5bzdTdmVxRjRL?=
 =?utf-8?B?ZFZwc0RmQjVCSHBQRUFIa3pJUWZtSFlQdS85ZGV6eW9EYmFqeE15eFhyZGti?=
 =?utf-8?B?SEdjUktRakpIV1p1QVQxeFc5M3Fpb3Q5TVRGSUJOQXk2Z1YySjRZS1hUMUZ5?=
 =?utf-8?B?UzVXckpvcWdEdFE3RWZVZnA1alQweENBYS9JbWdpTm4rZDZ5cnhuSzE3SHBO?=
 =?utf-8?B?SFNmMlBWUHJoMTZJR1VEUVFqRnF6OVNuTVZBZStFaEM2TG4zOVp0aG1MZVoy?=
 =?utf-8?B?STVsSW5aamVHd1E5anl3N3ZxMXlGZ1lQZE1XSHQ5VjhxcjRPT29sL01IVEpq?=
 =?utf-8?B?eXRwY1hlMkVobnJBc0FCMENuMkU4eUtSLzBQN0M5NllzQlBBSnFmd3pkdnlG?=
 =?utf-8?B?eThBTGtweThuc0lWM0RQTjk0bjM2Qm0zNnB0Zjh4QU5iTW52aWVBNU1iRk5P?=
 =?utf-8?B?U2VOQStETTh4V1NENHp5d2s0WEVjb2VlQ3ZiQ085ZjFwODJYa0ZyWUwvRy9U?=
 =?utf-8?B?UDNmeEFSNzV0UE9ZYzB4MGVDeVhMWlpBNjJNaGxVMjVFSythMnpMdnZmRjda?=
 =?utf-8?B?ejhpL2hLcW9NU1NBcmFtYkJQeFNYRFdrS21CTmFVamhGelJaWUdJWVFqOXdE?=
 =?utf-8?B?NmlqUnEranZtQ2FVejNjU0lOS2tYNElVbmViRjVheE02MlJkTU1yK0xQcHNh?=
 =?utf-8?B?QkJqVktUZmh2VGdwZUhRNVBQRzdtYURtckFDOFp3d1BubXROOFA4YmpZT0V1?=
 =?utf-8?B?ZnJ4UXBQRkhITTlKSkl1RUFQYVZ5WkJ3SkFWRnZ0ZHFPTlNGcmxiMExLY2hZ?=
 =?utf-8?B?RzgrMHphVlBXUzBtNlozd01taWVIOU9JZVlSbGMzSnY2MllMZWpMcUZ2ckNH?=
 =?utf-8?B?aTROV24vZTVUY2ZxWlI5SXVmQjRBYWtTYkNKWlN1TDdVSWNYQktHU0wrMko2?=
 =?utf-8?B?WmEySGVZeThMY0pNeWM5VHhnOVJYaUJtdmVySWhWMFJsbjhYVUJwaGFkU3Q3?=
 =?utf-8?B?TWYzY2s4amZ2ekx0UlFEN2JJbFRDL2tlU2txS0lEK1FuQ1hFTWRUMHZxcjlu?=
 =?utf-8?B?YWtsdkVNZEpzanlTTTdwSm5pUWcxeUFxcStaWlRiQWF4ZWRYZ2xIQnVCcUhX?=
 =?utf-8?B?N3F5L0E2NFUwWDlucXNsR21DNTYrbFJQUHI0ZWFGNXNPdWpCcGRsblFQOHla?=
 =?utf-8?Q?WygfQPzGKxYL2WUA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a102eb74-ac70-4cc7-5c68-08de6018038c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 15:55:38.9151 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FvV0pMwmuzkjlKley6oXiHX8V/Ny8f9HLzJcAfMoE5zD/I5erUbVKRwyEkHGeS39SX+gMB9aQrNr5TecQAp9SJNaGaY1CeB27E/8eGwxXNY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8155
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

When the media GT is not allowed, a VF must not attempt to read
the media version from the GuC. The GuC may not be loaded, and
any attempt to communicate with it would result in a timeout
and a VF probe failure:

(...)
[ 1912.406046] xe 0000:01:00.1: [drm] *ERROR* Tile0: GT1: GuC mmio request 0x5507: no reply 0x5507
[ 1912.407277] xe 0000:01:00.1: [drm] *ERROR* Tile0: GT1: [GUC COMMUNICATION] MMIO send failed (-ETIMEDOUT)
[ 1912.408689] xe 0000:01:00.1: [drm] *ERROR* VF: Tile0: GT1: Failed to reset GuC state (-ETIMEDOUT)
[ 1912.413986] xe 0000:01:00.1: probe with driver xe failed with error -110

Let's skip reading the media version for VFs when the media GT is not
allowed.

Fixes: 7abd69278bb5 ("drm/xe/configfs: Add attribute to disable GT types")
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index b5e8935fff1d..6ac1baabab4e 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -644,6 +644,10 @@ static int handle_gmdid(struct xe_device *xe,
 			ver / 100, ver % 100);
 	}
 
+	/* Don't try read media ver if media GT is not allowed */
+	if (!xe_configfs_media_gt_allowed(to_pci_dev(xe->drm.dev)))
+		return 0;
+
 	ret = read_gmdid(xe, GMDID_MEDIA, &ver, media_revid);
 	if (ret)
 		return ret;
-- 
2.34.1

