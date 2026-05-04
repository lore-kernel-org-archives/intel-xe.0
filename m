Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8844CD3427
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 19:04:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 788AF10E78C;
	Mon,  4 May 2026 19:04:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ssj9pb8Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FE5F10E78C
 for <intel-xe@lists.freedesktop.org>; Mon,  4 May 2026 19:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777921461; x=1809457461;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:content-transfer-encoding:mime-version;
 bh=v2iOeeSRnGd1nVfiIjvOvfZTyiZkKXfbaUnDWRj5ycc=;
 b=Ssj9pb8ZtbCK+Lgm3Jb9qPuOOUbDNUYpjxAgDVKNAgRzyHSMjDYHB6Rv
 7nfrGT71iaBg2VlTe3TN74PCQqGF3sRiTscwfLWLeBnBDtTVLMO7fBqj9
 fgicxIeCTIVUdvN5QLXbAVcOeQBALxEp9gRdBlxfb34GQIMFBgiyCzSXA
 Ed527YKEndpvegYVagO8B2DDDAgWhAZY5Hc4HaMKxD+e3YJPUa7avWv7Z
 zryDITjXIYwYvbHqOOZMp3WoWZtzcR1pm6RkKKJYj0LC+hGbqrpkHnV/5
 ngQVRg6paPJWlhUmfVDuTSgLnCINkusZ3LlP9gpucbwUQX5ugi/oIhKwt g==;
X-CSE-ConnectionGUID: i68t/JR6QEiDa3Q6N+XKhg==
X-CSE-MsgGUID: VXRkuCIITbSwS1l72rSFFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="82653096"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="82653096"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 12:04:21 -0700
X-CSE-ConnectionGUID: revkbPUuT6i0YA1TTyzLhg==
X-CSE-MsgGUID: 70NppPujR+GXVf3U67N6ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="237366822"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 12:04:19 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 12:04:18 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 4 May 2026 12:04:18 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.41) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 12:04:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T63vnEmcKtDkGv+vB0m6NDN+FMH/hsqieT+84VuAbFeG54Ucdodbg5jzaz31341RGc0lHZ47MwCQlJVkrnm/k/JENy8UXOyPyPN3+w0PxtxoPZoEdlpM69yk1TMucam5KVS5CwRVogv0Pvi6gClD/NzwLFZQEtHNAWtGTdhcLdB+AconYyDNyzCHY1GtQffafwgm8XuxFQ7nle88qL3EyHEUu/eLJoNTnU7azsGYmZ2UEubbPr++RlJsaM89PqqSEmOYZwen80ge5G0IjAbyK0/ulh0xJ6oDsypMz/3DZGUcwoDKUhHODCGO57cj7BOBPLUHconAmxxdCdwZREcLqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lackvY41boVSnTe3hqQt6sabJekcJKk/DYaV0Nbey5E=;
 b=XvhC1MoNyBrIfA8GJhTd/pjia7J9TDFVYO1BSmqFRo6GyFfef/LVTxX1TV45xKD3DmcaSO99YsNuXPE0tdIAfVbMFsUs+yDd8+8T6jqK8e3fbTY5wLI+EtWcQEXRxqFz5BpSTvUz/I3fR2OzKYb2CbciZo16Gw5VZfrKxp/ucFHHoDC9IPEjGmjnhm4hAfZFM33AGEy4cad+HqbADYFXt44WLiF1ksyDFhg+FY4jlBwWQe2EKAP8C6e2Y51g+1OxrgpP38YMhMTfs3vQE7Hef7nhLm5dlaayecde2UyKzpkVDSbkUtexV5vbQiK8ppEi/ouzCvSEPriN1xqTNRuORw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DS0PR11MB7903.namprd11.prod.outlook.com (2603:10b6:8:f7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 19:04:15 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 19:04:15 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>, "Wajdeczko, Michal"
 <michal.wajdeczko@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH 4/9] drm/xe: Add a new debug focused configfs group
In-Reply-To: <dede21f05cac6e683c4f001a8cc31b883ba2810c.camel@intel.com>
References: <20260504044348.209625-1-stuart.summers@intel.com>
 <20260504044348.209625-5-stuart.summers@intel.com>
 <875x53dvvo.fsf@intel.com>
 <0579da16c8a003849b608d29ea37b3f86a9ddc17.camel@intel.com>
 <873407dqxw.fsf@intel.com>
 <dede21f05cac6e683c4f001a8cc31b883ba2810c.camel@intel.com>
