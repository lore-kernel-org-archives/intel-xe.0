Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABAF4C87FCB
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 18:28:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7374310E226;
	Wed, 30 Jul 2025 18:28:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lmVLmV6H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 931DD10E226
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 18:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753900130; x=1785436130;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=xg7niDU9AG20aUHPjf+/Be97xnRsUag6aWnhajbpvCA=;
 b=lmVLmV6HStw4RRhHjrn5//lODipsGKNCTHLTOIBN1h/RpWqdrO0SX/5Z
 +rNCZAVHj2wKqjJMe1Hvdji9avh5te/ZbNQx8kOMx+Wu7oc8WMH7+OPRF
 6d4riM9qXJAKoEIkYGHh00f3ZL+6ODuhmYKyo1fLc+GQHfaE4baAVmDeI
 VOgw33kT8D6rq1IryUOcP/DxPzFgcA3eJe4u5nDgQz/IfBDh794LdCWuZ
 95Jpj1oHSPa57DxF/UlHomtoKJLy9gKR2fqI++dJhWiO27X05WtUcglsz
 NN38rKVcO2FhjSwz8+4YBEjb6oVFIWbTy1LwqLd82TDEgYH48oon5Ta08 g==;
X-CSE-ConnectionGUID: adQWF1xEQLyQcG983yBFgA==
X-CSE-MsgGUID: Gy27W9Y8SWC2b2R7blTabg==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="67574422"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="67574422"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 11:28:50 -0700
X-CSE-ConnectionGUID: PCSYKZi1QOqwneYvRSI0JA==
X-CSE-MsgGUID: g+1qhP0+QDqKB515XQMxyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="168462270"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 11:28:48 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 11:28:47 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 30 Jul 2025 11:28:47 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.76)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 11:28:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lNlAvR/JNgA4YZcTwWmeYqaQgh2sWbDgXKYelzWVrIP8sIRAIIHwcUmH9cg1CilWeKJ97Dkf2yZQY2hr+qYHKHDB/F1fzf3Lkw5CzBfAGsq6x/XyEHdkmyV8ycS44GqrwzIhh1AjikT/ZfxNymz2CQf4+OqUOnCaHOSyQ1+L9SFYfoPeEkL8IH0kl1fVPsMByoNe8fR2iKiGNeF8/fwBWEk2ipL7FMDEd3Kz1Z6yydpE9Kl6+Rm1G0tO4uGVeEGrHjvA4Pp1tyn2UFiJSN8RtRLKZLB73Ym//CynHdaXbL77hJk7qVbc0Y1ZqQWIv5N5JWJycWIz9r8moUTgeaBYJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7MzCnwoIMCTjjHW6y5eLqaFX66xh0YwBrJG+I+cjm1g=;
 b=gnGsptsKW/fTRPjpQCF4KWZrRZb5nkO/4to+CupKJQJtgcXm5Fye+jwDf8XOIIeuNz6kuiI5yzpI+Lic7PhIS9OnaU3gsbalYvnCEEJxXKCe+4vcNzzMQj84KpuMxq+KUVLq7/EzVjHnJMixLsXzj5B1bETWpOXwJJFrvSGFMmc9Y7mVaVb/RHtduTJ2sLSisBc9CC9mm5fofZvYoxZys25oDrkGQCZiMyBMWKPXJQdF8Tvd6h0lhsvtFQqOBY12O2xtmPzC661Re8n5z6e76Z3hbr0zqoKoc/vF6QcfnEPAcEPWLhUsKks+jmN0mJPdZLKaLOlqBjaTUTYAYY8igQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CH3PR11MB7321.namprd11.prod.outlook.com (2603:10b6:610:150::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.27; Wed, 30 Jul
 2025 18:28:44 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8989.011; Wed, 30 Jul 2025
 18:28:44 +0000
Date: Wed, 30 Jul 2025 14:28:40 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH v5 10/11] drm/xe/configfs: Only allow configurations for
 supported devices