Date: Mon, 4 May 2026 16:04:11 -0300
Message-ID: <87zf2fc7ys.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0PR03CA0160.namprd03.prod.outlook.com
 (2603:10b6:a03:338::15) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DS0PR11MB7903:EE_
X-MS-Office365-Filtering-Correlation-Id: d882b103-08f2-4a7a-2069-08deaa0fef86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: RqXDd9+F0xVp+lPus6ahdZT/iImUSXZpsiqw9A4we96DF7cVPckmsfYz/QUphN/ytVtnP1Bjuz9poIXbOll9WJZDZYOFbMRCPuRS303heqdhbLBn+Rjy1qMQSjjTeh67kz9hveGdNdJnKXs44z0GVfe9HdLVS8SPl/T2ZFVhdedPe6gVtq/GDWjvUNcSZnpENuFBxyFtxka4WArD1jZK8aBZradTIBzzO0kJTKisv9N4XSq+5sNQaoPFxuGebT12P3fAN2hJyg2eFuxi/hQBl6awadxhHm+spo9gtQZ+HRiRThc/2Lx5s2C/fRsWnvvOGhE0Ny7iLaAoFH/uS29jqdWc+i1gKfnmn/2C43cujKAHqbHu/ngHcey884MlgYCfjh/V/f+NNuDzutX/K5di0CoJsKmnqIy2U4tCvAjv87RRhzG5y8SPPeSeC1GnBJIym0CD+zx3B1wXh3RcG/k+dKG5ywZVaXBiHqqdyP+lqOzwqcDik45JnQxtWkqXj/iYJdwZOvWSRGw6vfVUup+edWyM/kT0IxfmDN2Tpa+T52UMElEX+1ZXnf7eHX4g0C19G6oN4R/GWYlHVbThshzJhf1toGJkw8ZW/Br4ySkkI5Y0pUJzaiV36M63jGiP5qq6rDbeRjnfO+jmEv4ncM+wUvn9oBmbn0wOa4SjaMA4vO5aKkxE0RFH7zrqRMc2JXhW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmxOY2NFM211UXRLeDJpTFczRHpwYk1GK25uSCtOWE9CS1Vlc2JkczBhZHpL?=
 =?utf-8?B?TzRWL2R3VG9Ud1dOZnVMZlVxV0hIZUY4Mnk2RG9seVpxSlVITm1Qb3pBN0tu?=
 =?utf-8?B?OG9VRFRTVkFtd2lWNnQ3YmthOXF4YVhNbkgwVHpJWHZZRSt2WUl3ekpUVkF1?=
 =?utf-8?B?WU9rVGYwWUlKZ2ZUVTNzbzdFbWZHQnp2V2wwMTlUQTh4V2NDTkUwNUxqL1Nq?=
 =?utf-8?B?WUgzeHlzVGozbWlXa1BXM0lWYUp2Zi9jKzliY3NiZlNXRXVPZWRTVnVySnpH?=
 =?utf-8?B?OGttL050Z2pONHgrNmJMeTlnSkFzdCtuc2tod2E3Q3p1VUZyeUR2aGxWc0Y2?=
 =?utf-8?B?eE94Z0tnWTJjU3FrTjVzUnd3MXFDUDBKQTFTRS9SWGcxVnFxTmRmY1FpcGJ1?=
 =?utf-8?B?OTlKWk1MUlFsQ01kL0l2QWNQT0lOb2pmdS9wR3lGTExHVWdpd2o5TS9hTGYr?=
 =?utf-8?B?YjlMTFRKNmU2c3VoTVUzVXJVQyt4eGlYU3ZZZ1J4RVRtdUJiRHB2WWF5a29I?=
 =?utf-8?B?dXhjamdYUmN4bW1oRGtzc1N6RnU5WjRBcmpYVWNmSDJBaElNWmZSWWN2eDdT?=
 =?utf-8?B?aVUranNHY3JoN1dhZHA1dkE4bnZ6MVVrbXRzUVViWkE2T0hub1g1S2VVOVQ2?=
 =?utf-8?B?MlpmVEszZDBYVTRtRUptVVk2V1JaWEIzWHl3VUFibVVjU1RZaXNnUk41dHQv?=
 =?utf-8?B?c29vbCtldWc3M1gxTVNkMTFzWjJYMUxOWnN4OFZMTFA1RlhyU041WmVCUldy?=
 =?utf-8?B?bzFub0N2Mkg2YnNGKzJvQXZjbDlZU2hVbGNYSWw2Z0h5OSs3WjRZUE9hL0hN?=
 =?utf-8?B?a0YrMjJjaUdVdUVuWjM5U1h5SG9EY0hrKzNkRTVld0dONFFVY3BvTTJLSHh6?=
 =?utf-8?B?eFpsWGlBcEttVGw5cU5iQ1dlcVZFV3pzMHRMLzQ5aDJSL3RHNXNibUJZVFpJ?=
 =?utf-8?B?U3VFdlFuakgwSGlTNE5TeXd2Sm9kMi9INGwrdDhxenN0bThMKzNqK0VhRjVE?=
 =?utf-8?B?SVB0SHhBdVdyODU2U2FMYkxvL0k3L2V6WkZrYm1YWGNJQU5zM2gxdXZpQllt?=
 =?utf-8?B?d21jcXlLYktsWEdSeEUrdTFsY3BXeWtFNFFmKy9UWnJsZ01zWjFyc1V2TUNC?=
 =?utf-8?B?bDM5M3lTanlBWlZwSkZwNmdhd0pxbHRaQ0p3bkVqblU4TnlNUHZQRE81M0s4?=
 =?utf-8?B?dGtKc2JYTHI5d2RtWks4Q3VUVHdQb1BnL0hvSTVLWWxtYTdHSmkvN2M1YlU1?=
 =?utf-8?B?TDh1Rk9qMTM2N3JpL0hjU21zRDREMHc5RFVOMFJsQktPUm4vWjN6U3BDMm00?=
 =?utf-8?B?dnlzZ3E5WE1rVWsrNStieGdJOEpWcUUzcHJJcnU0MzlZRVBwNmVtQmR5WFNz?=
 =?utf-8?B?dm14MnZjSWdDTG9Wd1hvbXlEOHFPVVhsZlB0anZMREVWV1BOOUgxYUZBOXJ3?=
 =?utf-8?B?eEFORGQzRkRJVFR1L043OVkvOFBaN0J6YXVuRkxpQlpBaE1LL2ZXTCtIdlRT?=
 =?utf-8?B?M2x3R2hza0dKZlRFclBzMkdXalV6dTI3azJNQXNobmRNbXVQazFGeGNydXFh?=
 =?utf-8?B?dHh4YnZBcDdPODYraTBsV3NockpkMHRaT0hmMzJNR2tGZjZFelp0a3lKQUNW?=
 =?utf-8?B?RFFJRUZrMUJmS25SbGMyeUNPb0o3Zk91QmZnKzEzRWxFM0t5NEs1WjB4Ryti?=
 =?utf-8?B?YXo3M0MzYTZCVVBlbENQcVp4MCtPUi9nZ3RRQ0ZYRVI3ZFlwckZMelpyUGFr?=
 =?utf-8?B?Nm1WYkN5TG1pMnd3UWxDMUdoVG9xYnpmQnlTR1VpNlNNeUJBNjZvRm9uQlRi?=
 =?utf-8?B?SGNzbTJFL2RadlBkeTNFakp1bkpuekxTbU01RjkxR0FmMldFaVhra1RlR0NF?=
 =?utf-8?B?R1NNVDg4NURFVWhiM2FpZm5mSUFDWTg2L3ZLU2JLMStoTEdVZHZEVE9kM2Vw?=
 =?utf-8?B?YWRlSDJWK1hMNTF6VUhWVnhvMy9XZG84YUQ5RHR3ZU9IR21kbGZFMy9RMTV3?=
 =?utf-8?B?UlRqSFFGTVpsei92OG9qaGh4bi9nWGxBZGl6Qnd3aXdEampraFhxdWZ5SjZP?=
 =?utf-8?B?bFJ3bExRcGlDek5YZDVnaXlDa21nSnBzVUlhdlRqNGw0MGI0SmduQzBNT05x?=
 =?utf-8?B?R0ZIMnBUZ2ZkNVp1Zlc0R1pVNzJJY0hTWFl3Z25sTlBGZmhGMG5vTW1JU3hX?=
 =?utf-8?B?SlFuREloQVlhemNkRXZhdXlWUkcxSTZhSzNNNDlYUmMvTkdMNEc2TDdkSTVQ?=
 =?utf-8?B?dGNqMWZVTG9nT3lkbU8vZGRQWkJIQWNEaDlXNFZob1RBQVpDSFlsVDZsYnUz?=
 =?utf-8?B?U0J0Wkhnb1U2bWwrSWkyRTBqZlNOTk1nTktyeStOcE9YSkN2TzJldz09?=
X-Exchange-RoutingPolicyChecked: ZYsjP4oEeP12HR1QocYZE8hr/LuxwUV0N/ToBfY18n5Vb1a/ZPFk4Qy3VWc8Vg7c0+To1N93/VIGRI1tPUZbgbL2/qB8i4tZqkfAeh9kd9Slpy54esMBglHJzswDYfKDD+jt+wM8OBGWv5RN0aihf8e+hzL6sGIKYdQ8/4QW0BZPbGF7n+C7Ry9ok3zskw6zZkk+dzFlf9VHGQVLmoX0yq3QFhUC2/H6/xdPSdkCWUSqc5BFqedq/L+lxhaCM2AvJjjXOVrjLcMMFM3fqX8ofp3bpEsEEfIL47lqLcIbY62lwzO0xstQ+DAVnSeOqVMVaGNo/7+jJsUmYwOj12SCag==
X-MS-Exchange-CrossTenant-Network-Message-Id: d882b103-08f2-4a7a-2069-08deaa0fef86
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 19:04:15.6449 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4FAwicK3p3RMHu+6gomutuuvuZFukVkCzPPzK3FbbhFwOlJdV1xKO7/3XUStTCRX4aER4YrBOMyKJb/NYiZ3iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7903
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

"Summers, Stuart" <stuart.summers@intel.com> writes:

> On Mon, 2026-05-04 at 14:28 -0300, Gustavo Sousa wrote:
>> "Summers, Stuart" <stuart.summers@intel.com> writes:
>>=20
>> > On Mon, 2026-05-04 at 12:42 -0300, Gustavo Sousa wrote:
>> > > Stuart Summers <stuart.summers@intel.com> writes:
>> > >=20
>> > > > Add the skeleton code for a new debug specific configfs group.
>> > > >=20
>> > > > Signed-off-by: Stuart Summers <stuart.summers@intel.com>
>> > > > Assisted-by: Copilot:claude-opus-4.7
>> > > > ---
>> > > > =C2=A0drivers/gpu/drm/xe/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 ++
>> > > > =C2=A0drivers/gpu/drm/xe/xe_configfs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 4 ++++
>> > > > =C2=A0drivers/gpu/drm/xe/xe_configfs_debug.c | 14 ++++++++++++++
>> > > > =C2=A0drivers/gpu/drm/xe/xe_configfs_debug.h |=C2=A0 8 ++++++++
>> > > > =C2=A0drivers/gpu/drm/xe/xe_configfs_types.h |=C2=A0 7 +++++++
>> > > > =C2=A05 files changed, 35 insertions(+)
>> > > > =C2=A0create mode 100644 drivers/gpu/drm/xe/xe_configfs_debug.c
>> > > > =C2=A0create mode 100644 drivers/gpu/drm/xe/xe_configfs_debug.h
>> > > >=20
>> > > > diff --git a/drivers/gpu/drm/xe/Makefile
>> > > > b/drivers/gpu/drm/xe/Makefile
>> > > > index 09661f079d03..b58667b0b18e 100644
>> > > > --- a/drivers/gpu/drm/xe/Makefile
>> > > > +++ b/drivers/gpu/drm/xe/Makefile
>> > > > @@ -161,6 +161,8 @@ xe-$(CONFIG_HWMON) +=3D xe_hwmon.o
>> > > > =C2=A0
>> > > > =C2=A0xe-$(CONFIG_PERF_EVENTS) +=3D xe_pmu.o
>> > > > =C2=A0xe-$(CONFIG_CONFIGFS_FS) +=3D xe_configfs.o
>> > > > +xe_debug_configfs_obj-$(CONFIG_DRM_XE_DEBUG) :=3D
>> > > > xe_configfs_debug.o
>> > > > +xe-$(CONFIG_CONFIGFS_FS) +=3D $(xe_debug_configfs_obj-y)
>> > >=20
>> > > What are the downsides of keeping this available for non-debug
>> > > builds?
>> > >=20
>> > > I imagine that the debug configfs could be useful for someone not
>> > > involved in kernel development working together with the
>> > > developers
>> > > to
>> > > debug issues without needing to rebuild their kernel.
>> >=20
>> > So the focal parameter we had in i915 was enable_rc6. Something
>> > like
>> > this is what we explicitly don't want to expose to a general user
>> > as it
>> > can have unforeseen consequences (like having very high power
>> > usage).
>> > But, having the ability to disable rc6 for debug purposes as a
>> > developer is extremely useful at narrowing down certain types of
>> > bugs
>> > at the hardware/software interface.
>>=20
>> We could probably keep the debug stuff available but cause a taint if
>> they ever get used?
>
> So the tainting is really just for our CI I think. This won't
> necessarily impact end users - at least on the client side - who might
> just ignore it (or not even notice it).