Message-ID: <aIpkWIw3EAKVglLU@intel.com>
References: <20250729114215.177586-1-michal.wajdeczko@intel.com>
 <20250729114215.177586-11-michal.wajdeczko@intel.com>
 <aIk_4BBGSuIp19WQ@intel.com>
 <311dc290-d5fe-4214-b332-96337f3c80a8@intel.com>
 <91cb7b75-3fbb-4749-b048-de55a9599ada@intel.com>
 <aIpIu4UdcmVDCzur@intel.com>
 <4f3a7559-985d-4212-a4b1-6f6386375ca9@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4f3a7559-985d-4212-a4b1-6f6386375ca9@intel.com>
X-ClientProxiedBy: BYAPR02CA0047.namprd02.prod.outlook.com
 (2603:10b6:a03:54::24) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CH3PR11MB7321:EE_
X-MS-Office365-Filtering-Correlation-Id: 28d7eaf7-6a85-41be-a324-08ddcf96ea40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?38+yXEqN4Hqzu1FnW4RnoW8uFWbztIAMl0w4LAP2lea1jkORdJEWFzLK4F?=
 =?iso-8859-1?Q?GW0klto+HTDMaV7PAvNQKp9uTNeHHyNPWgHqtuvEMM4X3WNBcmFlA/Plxm?=
 =?iso-8859-1?Q?V3pctRosXVH3B0PB1AA4S4ym295s0VvOTfnHiM00zxZnsWh9cEQuOpWA68?=
 =?iso-8859-1?Q?iXruLTE2N1qgxhF7oy7zaYW6jDsaTJSyi8AVfgLvRtEOTErsaASSZdW1gl?=
 =?iso-8859-1?Q?7K365XvbJJJDwwdW2ocA5Zd54zYarCHeGohAdX8Dc4/UKKkTTYxc34d8Fa?=
 =?iso-8859-1?Q?4vhA3nXgEBtrS+gd0qb6TnfD+v6zrUvf6cuMh0spZMBB1+zFBh/K/c0PAk?=
 =?iso-8859-1?Q?vU7S8UySYDtEGLbqdwYs+PTtOLEUaxJLuY9LZ7ATLH6Dgt69p1ZgPJT6an?=
 =?iso-8859-1?Q?aQPUClVA8+zguFxbF0ekYgQVTsQGKHgFp/noqhPnYxA05wRIzefYt/jQ4I?=
 =?iso-8859-1?Q?ts+kC0O0lk3iQyt6Hwnt96OPRt4O1ARxZk1U5GScl1qJdNTguIcqAGGFPg?=
 =?iso-8859-1?Q?wc/akD7LX/9p0TmUFZ+72RPxgD4c3SYBDepmMFIpVmbVSb0lvVsETCoaoQ?=
 =?iso-8859-1?Q?5oVfaCemlzeH5eAeUiqc7W5JlV+rWW/nKXtAVCsRTGb4Z4RIaUMgnOpUbu?=
 =?iso-8859-1?Q?AYcJD4rvWyNorbKGVWmXq1ESdMI+5GqDgu6aMCSFyCOmju1BJ85cy8D3+7?=
 =?iso-8859-1?Q?S+d47oHiLQUsupzKJv3KAMvqwrxDHXGhfFza6S8nlHXxfiy0gvhrkHN8do?=
 =?iso-8859-1?Q?VZNekxFM+qvecQBy924wmhgAIQlfsRw5kqCTGNVTxbqQOaG0YrIU9ggMp9?=
 =?iso-8859-1?Q?tcBDIDvvjwBSBAGAAQVsYP+LWaW3gjv1lndEvYvoWONEK+CcepCiftECUD?=
 =?iso-8859-1?Q?STDy4rFANz9vTOX4Vo3DOdPCBYsMGrWb9AFNpUsnK/mDrc4dxXzmyYdBEA?=
 =?iso-8859-1?Q?ZJ9XYVPK0Gpq7biF0V5KpqH7vPk+AIUdKpht55S1St6a86ipiXN/VWYicl?=
 =?iso-8859-1?Q?73xaa1AAFlle05cC0vL/DZaAn+texjJMwiTJ6gXr8Nx+f7KRzBBwNiEW6f?=
 =?iso-8859-1?Q?UQ8zfu77xaHyjbkTS8tT59i/6iVxDg9Z7wceOFVoS29DFpYuuAlgc8GU5Y?=
 =?iso-8859-1?Q?gV2RhHfVky+UoPpD112TjB7rYAQsmI9LsjvM2pDswDE1SwaDxSfX55xFSj?=
 =?iso-8859-1?Q?OtJ/5GkRqobzpEpy77DXPCPiCVVI1lQ0T0XGDJ57ehcXPAMvo6KV9ZgZhK?=
 =?iso-8859-1?Q?RobAGB1oL+SmE2PkkyxRH2l61sMOrc9RoAO5IxXWWud8BcqHlAJ6eW9YSN?=
 =?iso-8859-1?Q?X8P4om2yBEhcFT6a+O4rqWBENDUDGleppbJN1iMKIzFw/lZBXoV1Zn2e7X?=
 =?iso-8859-1?Q?qlRYPxhaafLSW2datUfrpcaVb5KIAY5TnqMRde92/YltTA3O7V3sG+YM9t?=
 =?iso-8859-1?Q?wb4l1WAzKW9+F9dvtatxiVY8HnXI3Ef9aHSESA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?naRKB9o/sSBvq8xU/oIj/xp3jn3lfPYkLwKITs3q1vwVF55OShibQpMVV/?=
 =?iso-8859-1?Q?pTGvlv3GFn/PlO8l/8FDYITkByaWgDLyJknG7zS6E2sakfo3lhSg6oO05J?=
 =?iso-8859-1?Q?/0oYrr+Iv1n0zCFmt2O0xTWabxckz5s3zMI2A+3mivKS1jRxrm3wPBSC/h?=
 =?iso-8859-1?Q?he4gSF1lcahOIW60acrP4gG+ISDw2oel0tVRn9UCT2utoZkdcosP5QxZ4h?=
 =?iso-8859-1?Q?aQDeaaO2hV1MooxrDcWOe6mqLOa4MYRx0/G63mJyVGGXM853QIQzaixIZo?=
 =?iso-8859-1?Q?ofgppqR0UYt9tehY6/QNh2bQ6MZWOZDtBMeLf9mxAKylCzelajySZ43Ssi?=
 =?iso-8859-1?Q?Qag54mQOLsTMkN3hlCGtYlqKWXVXCZNq7bjmIfdmXpWAQMnS24LufQpg/h?=
 =?iso-8859-1?Q?Wc4SL90wxX4NsUWGe+08gS2BBRafCaPXkWwBcXhPzwTpFZdN6g/kiDe6jE?=
 =?iso-8859-1?Q?2U8lcRHrDEGLfXb76dH3/CHG2egVRFAWE5Nw1nTmwuFJlrF2JReiuipxBG?=
 =?iso-8859-1?Q?CEN+eOD+mcVVqcH+fKcJrqaXl9uElcwUY8i4Ki63NXmO6RCJubuDHVrXEY?=
 =?iso-8859-1?Q?vXSYXmWWquM/rYLiIlpKuindpcg8el7mWk72y5YAQueT98jK7XgrBtee7M?=
 =?iso-8859-1?Q?pYtuN1GMvLg11YrX8mq+0boxmGyTdw9huU+XCG6dgXNZuavGUUAHA/xRaz?=
 =?iso-8859-1?Q?hKJ1myHOczwblrxIG3NpoM3pyjPDjzTCoJILjRkqg/pOW4iPePR/LnOhEg?=
 =?iso-8859-1?Q?rBn4PgevKMMpt1TO/mcDrLP1kAUcWHixQiltvAdR2aNvHU23C6dWCyycDp?=
 =?iso-8859-1?Q?6r66QaT076h67Qswc9wj+6BVxohl/LRaEomQQnYpPzN0DX/OYP6YPsD97V?=
 =?iso-8859-1?Q?PN68vH1t3G/sHtz+SSLJGm7qKcDha7v2QaG229xZ4rLG6FALE4KTQSi84T?=
 =?iso-8859-1?Q?UiP6BaYm+r3PSyneTv5uekKb84bqbIbxk0+Kx8tSzSttibdMQwE6EmdTFI?=
 =?iso-8859-1?Q?7Nh1S1oipG8lNBcFurYbeF91LmTugw7lHsb1K2jWAd2s/wJUksw065/Mbf?=
 =?iso-8859-1?Q?TtkISFdU4mo1okg8hrf37+5aQ+ctz4Od/T8Wk0frwb3pZXPVqQEajyUuDC?=
 =?iso-8859-1?Q?b/PwjrMSM4TRnp9CV+NFAPOQ2zqFBUDRLv+/MoXn/8qfx/lSrnQihaAuZy?=
 =?iso-8859-1?Q?wzIdr/R7bqS2uB2QWjXcuUIp0gBwGrCSpaxBAVR5G6lQCRIIr+8bwmYBVH?=
 =?iso-8859-1?Q?0DndN1nTQYvCCEn9ULTkIny4JyuvufwpuEZuS+xxUw4fg1rfzYCpzjq8HV?=
 =?iso-8859-1?Q?HiRa9mxXVO2l2JLsYBgIvMCd1Fyxexx4aD0GIQWZO/dE1wVjv8eQ6FNU3w?=
 =?iso-8859-1?Q?zzYsE7gXGuYqWJWv1Kg5/R+fMqgUxFHs8MH/7Cudc74TSbhm6cpa8J/s7+?=
 =?iso-8859-1?Q?2pEMZZX+3K1EtHcPnHz1rmi+LeGw0VzKu9yG/oo8vmfhFiC5rH2H8z0nOs?=
 =?iso-8859-1?Q?NAkRSUmj9VwfnPNP+55Vv/OQuF2j4xi96i6PCpbG851tiZSjEATDKGaca6?=
 =?iso-8859-1?Q?n4UJlicYhc0TjnpaRGbUntBO1j/xEsBR9+bS6CbHvTcF9eCAOmqJ0TxZZz?=
 =?iso-8859-1?Q?ECpb2gUH43g48MNWZ4VbhAKsDZ4SStmz+NIbesn1hi+uv1AIs+v8bbnw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 28d7eaf7-6a85-41be-a324-08ddcf96ea40
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 18:28:44.1416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vaKiFz0if3nenYsmKiLW0bizX6w++fNlZmHrmqPaVo5E/uObKAXiQjubF/zNKfNM07FJyRlnlssxA1dgX7sePw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7321
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