I *think* tainting is not only for CI (someone could correct me here).
I see that our driver adds a taint when the user is applying some
parameters (module parameters or configfs) that alters the "officially
supported" behavior of the driver.

Some examples I could find are usages of module_param_named_unsafe() in
the module param front, and setup_configfs_post_ctx_restore_bb(),
setup_configfs_mid_ctx_restore_bb() in configfs.

>
>>=20
>> The scenario I had in mind is someone who is not familiar with
>> building
>> their own kernel working together with the development community on a
>> hard-to-reproduce issue and some of the debug configfs attributes
>> being
>> useful to gather more relevant data.
>
> Yeah but IMO we really should be able to instruct such a user how to do
> that - the steps there aren't too difficult if they're already
> installing kernels etc.
>
> A lot of our debug hooks are already held under various Kconfig options
> anyway like DRM_XE_DEBUG, DRM_XE_DEBUG_GUC, DRM_XE_DEBUG_VM, etc. And a
> lot of the information under those Kconfigs are also critical for
> different debugs.

Are those due to performance or resource usage implications if they are
kept enabled?  If so, is this the same case here?

>
> I'd really prefer to keep these under DRM_XE_DEBUG (or some other
> Kconfig) if possible so we can maximize the ease of adding new
> parameters as specific debugs come up.

But why would keeping them under a build flag make it easier to add new
parameters as opposed to always keeping the knobs available for use?

--
Gustavo Sousa