On Wed, Jul 30, 2025 at 10:12:06AM -0700, John Harrison wrote:
> On 7/30/2025 9:30 AM, Rodrigo Vivi wrote:
> > On Wed, Jul 30, 2025 at 10:23:22AM +0200, Michal Wajdeczko wrote:
> > > On 7/30/2025 12:20 AM, John Harrison wrote:
> > > > On 7/29/2025 2:40 PM, Rodrigo Vivi wrote:
> > > > > On Tue, Jul 29, 2025 at 01:42:14PM +0200, Michal Wajdeczko wrote:
> > > > > > Since we already lookup for the real PCI device before we allow
> > > > > > to create its directory config, we might also check if the found
> > > > > > device matches our driver PCI ID list. This will prevent creation
> > > > > > of the directory configs for the unsupported devices.
> > > > > > 
> > > > > > Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > > > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > > > > ---
> > > > > > v2: rebased
> > > > > > ---
> > > > > >    drivers/gpu/drm/xe/xe_configfs.c | 17 +++++++++++++++++
> > > > > >    1 file changed, 17 insertions(+)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> > > > > > index 5f145ccdf535..766775772eef 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_configfs.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_configfs.c
> > > > > > @@ -275,11 +275,22 @@ static const struct config_item_type xe_config_device_type = {
> > > > > >        .ct_owner    = THIS_MODULE,
> > > > > >    };
> > > > > >    +static const struct xe_device_desc *xe_match_desc(struct pci_dev *pdev)
> > > > > > +{
> > > > > > +    struct device_driver *driver = driver_find("xe", &pci_bus_type);
> > > > > > +    struct pci_driver *drv = to_pci_driver(driver);
> > > > > > +    const struct pci_device_id *ids = drv ? drv->id_table : NULL;
> > > > > > +    const struct pci_device_id *found = pci_match_id(ids, pdev);
> > > > > > +
> > > > > > +    return found ? (const void *)found->driver_data : NULL;
> > > > > > +}
> > > > > > +
> > > > > >    static struct config_group *xe_config_make_device_group(struct config_group *group,
> > > > > >                                const char *name)
> > > > > >    {
> > > > > >        unsigned int domain, bus, slot, function;
> > > > > >        struct xe_config_group_device *dev;
> > > > > > +    const struct xe_device_desc *match;
> > > > > >        struct pci_dev *pdev;
> > > > > >        char canonical[16];
> > > > > >        int ret;
> > > > > > @@ -297,8 +308,14 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
> > > > > >        pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, function));
> > > > > >        if (!pdev)
> > > > > >            return ERR_PTR(-ENODEV);
> > > > > > +
> > > > > > +    match = xe_match_desc(pdev);
> > > > > > +
> > > > > >        pci_dev_put(pdev);
> > > > > >    +    if (!match)
> > > > > > +        return ERR_PTR(-ECANCELED);
> > > > > why ECANCELED instead of ENODEV?
> > > > Or EINVAL? This is for when a user has created a directory for a PCI device that exists but it is not a Xe device? Seems like ENODEV is not the correct option given that the device does exist. But ECANCELED also seems odd.
> > > we can always return -EINVAL but user will have no clue what went wrong
> > > 
> > > so the idea was:
> > > 
> > > -EINVAL     when config directory name is malformed
> > > -ENODEV     config directory name is correct but
> > >              there is no such device under such BDF
> > > -ECANCELED  when device exists but it is not covered by Xe driver
> > > 
> > > since you both don't like -ECANCELED for this case, what about:
> > > 
> > > -ECONNREFUSED /* Connection refused */
> > > -EOPNOTSUPP   /* Operation not supported on transport endpoint */
> > > -ENXIO        /* No such device or address */
> > What about -ENODEV, but with debug messages to differentiate the cases?
> > 
> > Otherwise -ENXIO seems the best of the alternatives here.
> I'm confused by what is wrong with EINVAL. Are there many other paths that
> can return EINVAL for this operation? If not then how is any other return
> code any different from a user confusion point of view? But yes, I think at
> least a debug message to say "requested device is not supported by this
> driver" would be good.

to me it looks more like a 'no device' than 'invalid device', hence my
thought on the enodev, but no strong/hard preference to be honest.
and we are definitely on the same page that there
shouldn't be nothing wrong with reusing the error code and printing the
debug message like 'requested device is not supported by this driver'...

> 
> John.
> 
> 
> > > > John.
> > > > 
> > > > > > +
> > > > > >        dev = kzalloc(sizeof(*dev), GFP_KERNEL);
> > > > > >        if (!dev)
> > > > > >            return ERR_PTR(-ENOMEM);
> > > > > > -- 
> > > > > > 2.47.1
> > > > > > 
> 