>
> Thanks,
> Stuart
>
>>=20
>> --
>> Gustavo Sousa
>>=20
>> >=20
>> > That's just one example, but there are a bunch of things that could
>> > fit
>> > this category and I expect we'll have even more use cases over
>> > time.=C2=A0
>> >=20
>> > Right now we have to hold these types of changes in a side branch
>> > not
>> > exposed externally and I really want to converge our processes so
>> > we
>> > can more easily make these kinds of changes and let us debug
>> > directly
>> > out of drm-tip.
>> >=20
>> > >=20
>> > > > =C2=A0
>> > > > =C2=A0# graphics virtualization (SR-IOV) support
>> > > > =C2=A0xe-y +=3D \
>> > > > diff --git a/drivers/gpu/drm/xe/xe_configfs.c
>> > > > b/drivers/gpu/drm/xe/xe_configfs.c
>> > > > index 12b7fe65446d..85df8ce5cf2a 100644
>> > > > --- a/drivers/gpu/drm/xe/xe_configfs.c
>> > > > +++ b/drivers/gpu/drm/xe/xe_configfs.c
>> > > > @@ -1006,6 +1006,10 @@ static struct config_group
>> > > > *xe_config_make_device_group(struct config_group *gro
>> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0config_group_init_type_name(&dev->sriov,
>> > > > "sriov",
>> > > > &xe_config_sriov_type);
>> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0configfs_add_default_group(&dev->sriov, &dev-
>> > > > > group);
>> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
>> > > > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0config_group_init_type_=
name(&dev->debug, "debug",
>> > > > &xe_configfs_debug_type);
>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0configfs_add_default_gr=
oup(&dev->debug, &dev->group);
>> > > > +#endif
>> > >=20
>> > > I guess there isn't much we can do about it today, but, based on
>> > > what
>> > > I
>> > > read in configfs documentation a while ago, I suspect it wasn't
>> > > really
>> > > designed with arbitrary hierarchies of config items in mind.=C2=A0 I=
t
>> > > would
>> > > be nice if there was an API for that though.
>> > >=20
>> > > Basically, a config group is expected to be a directory to
>> > > contain a
>> > > set
>> > > of config items of the same type, which is not the case on our
>> > > current
>> > > usage (i.e. the "sriov" and now the "debug" group).
>> > >=20
>> > > I guess we are able to get our desired behavior (basically just a
>> > > subdirectory behaving as a config item) by not implementing the
>> > > "make_item" hook.=C2=A0 Not sure if that's an expected use of the AP=
I
>> > > or
>> > > if
>> > > that's more of a hack on our side and could come back to bite us
>> > > in
>> > > the
>> > > future.
>> >=20
>> > Hm.. ok that's good feedback. I do like bucketing these in groups
>> > and
>> > subdirectories. It also makes it easy to show or not show based on
>> > the
>> > Kconfig. But let me go through and make sure there isn't something
>> > more
>> > suited here. Happy to hear any other feedback as well here.
>> >=20
>> > Thanks,
>> > Stuart
>> >=20
>> > >=20
>> > > --
>> > > Gustavo Sousa
>> > >=20
>> > > > =C2=A0
>> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mutex_init(&dev->l=
ock);
>> > > > =C2=A0
>> > > > diff --git a/drivers/gpu/drm/xe/xe_configfs_debug.c
>> > > > b/drivers/gpu/drm/xe/xe_configfs_debug.c
>> > > > new file mode 100644
>> > > > index 000000000000..45617282cec5
>> > > > --- /dev/null
>> > > > +++ b/drivers/gpu/drm/xe/xe_configfs_debug.c
>> > > > @@ -0,0 +1,14 @@
>> > > > +// SPDX-License-Identifier: MIT
>> > > > +/*
>> > > > + * Copyright =C2=A9 2026 Intel Corporation
>> > > > + */
>> > > > +
>> > > > +#include <linux/configfs.h>
>> > > > +#include <linux/module.h>
>> > > > +
>> > > > +#include "xe_configfs_debug.h"
>> > > > +#include "xe_configfs_types.h"
>> > > > +
>> > > > +const struct config_item_type xe_configfs_debug_type =3D {
>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.ct_owner=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D THIS_MODULE,
>> > > > +};
>> > > > diff --git a/drivers/gpu/drm/xe/xe_configfs_debug.h
>> > > > b/drivers/gpu/drm/xe/xe_configfs_debug.h
>> > > > new file mode 100644
>> > > > index 000000000000..01170dc2f97e
>> > > > --- /dev/null
>> > > > +++ b/drivers/gpu/drm/xe/xe_configfs_debug.h
>> > > > @@ -0,0 +1,8 @@
>> > > > +/* SPDX-License-Identifier: MIT */
>> > > > +/*
>> > > > + * Copyright =C2=A9 2026 Intel Corporation
>> > > > + */
>> > > > +#ifndef _XE_CONFIGFS_DEBUG_H_
>> > > > +#define _XE_CONFIGFS_DEBUG_H_
>> > > > +
>> > > > +#endif /* _XE_CONFIGFS_DEBUG_H_ */
>> > > > diff --git a/drivers/gpu/drm/xe/xe_configfs_types.h
>> > > > b/drivers/gpu/drm/xe/xe_configfs_types.h
>> > > > index 935097aafa96..c9d94a3c26a7 100644
>> > > > --- a/drivers/gpu/drm/xe/xe_configfs_types.h
>> > > > +++ b/drivers/gpu/drm/xe/xe_configfs_types.h
>> > > > @@ -24,6 +24,9 @@ struct wa_bb {
>> > > > =C2=A0struct xe_config_group_device {
>> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct config_grou=
p group;
>> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct config_grou=
p sriov;
>> > > > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct config_group deb=
ug;
>> > > > +#endif
>> > > > =C2=A0
>> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct xe_config_d=
evice {
>> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct wa_bb
>> > > > ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
>> > > > @@ -56,4 +59,8 @@ static inline struct xe_config_device
>> > > > *xe_configfs_to_device(struct config_item
>> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return &xe_configf=
s_to_group_device(item)->config;
>> > > > =C2=A0}
>> > > > =C2=A0
>> > > > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>> > > > +extern const struct config_item_type xe_configfs_debug_type;
>> > > > +#endif
>> > > > +
>> > > > =C2=A0#endif /* _XE_CONFIGFS_TYPES_H_ */
>> > > > --=20
>> > > > 2.43.0
