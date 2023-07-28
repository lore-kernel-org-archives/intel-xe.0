Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BBB4C001DF
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jul 2023 14:27:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34E4610E703;
	Fri, 28 Jul 2023 14:27:43 +0000 (UTC)
Received: from mgamail.intel.com (unknown [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2059110E703
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jul 2023 14:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690554461; x=1722090461;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tA/P9TspCyz5S6q3nh8avCb7veQjt+prvWI6qrlY4Tc=;
 b=eg0kjKHvB9oiOlXErhyY6Crt80wDH16qbpmDY3+7jOQ5fyTFEpVVH5Tl
 CDaBOGerFx1fdL0zQS86n639RaY58cO/E5eYMvlXyqPlIDV5pMfEHNlYe
 p2yCGhQRHo4aH/M3+Y9BF+imiEVw3AJhwzq1M1ys2BseAmhsHLp7rG1iY
 EN7afJBy6AtcJ/iFPiYWPS3XJ4Se/7aJuv+n+JVSEdOPRQFEaYtivfX1S
 g81Q4SKS0h6Xycexjcm+FeLKn3zeGzfDjKsLtfWziTlwn/no1tMyz0FW9
 /pVhEpUmSdbMspPi+o1TD9ub7gyNf93IeYjU3XxT0dZi+tOOQXbScotJ9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="371304707"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; d="scan'208";a="371304707"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2023 07:27:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="730775308"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; d="scan'208";a="730775308"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP; 28 Jul 2023 07:27:39 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 28 Jul 2023 07:27:39 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 28 Jul 2023 07:27:39 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 28 Jul 2023 07:27:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d+HHtAm8pwqcqlI+WVOg+XIhidiJD++fmmg+k9PpKAK8/9Z0+UKPd3De3o29apCPTPmnA5KKCKCJfuhjvFjzHg0PORXTiRIHTCLVd1sYgDT3fWb3w6OEMSuOlrSx0hnSyr/r66PBroiiu+4jRtOl99y5/Lr9y8PrwHMtMUeb4XX8TOkTGqC4f92n6AnlRokaNzst/MJz8ZMtVNKWnWyqnAZ686/yLLWq7WAs7o2AwMYjoC8eILw8QnDwhihos+glTU2oQlDgR7SViNTmezjlvgFb+uH6DtRveec5vPj77mDL2pVGWIfdDOLZPCEVKX6h7LFYNak4ZDckw58hfXlO8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xNa9Vc97HzUXWPNV/huRNIBjJp5z7LG9CwmGEQpjEGE=;
 b=bmkrk3Rs/nXzqktcVjA/S3BPOxGUi69PAOHY5wvy18SByJz8vJnROycYVJ7hX8eBLNxCra2QJQfGAKXm6DYHiCT5BhtLyA6eLO+QcY9D4/4JRs1rI9wizmJLwwSmvZsURGlt4p65CKqqoS43r5eOqd+2smBb0WKGU77oVAJh1GsnL093ZGYbzbzq+6xuCpT3rkaRMmnzHB+cw42BxpRJY20wugL/KCXLDfqPnpi9F5oa+YjQ9afoOtYbmZ8+7eU8aJMTowslMiAUEhe94qbf8MBFFg0iZLV1YVLy7VZ8UnxwyT5w9nKPCRT4DUtmuLZezWD7c4ckpK24BW7uO45wkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by CH3PR11MB8564.namprd11.prod.outlook.com (2603:10b6:610:1b1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 14:27:35 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::1a96:db0e:58b5:123c]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::1a96:db0e:58b5:123c%4]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 14:27:35 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
Thread-Topic: [PATCH V9 6/6] drm/xe: Add min/max cap for engine scheduler
 properties
Thread-Index: AQHZwGKel9GdYyOvlEC4e+S8iukGt6/NvMCAgADe1oCAAAW5AIAABISAgAASDoCAABItgIAAc3wAgAAAqOA=
Date: Fri, 28 Jul 2023 14:27:35 +0000
Message-ID: <SJ1PR11MB62044D599FEFC3B5E5F7D1F28106A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230727082235.905240-1-tejas.upadhyay@intel.com>
 <20230727082235.905240-7-tejas.upadhyay@intel.com>
 <ZMKMuWeQBXsSo2Sb@DUT025-TGLU.fm.intel.com> <ZMNHp1f+wwyd9ZTB@nvishwa1-DESK>
 <ZMNMdIXaJrm4RKGJ@DUT025-TGLU.fm.intel.com>
 <SJ1PR11MB62041E3422EBC2A5D9ABC05C8106A@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <ZMNfY83ZteSxWk3w@nvishwa1-DESK>
 <SJ1PR11MB62044364227D86A702DE966F8106A@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <ZMPPgsfu+W2HzRcF@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZMPPgsfu+W2HzRcF@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|CH3PR11MB8564:EE_
x-ms-office365-filtering-correlation-id: dad3f941-dd1d-48b6-ed78-08db8f76c9bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ArU8zRJwe45hZRDBA/bqv9fwmBromf0vHIQEK8PoeabypornC8iJ7T5X8rSGKDTYrZ4H4psssVLWVuW6WIZnHdxDrLWiGrMFougmTzfe2Ghi/hYQo9ngAaKF3IMup8hdNnmy3NiXq7UDXcMvnMNp30SgW0VfFTC/OXGo6r4GS3263tzCQ31syhQkDPDWEmisFwMSszvA/RAvfT1cCeUP3Hlw/0JsZrj01mvfs1CduGuHrjoWQ8dQO7Kz6tvV+fxRkBrmitgPjlSsnqXfpUGcfZamwXBNqBSiUBC8d/L1vQvsTcHKa6xw3iNtgTH1V8o1weQsZsRdxkYTU+5fitAlEKCV7gTWRp55exiLAcV66J+xnH2qhHsSU4jABV3cpM5mNRB1uBPrmA1J7DkIh6mHRN3OFgNYUSyB+wuGVZWprhtzcwF74YWZ/CJ0pbS4kQI7vDQQ/iZHDN1zBn4O3Y5sbvHR7c2LwH8zxTdX0dlTgo+4Rm+KA2mxehNpxkpeddPtq7h5bDgwO6zzkqQHZIeA6dDpMeDBRnLzVXXIkxrbla0STzSOMYE7E5Hps71kpvOYIPms9nqKvzaUeNxEnyDPbBncSHhYdFvdKQtFrco/gRsGSKHjr9uzFgyduqa6Mpl8
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(136003)(396003)(346002)(39860400002)(451199021)(41300700001)(2906002)(30864003)(316002)(8936002)(6862004)(8676002)(33656002)(55016003)(86362001)(38070700005)(5660300002)(9686003)(53546011)(26005)(6506007)(7696005)(71200400001)(478600001)(82960400001)(83380400001)(52536014)(186003)(19627235002)(76116006)(38100700002)(122000001)(6636002)(4326008)(66476007)(66556008)(54906003)(66946007)(66446008)(64756008)(579004)(559001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ripYxDWw7TM8W8LixbPHwfbVGq42UQOlxNqDzvmrCWzvm60du2Y1d9iVTZpR?=
 =?us-ascii?Q?7mGCMnhin2LE5JMz+3P4Mbiy1PSvUpk+6xI0stVPpsAzaHdCVakdKeeVBpfu?=
 =?us-ascii?Q?esNxuxm9nwYBnHUdp8aqPWWeLgD8h6nSiTi3JH0HjLsOKLdNcmdj5GM5GMor?=
 =?us-ascii?Q?D+TDl38vAtEpicw1aU7ePihxaMdSk6h1fUStOe7cs0z3XC1+CbVzaCKvPXaD?=
 =?us-ascii?Q?BdGCGNUbrLVOThSiA42sEk0IEO3MtnFhP703c4dCilAJutVSLZ8QsQB2ncrg?=
 =?us-ascii?Q?mKM+CJK5q2GR7HoCCoCTR1ohKzygItkJ3BLFh04KcmwVdcMtL5Y9Ioj/gFip?=
 =?us-ascii?Q?GpExT1wHSerz54dE2t63eZcVdVHN3bBweFSeEVq6fjlVZYQ2hSOoz68K6Xxz?=
 =?us-ascii?Q?zAiJl/ytAZTCUhncJd92b0O0taZ5iZdWTTqUB3dSHTjOse7lHFKX0IYhnGCz?=
 =?us-ascii?Q?tw590Or50a+2sFhhQpuV9k1qWfIFviEQd3AU542ggMrrGWOqRRgG3TTt/fcl?=
 =?us-ascii?Q?cfW3fcdld0KwvO+G4B+DxjZcRUHotmuK56zwcUJ5q7e1RQbT/wmkFC3SzjGt?=
 =?us-ascii?Q?ME/AALmyQ+/ZaPEKfvoq6zalilZrM09wvtk5j5Nc3/MmtvRJq9lItxqYn2HG?=
 =?us-ascii?Q?nDD9+/W890XwxpIJRyT8Po7+0xJlYmg5bZ98FR8cQBdRKBcecVkXfIlGpca9?=
 =?us-ascii?Q?+ksFk7h8I1OGwiApN2UqffpR6nOC4Nm44OT+UNbD5IS3zLGEjTzPH0wonuaK?=
 =?us-ascii?Q?IItJbr+Qd01ERVkDmkrfiBx9GiIgoaYPYTplt9kUj1l133GbVFKcLztONJ+9?=
 =?us-ascii?Q?7dLqadisD7IbfQEfnk7Ga1cin3nyGsVxzqlG6W3iCYRx6/E1eDQkVdz9Q1XX?=
 =?us-ascii?Q?kXZgxmBmMjl8sVm0fVVtdDRZEk2BAnb1hGrN5iJvMqwlQtd4CISPBhEUs/wE?=
 =?us-ascii?Q?77MkW6YeuLbhxwUpVz31jy25NUyNv4j9YhoqQJ9zJpgcTl5CxJNipX71vOX7?=
 =?us-ascii?Q?fTDIkwHErVDMMMvSA0TDPYS9r6rsHsocH6zWQLJ9v8rfIySQf1I5LaK4Gh95?=
 =?us-ascii?Q?rbZ+k95glBKgHqhTz+TY4DDW5LkPEhKMPcInCypTVAlwIqZtkOYH8EwaAZRL?=
 =?us-ascii?Q?lFZ4H1DtAesOTEsjyHmILSQkgC5ErFCMdkOOuo5z69N5o+184X+ym1OU1i5Y?=
 =?us-ascii?Q?bfT/LOBQLY1gqqXe2eC/h5qxafjr9jq4boAIJnnG1RSrmYy1voeCEWGn+tdE?=
 =?us-ascii?Q?A8Td6/NltCSbV0DTpXFWFCwZvtgTetbXwzb5SqJ32tfZeiAP6bjMcgXaIQj9?=
 =?us-ascii?Q?Faf0K6YSPoQNYd4F6cS8qSUfASJAkKaGPzJC+eN2+550q/O7hWcoW5k6y0I8?=
 =?us-ascii?Q?eKZIciWwRQwz35m0bBYyab323kT1jLyw2CQou4ZU4uBVJv2j2lvlEcIH8+1P?=
 =?us-ascii?Q?bd6b4iOo9+DP6RDcoI5buWXBBkngWhOigDIQpQJRW/4mTSfnX1Et57VBIvzu?=
 =?us-ascii?Q?KBHEyWmOBApuKvs7+8ZsspPaqyMWN7XXWKfjedJuCk82d8nU3QUv819orvuO?=
 =?us-ascii?Q?Wb64K6/WBtFcBF+YBmehQaK+XmjjG/F/5OrPhr21?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dad3f941-dd1d-48b6-ed78-08db8f76c9bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2023 14:27:35.5982 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ubJUVm5HFfhMh7chJh+eEOvWeHOJGrtf9HJhZB/2HCC+9gq1BB9vSXQ0zsntdtnhxNKdT/sCMCFdZXv1bBGer6beEAllsfk8zNGx4S2IVUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8564
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V9 6/6] drm/xe: Add min/max cap for engine
 scheduler properties
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Friday, July 28, 2023 7:54 PM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>;
> intel-xe@lists.freedesktop.org
> Subject: Re: [PATCH V9 6/6] drm/xe: Add min/max cap for engine scheduler
> properties
>=20
> On Fri, Jul 28, 2023 at 01:36:29AM -0600, Upadhyay, Tejas wrote:
> >
> >
> > > -----Original Message-----
> > > From: Vishwanathapura, Niranjana
> > > <niranjana.vishwanathapura@intel.com>
> > > Sent: Friday, July 28, 2023 11:56 AM
> > > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > > Cc: Brost, Matthew <matthew.brost@intel.com>; intel-
> > > xe@lists.freedesktop.org
> > > Subject: Re: [PATCH V9 6/6] drm/xe: Add min/max cap for engine
> > > scheduler properties
> > >
> > > On Thu, Jul 27, 2023 at 10:54:42PM -0700, Upadhyay, Tejas wrote:
> > > >
> > > >
> > > >> -----Original Message-----
> > > >> From: Brost, Matthew <matthew.brost@intel.com>
> > > >> Sent: Friday, July 28, 2023 10:35 AM
> > > >> To: Vishwanathapura, Niranjana
> > > <niranjana.vishwanathapura@intel.com>
> > > >> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> > > >> xe@lists.freedesktop.org
> > > >> Subject: Re: [PATCH V9 6/6] drm/xe: Add min/max cap for engine
> > > >> scheduler properties
> > > >>
> > > >> On Thu, Jul 27, 2023 at 09:44:23PM -0700, Niranjana
> > > >> Vishwanathapura
> > > >> wrote:
> > > >> > On Thu, Jul 27, 2023 at 03:26:49PM +0000, Matthew Brost wrote:
> > > >> > > On Thu, Jul 27, 2023 at 01:52:35PM +0530, Tejas Upadhyay wrote=
:
> > > >> > > > Add sysfs entries for the min, max, and defaults for each
> > > >> > > > of engine scheduler controls for every hardware engine class=
.
> > > >> > > >
> > > >> > > > Non-elevated user IOCTLs to set these controls must be
> > > >> > > > within the min-max ranges of the sysfs entries, elevated
> > > >> > > > user can set these controls to any value. However,
> > > >> > > > introduced compile time CONFIG min-max values which
> > > >> > > > restricts elevated user to be in compile time min-max range =
if at
> all sysfs min/max are violated.
> > > >> > > >
> > > >> > > > Sysfs entries examples are, DUT# cat
> > > /sys/class/drm/cardX/device/tileN/gtN/engines/ccs/.defaults/
> > > >> > > > job_timeout_max         job_timeout_ms
> preempt_timeout_min
> > > >> timeslice_duration_max  timeslice_duration_us
> > > >> > > > job_timeout_min         preempt_timeout_max
> > > preempt_timeout_us
> > > >> timeslice_duration_min
> > > >> > > >
> > > >> > > > DUT# cat /sys/class/drm/card1/device/tileN/gtN/engines/ccs/
> > > >> > > > .defaults/              job_timeout_min         preempt_time=
out_max
> > > >> preempt_timeout_us      timeslice_duration_min
> > > >> > > > job_timeout_max         job_timeout_ms
> preempt_timeout_min
> > > >> timeslice_duration_max  timeslice_duration_us
> > > >> > > >
> > > >> > > > V9 :
> > > >> > > >    - Rebase to use s/xe_engine/xe_hw_engine/ - Matt
> > > >> > > > V8 :
> > > >> > > >    - fix enforce_sched_limit and avoid code duplication - Ni=
ranjana
> > > >> > > >    - Make sure min < max - Niranjana
> > > >> > > > V7 :
> > > >> > > >    - Rebase to replace hw engine with eclass interface
> > > >> > > >    - return EINVAL in place of EPERM
> > > >> > > >    - Use some APIs to avoid code duplication
> > > >> > > > V6 :
> > > >> > > >    - Rebase changes to reflect per engine class props interf=
ace -
> MattB
> > > >> > > >    - Use #if ENABLED - MattB
> > > >> > > >    - Remove MAX_SCHED_TIMEOUT check as range validation is
> > > >> > > > enough
> > > >> > > > V5 :
> > > >> > > >    - Rebase to resolve conflicts - CI
> > > >> > > > V4 :
> > > >> > > >    - Rebase
> > > >> > > >    - Update commit to reflect tile addition
> > > >> > > >    - Use XE_HW macro directly as they are already filtered
> > > >> > > >      for CONFIG checks - Niranjana
> > > >> > > >    - Add CONFIG for enable/disable min/max limitation
> > > >> > > >      on elevated user. Default is enable - Matt/Joonas
> > > >> > > > V3 :
> > > >> > > >    - Resolve CI hooks warning for kernel-doc
> > > >> > > > V2 :
> > > >> > > >    - Restric min/max setting to #define default min/max for
> > > >> > > >      elevated user - Himal
> > > >> > > >    - Remove unrelated changes from patch - Niranjana
> > > >> > > >
> > > >> > > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > >> > > > ---
> > > >> > > >  drivers/gpu/drm/xe/Kconfig                    |   6 +
> > > >> > > >  drivers/gpu/drm/xe/Kconfig.profile            |  46 +++
> > > >> > > >  drivers/gpu/drm/xe/xe_engine.c                |  25 +-
> > > >> > > >  drivers/gpu/drm/xe/xe_hw_engine.c             |   8 +
> > > >> > > >  drivers/gpu/drm/xe/xe_hw_engine.h             |  31 ++
> > > >> > > >  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 354
> > > >> ++++++++++++++++++
> > > >> > > >  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h |   2 +
> > > >> > > >  7 files changed, 466 insertions(+), 6 deletions(-)  create
> > > >> > > > mode
> > > >> > > > 100644 drivers/gpu/drm/xe/Kconfig.profile
> > > >> > > >
> > > >> > > > diff --git a/drivers/gpu/drm/xe/Kconfig
> > > >> > > > b/drivers/gpu/drm/xe/Kconfig index
> > > >> > > > d44794f99338..0a4ea965645b
> > > >> > > > 100644
> > > >> > > > --- a/drivers/gpu/drm/xe/Kconfig
> > > >> > > > +++ b/drivers/gpu/drm/xe/Kconfig
> > > >> > > > @@ -83,3 +83,9 @@ depends on DRM_XE  depends on EXPERT
> > > source
> > > >> > > > "drivers/gpu/drm/xe/Kconfig.debug"
> > > >> > > >  endmenu
> > > >> > > > +
> > > >> > > > +menu "drm/xe Profile Guided Optimisation"
> > > >> > > > +	visible if EXPERT
> > > >> > > > +	depends on DRM_XE
> > > >> > > > +	source "drivers/gpu/drm/xe/Kconfig.profile"
> > > >> > > > +endmenu
> > > >> > > > diff --git a/drivers/gpu/drm/xe/Kconfig.profile
> > > >> > > > b/drivers/gpu/drm/xe/Kconfig.profile
> > > >> > > > new file mode 100644
> > > >> > > > index 000000000000..e72f15ec4bf6
> > > >> > > > --- /dev/null
> > > >> > > > +++ b/drivers/gpu/drm/xe/Kconfig.profile
> > > >> > > > @@ -0,0 +1,46 @@
> > > >> > > > +config DRM_XE_JOB_TIMEOUT_MAX
> > > >> > > > +       int "Default max job timeout (ms)"
> > > >> > > > +       default 10000 # milliseconds
> > > >> > > > +       help
> > > >> > > > +         Configures the default max job timeout after which=
 job will
> > > >> > > > +         be forcefully taken away from scheduler.
> > > >> > > > +config DRM_XE_JOB_TIMEOUT_MIN
> > > >> > > > +       int "Default max job timeout (ms)"
> > > >> > > > +       default 1 # milliseconds
> > > >> > > > +       help
> > > >> > > > +         Configures the default min job timeout after which=
 job will
> > > >> > > > +         be forcefully taken away from scheduler.
> > > >> > > > +config DRM_XE_TIMESLICE_MAX
> > > >> > > > +       int "Default max timeslice duration (us)"
> > > >> > > > +       default 10000000 # microseconds
> > > >> > > > +       help
> > > >> > > > +         Configures the default max timeslice duration
> > > >> > > > +between
> > > multiple
> > > >> > > > +         contexts by guc scheduling.
> > > >> > > > +config DRM_XE_TIMESLICE_MIN
> > > >> > > > +       int "Default min timeslice duration (us)"
> > > >> > > > +       default 1 # microseconds
> > > >> > > > +       help
> > > >> > > > +         Configures the default min timeslice duration
> > > >> > > > +between
> > > multiple
> > > >> > > > +         contexts by guc scheduling.
> > > >> > > > +config DRM_XE_PREEMPT_TIMEOUT_MAX
> > > >> > > > +       int "Default max  preempt timeout (us)"
> > > >> > > > +       default 10000000 # microseconds
> > > >> > > > +       help
> > > >> > > > +         Configures the default max preempt timeout after
> > > >> > > > +which
> > > context
> > > >> > > > +         will be forcefully taken away and higher priority =
context
> will
> > > >> > > > +         run.
> > > >> > > > +config DRM_XE_PREEMPT_TIMEOUT_MIN
> > > >> > > > +       int "Default min  preempt timeout (us)"
> > > >> > > > +       default 1 # microseconds
> > > >> > > > +       help
> > > >> > > > +         Configures the default min preempt timeout after
> > > >> > > > +which
> > > context
> > > >> > > > +         will be forcefully taken away and higher priority =
context
> will
> > > >> > > > +         run.
> > > >> > > > +config DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
> > > >> > > > +       bool "Default configuration of limitation on schedul=
er
> timeout"
> > > >> > > > +       default y
> > > >> > > > +       help
> > > >> > > > +	 Configures the enablement of limitation on scheduler
> > > timeout
> > > >> > > > +	 to apply to applicable user. For elevated user, all above=
 MIN
> > > >> > > > +	 and MAX values will apply when this configuration is
> > > >> > > > +enable
> > > to
> > > >> > > > +	 apply limitation. By default limitation is applied.
> > > >> > > > diff --git a/drivers/gpu/drm/xe/xe_engine.c
> > > >> > > > b/drivers/gpu/drm/xe/xe_engine.c index
> > > >> > > > 9e167b113963..d934196eb79f
> > > >> > > > 100644
> > > >> > > > --- a/drivers/gpu/drm/xe/xe_engine.c
> > > >> > > > +++ b/drivers/gpu/drm/xe/xe_engine.c
> > > >> > > > @@ -13,6 +13,7 @@
> > > >> > > >
> > > >> > > >  #include "xe_device.h"
> > > >> > > >  #include "xe_gt.h"
> > > >> > > > +#include "xe_hw_engine_class_sysfs.h"
> > > >> > > >  #include "xe_hw_fence.h"
> > > >> > > >  #include "xe_lrc.h"
> > > >> > > >  #include "xe_macros.h"
> > > >> > > > @@ -191,8 +192,12 @@ static int engine_set_priority(struct
> > > >> > > > xe_device *xe, struct xe_engine *e,  static int
> > > >> engine_set_timeslice(struct xe_device *xe, struct xe_engine *e,
> > > >> > > >  				u64 value, bool create)  {
> > > >> > > > -	if (!capable(CAP_SYS_NICE))
> > > >> > > > -		return -EPERM;
> > > >> > > > +	u32 min =3D e->hwe->eclass->sched_props.timeslice_min;
> > > >> > > > +	u32 max =3D e->hwe->eclass->sched_props.timeslice_max;
> > > >> > >
> > > >> > > So I screwed this up in my last comment, sorry.
> > > >> > >
> > > >> > > min =3D cap_nice ? KConfig option for min :
> > > >> > > e->hwe->eclass->sched_props.timeslice_min;
> > > >> > > same logic for max;
> > > >> > >
> > > >> > > Probably add helper for this.
> > > >> > >
> > > >> > > > +
> > > >> > > > +	if (enforce_schedule_limit() &&
> > > >> > > > +	    !engine_timeout_in_range(value, min, max))
> > > >> > >
> > > >> > > Then I think logic works too...
> > > >> > >
> > > >> > > if cap nice && !Kconfig option to enfore limits
> > > >> > > (enforce_schedule_limit
> > > >> returns false):
> > > >> > > 	user can do whatever
> > > >> > > else if cap nice
> > > >> > > 	user within Kconfig range
> > > >> > > else
> > > >> > > 	user within sysfs range
> > > >> > >
> > > >> > > This is what we want in the end.
> > > >> > >
> > > >> >
> > > >> > Matt, I think this is exactly what the previous revision of the
> > > >> > patch was
> > > >> doing.
> > > >> >
> > > >>
> > > >> No... Previous version
> > > >>
> > > >> min =3D Kconfig option to enfore limits ? KConfig option for min :
> > > >> e->hwe-
> > > >> >eclass->sched_props.timeslice_min
> > > >> same for max
> > > >>
> > > >> Results in:
> > > >>
> > > >> if cap nice && !Kconfig option to enfore limits
> > > >> (enforce_schedule_limit returns false):
> > > >> 	user can do whatever
> > > >> else if cap_nice || Kconfig option to enfore limit
> > > >> 	user within Kconfig range
> > > >> else
> > > >>  	user within sysfs range
> > > >>
> > > >> !cap_nice && Kconfig option to enfore limits =3D=3D user within
> > > >> Kconfig range
> > > >> (previously) !cap_nice && Kconfig option to enfore limits =3D=3D u=
ser
> > > >> within sysfs range (my suggestion)
> > > >
> > > >In previous version we can achieve it by just adding one below check
> right?
> > > >#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT) &&
> > > cap_nice
> > > >+       u32 min =3D XE_HW_ENGINE_TIMESLICE_MIN;
> > > >+       u32 max =3D XE_HW_ENGINE_TIMESLICE_MAX; #else
> > > >+       u32 min =3D e->hwe->eclass->sched_props.timeslice_min;
> > > >+       u32 max =3D e->hwe->eclass->sched_props.timeslice_max;
> > > >+#endif
> > > >
> > > >Please let me know!
> > > >
> > >
> > > Ah I see. Yah, it is a limits selection issue.
> > > We can do,
> > >
> > > u32 min =3D e->hwe->eclass->sched_props.timeslice_min;
> > > u32 max =3D e->hwe->eclass->sched_props.timeslice_max;
> > >
> > > #if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> > >          if (cap_nice) {
> > >                  u32 min =3D XE_HW_ENGINE_TIMESLICE_MIN;
> > >                  u32 max =3D XE_HW_ENGINE_TIMESLICE_MAX;
> > >          }
> > > #endif
> > >
> > > Matt, Tejas
> > > Also, looks like you missed my another comment below.
> > >
> > > Niranjana
> > >
> > > >>
> > > >> The logic is different and I believe we want what I'm suggesting.
> > > >>
> > > >> Matt
> > > >>
> > > >> > > > +		return -EINVAL;
> > > >> > > >
> > > >> > > >  	return e->ops->set_timeslice(e, value);  } @@ -201,8
> > > >> > > > +206,12 @@ static int engine_set_preemption_timeout(struct
> xe_device *xe,
> > > >> > > >  					 struct xe_engine *e, u64
> > > value,
> > > >> > > >  					 bool create)
> > > >> > > >  {
> > > >> > > > -	if (!capable(CAP_SYS_NICE))
> > > >> > > > -		return -EPERM;
> > > >> > > > +	u32 min =3D e->hwe->eclass-
> > > >sched_props.preempt_timeout_min;
> > > >> > > > +	u32 max =3D e->hwe->eclass-
> > > >sched_props.preempt_timeout_max;
> > > >> > > > +
> > > >> > > > +	if (enforce_schedule_limit() &&
> > > >> > > > +	    !engine_timeout_in_range(value, min, max))
> > > >> > > > +		return -EINVAL;
> > > >> > > >
> > > >> > > >  	return e->ops->set_preempt_timeout(e, value);  } @@ -
> > > 266,11
> > > >> > > > +275,15 @@ static int engine_set_persistence(struct
> > > >> > > > +xe_device *xe,
> > > >> > > > struct xe_engine *e,  static int
> > > >> > > > engine_set_job_timeout(struct xe_device
> > > >> *xe, struct xe_engine *e,
> > > >> > > >  				  u64 value, bool create)  {
> > > >> > > > +	u32 min =3D e->hwe->eclass->sched_props.job_timeout_min;
> > > >> > > > +	u32 max =3D e->hwe->eclass->sched_props.job_timeout_max;
> > > >> > > > +
> > > >> > > >  	if (XE_IOCTL_DBG(xe, !create))
> > > >> > > >  		return -EINVAL;
> > > >> > > >
> > > >> > > > -	if (!capable(CAP_SYS_NICE))
> > > >> > > > -		return -EPERM;
> > > >> > > > +	if (enforce_schedule_limit() &&
> > > >> > > > +	    !engine_timeout_in_range(value, min, max))
> > > >> > > > +		return -EINVAL;
> > > >> > > >
> > > >> > > >  	return e->ops->set_job_timeout(e, value);  } diff --git
> > > >> > > > a/drivers/gpu/drm/xe/xe_hw_engine.c
> > > >> > > > b/drivers/gpu/drm/xe/xe_hw_engine.c
> > > >> > > > index afa7d25c3852..e601bffe3b13 100644
> > > >> > > > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > > >> > > > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > > >> > > > @@ -364,8 +364,16 @@ static void
> > > >> > > > hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine
> > > >> > > > *hwe,
> > > >> > > >
> > > >> > > >  	if (!gt->eclass[hwe->class].sched_props.job_timeout_ms) {
> > > >> > > >  		gt->eclass[hwe->class].sched_props.job_timeout_ms
> > > =3D HZ *
> > > >> 5;
> > > >> > > > +		gt->eclass[hwe-
> > > >class].sched_props.job_timeout_min =3D
> > > >> XE_HW_ENGINE_JOB_TIMEOUT_MIN;
> > > >> > > > +		gt->eclass[hwe-
> > > >class].sched_props.job_timeout_max =3D
> > > >> > > > +XE_HW_ENGINE_JOB_TIMEOUT_MAX;
> > > >> > > >  		gt->eclass[hwe->class].sched_props.timeslice_us =3D 1
> > > * 1000;
> > > >> > > > +		gt->eclass[hwe->class].sched_props.timeslice_min =3D
> > > >> XE_HW_ENGINE_TIMESLICE_MIN;
> > > >> > > > +		gt->eclass[hwe->class].sched_props.timeslice_max =3D
> > > >> > > > +XE_HW_ENGINE_TIMESLICE_MAX;
> > > >> > > >  		gt->eclass[hwe-
> > > >class].sched_props.preempt_timeout_us =3D
> > > >> 640 *
> > > >> > > > 1000;
> > > >> > > > +		gt->eclass[hwe-
> > > >class].sched_props.preempt_timeout_min =3D
> > > >> > > > +
> > > >> 	XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
> > > >> > > > +		gt->eclass[hwe-
> > > >class].sched_props.preempt_timeout_max =3D
> > > >> > > > +
> > > >> 	XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX;
> > > >> > > >  		/* Record default props */
> > > >> > > >  		gt->eclass[hwe->class].defaults =3D gt->eclass[hwe-
> > > >> >class].sched_props;
> > > >> > > >  	}
> > > >> > > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h
> > > >> > > > b/drivers/gpu/drm/xe/xe_hw_engine.h
> > > >> > > > index 7eca9d53c7b1..3d37d6d44261 100644
> > > >> > > > --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> > > >> > > > +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> > > >> > > > @@ -10,6 +10,37 @@
> > > >> > > >
> > > >> > > >  struct drm_printer;
> > > >> > > >
> > > >> > > > +#ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MIN #define
> > > >> > > > +XE_HW_ENGINE_JOB_TIMEOUT_MIN
> > > >> CONFIG_DRM_XE_JOB_TIMEOUT_MIN #else
> > > >> > > > +#define XE_HW_ENGINE_JOB_TIMEOUT_MIN 1 #endif #ifdef
> > > >> > > > +CONFIG_DRM_XE_JOB_TIMEOUT_MAX #define
> > > >> > > > +XE_HW_ENGINE_JOB_TIMEOUT_MAX
> > > >> CONFIG_DRM_XE_JOB_TIMEOUT_MAX #else
> > > >> > > > +#define XE_HW_ENGINE_JOB_TIMEOUT_MAX (10 * 1000)
> #endif
> > > #ifdef
> > > >> > > > +CONFIG_DRM_XE_TIMESLICE_MIN #define
> > > >> XE_HW_ENGINE_TIMESLICE_MIN
> > > >> > > > +CONFIG_DRM_XE_TIMESLICE_MIN #else #define
> > > >> > > > +XE_HW_ENGINE_TIMESLICE_MIN 1 #endif #ifdef
> > > >> > > > +CONFIG_DRM_XE_TIMESLICE_MAX #define
> > > >> XE_HW_ENGINE_TIMESLICE_MAX
> > > >> > > > +CONFIG_DRM_XE_TIMESLICE_MAX #else #define
> > > >> > > > +XE_HW_ENGINE_TIMESLICE_MAX (10 * 1000 * 1000) #endif
> > > >> > > > +#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN #define
> > > >> > > > +XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN
> > > >> > > > +CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN #else #define
> > > >> > > > +XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN 1 #endif #ifdef
> > > >> > > > +CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX
> > > >> > > > +#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX
> > > >> > > > +CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX #else #define
> > > >> > > > +XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX (10 * 1000 * 1000)
> > > #endif
> > > >> > > > +
> > > >> > > >  int xe_hw_engines_init_early(struct xe_gt *gt);  int
> > > >> > > > xe_hw_engines_init(struct xe_gt *gt);  void
> > > >> > > > xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16
> > > >> > > > intr_vec); diff --git
> > > >> > > > a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> > > >> > > > b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> > > >> > > > index 990bb675d1e0..2b7ac4e02db6 100644
> > > >> > > > --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> > > >> > > > +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> > > >> > > > @@ -11,6 +11,20 @@
> > > >> > > >
> > > >> > > >  static int xe_add_hw_engine_class_defaults(struct kobject
> > > >> > > > *parent);
> > > >> > > >
> > > >> > > > +bool enforce_schedule_limit(void) { #if
> > > >> > > > +IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> > > >> > > > +	return true;
> > > >> > > > +#else
> > > >> > > > +	return !capable(CAP_SYS_NICE); #endif }
> > > >> > > > +
> > > >> > > > +bool engine_timeout_in_range(u64 timeout, u64 min, u64 max)
> {
> > > >> > > > +	return timeout >=3D min && timeout <=3D max; }
> > > >> > > > +
> > > >> > > >  static void kobj_xe_hw_engine_release(struct kobject *kobj)=
  {
> > > >> > > >  	kfree(kobj);
> > > >> > > > @@ -39,11 +53,92 @@ kobj_xe_hw_engine_class(struct kobject
> > > >> *parent, char *name)
> > > >> > > >  	return keclass;
> > > >> > > >  }
> > > >> > > >
> > > >> > > > +static ssize_t job_timeout_max_store(struct kobject *kobj,
> > > >> > > > +				     struct kobj_attribute *attr,
> > > >> > > > +				     const char *buf, size_t count) {
> > > >> > > > +	struct xe_hw_engine_class_intf *eclass =3D
> > > kobj_to_eclass(kobj);
> > > >> > > > +	u32 timeout;
> > > >> > > > +	int err;
> > > >> > > > +
> > > >> > > > +	err =3D kstrtou32(buf, 0, &timeout);
> > > >> > > > +	if (err)
> > > >> > > > +		return err;
> > > >> > > > +
> > > >> > > > +	if (timeout < eclass->sched_props.job_timeout_min)
> > > >> > > > +		return -EINVAL;
> > > >> > > > +
> > > >> > > > +	if (enforce_schedule_limit() &&
> > > >> > > > +	    !engine_timeout_in_range(timeout,
> > > >> > > > +
> > > XE_HW_ENGINE_JOB_TIMEOUT_MIN,
> > > >> > > > +
> > > XE_HW_ENGINE_JOB_TIMEOUT_MAX))
> > > >> > > > +		return -EINVAL;
> > > >> > > > +
> > > >> > > > +	WRITE_ONCE(eclass->sched_props.job_timeout_max,
> > > timeout);
> > > >> > > > +
> > > >> > > > +	return count;
> > > >> > > > +}
> > > >> > > > +
> > > >> > > > +static ssize_t job_timeout_max_show(struct kobject *kobj,
> > > >> > > > +				    struct kobj_attribute *attr, char
> > > *buf) {
> > > >> > > > +	struct xe_hw_engine_class_intf *eclass =3D
> > > >> > > > +kobj_to_eclass(kobj);
> > > >> > > > +
> > > >> > > > +	return sprintf(buf, "%u\n",
> > > >> > > > +eclass->sched_props.job_timeout_max);
> > > >> > > > +}
> > > >> > > > +
> > > >> > > > +static struct kobj_attribute job_timeout_max_attr =3D
> > > >> > > > +__ATTR(job_timeout_max, 0644, job_timeout_max_show,
> > > >> > > > +job_timeout_max_store);
> > > >> > > > +
> > > >> > > > +static ssize_t job_timeout_min_store(struct kobject *kobj,
> > > >> > > > +				     struct kobj_attribute *attr,
> > > >> > > > +				     const char *buf, size_t count) {
> > > >> > > > +	struct xe_hw_engine_class_intf *eclass =3D
> > > kobj_to_eclass(kobj);
> > > >> > > > +	u32 timeout;
> > > >> > > > +	int err;
> > > >> > > > +
> > > >> > > > +	err =3D kstrtou32(buf, 0, &timeout);
> > > >> > > > +	if (err)
> > > >> > > > +		return err;
> > > >> > > > +
> > > >> > > > +	if (timeout > eclass->sched_props.job_timeout_max)
> > > >> > > > +		return -EINVAL;
> > > >> > > > +
> > > >> > > > +	if (enforce_schedule_limit() &&
> > > >> > > > +	    !engine_timeout_in_range(timeout,
> > > >> > > > +
> > > XE_HW_ENGINE_JOB_TIMEOUT_MIN,
> > > >> > > > +
> > > XE_HW_ENGINE_JOB_TIMEOUT_MAX))
> > > >> > > > +		return -EINVAL;
> > > >> > > > +
> > > >> > > > +	WRITE_ONCE(eclass->sched_props.job_timeout_min,
> > > timeout);
> > > >> > > > +
> > > >> > > > +	return count;
> > > >> > > > +}
> > > >> > > > +
> > > >> > > > +static ssize_t job_timeout_min_show(struct kobject *kobj,
> > > >> > > > +				    struct kobj_attribute *attr, char
> > > *buf) {
> > > >> > > > +	struct xe_hw_engine_class_intf *eclass =3D
> > > >> > > > +kobj_to_eclass(kobj);
> > > >> > > > +
> > > >> > > > +	return sprintf(buf, "%u\n",
> > > >> > > > +eclass->sched_props.job_timeout_min);
> > > >> > > > +}
> > > >> > > > +
> > > >> > > > +static struct kobj_attribute job_timeout_min_attr =3D
> > > >> > > > +__ATTR(job_timeout_min, 0644, job_timeout_min_show,
> > > >> > > > +job_timeout_min_store);
> > > >> > > > +
> > > >> > > >  static ssize_t job_timeout_store(struct kobject *kobj,
> > > >> > > >  				 struct kobj_attribute *attr,
> > > >> > > >  				 const char *buf, size_t count)  {
> > > >> > > >  	struct xe_hw_engine_class_intf *eclass =3D
> > > >> > > > kobj_to_eclass(kobj);
> > > >> > > > +#if
> IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> > > >> > > > +	u32 min =3D XE_HW_ENGINE_JOB_TIMEOUT_MIN;
> > > >> > > > +	u32 max =3D XE_HW_ENGINE_JOB_TIMEOUT_MAX; #else
> > > >> > > > +	u32 min =3D e->hwe->eclass->sched_props.job_timeout_min;
> > > >> > > > +	u32 max =3D e->hwe->eclass->sched_props.job_timeout_max;
> > > >> > > > +#endif
> > > >> > >
> > > >> > > I don't think we need this, just make sure default is within
> > > >> > > min / max of the sched_props.
> > > >> > >
> > > >> >
> > > >> > Shouldn't the sched_prop set through sysfs here which applies
> > > >> > to all future user engines (xe_engine) has the same requirement
> > > >> > as the sched_prop set directly to user engine (xe_engine)
> > > >> > through set_properly
> > > >> ioctl?
> > > >> > ie., shoudln't the requirement be same in job_timeout_store()
> > > >> > and engine_set_job_timeout()?
> >
> > I also think it should apply same to sysfs calls as well. Unless we thi=
nk sysfs
> should limit to compile configs only. Since sysfs min/max cab be changed.
> >
>=20
> Disagree, the min / max sysfs entries are subject to the Kconfig limits.
> So if you check the sysfs entry min / max here, the initial value will al=
ways be
> within the Kconfig limits plus any additional restrictions a user has imp=
osed.

So limit to sysfs min/max always irrespective of elevated user or not, righ=
t?=20

Thanks,
Tejas
>=20
> Matt
>=20
> > Thanks,
> > Tejas
> >
> > > >> >
> > > >> > Niranjana
> > > >> >
> > > >> > > Matt
> > > >> > >
> > > >> > > >  	u32 timeout;
> > > >> > > >  	int err;
> > > >> > > >
> > > >> > > > @@ -51,6 +146,10 @@ static ssize_t job_timeout_store(struct
> > > >> > > > kobject
> > > >> *kobj,
> > > >> > > >  	if (err)
> > > >> > > >  		return err;
> > > >> > > >
> > > >> > > > +	if (enforce_schedule_limit() &&
> > > >> > > > +	    !engine_timeout_in_range(timeout, min, max))
> > > >> > > > +		return -EINVAL;
> > > >> > > > +
> > > >> > > >  	WRITE_ONCE(eclass->sched_props.job_timeout_ms,
> > > timeout);
> > > >> > > >
> > > >> > > >  	return count;
> > > >> > > > @@ -78,11 +177,40 @@ static ssize_t
> > > >> > > > job_timeout_default(struct kobject *kobj,  static struct
> > > >> > > > kobj_attribute job_timeout_def =3D __ATTR(job_timeout_ms,
> > > >> > > > 0444, job_timeout_default, NULL);
> > > >> > > >
> > > >> > > > +static ssize_t job_timeout_min_default(struct kobject *kobj=
,
> > > >> > > > +				       struct kobj_attribute *attr, char
> > > *buf) {
> > > >> > > > +	struct xe_hw_engine_class_intf *eclass =3D
> > > >> > > > +kobj_to_eclass(kobj->parent);
> > > >> > > > +
> > > >> > > > +	return sprintf(buf, "%u\n",
> > > >> > > > +eclass->defaults.job_timeout_min);
> > > >> > > > +}
> > > >> > > > +
> > > >> > > > +static struct kobj_attribute job_timeout_min_def =3D
> > > >> > > > +__ATTR(job_timeout_min, 0444, job_timeout_min_default,
> > > >> > > > +NULL);
> > > >> > > > +
> > > >> > > > +static ssize_t job_timeout_max_default(struct kobject *kobj=
,
> > > >> > > > +				       struct kobj_attribute *attr, char
> > > *buf) {
> > > >> > > > +	struct xe_hw_engine_class_intf *eclass =3D
> > > >> > > > +kobj_to_eclass(kobj->parent);
> > > >> > > > +
> > > >> > > > +	return sprintf(buf, "%u\n",
> > > >> > > > +eclass->defaults.job_timeout_max);
> > > >> > > > +}
> > > >> > > > +
> > > >> > > > +static struct kobj_attribute job_timeout_max_def =3D
> > > >> > > > +__ATTR(job_timeout_max, 0444, job_timeout_max_default,
> > > >> > > > +NULL);
> > > >> > > > +
> > > >> > > >  static ssize_t timeslice_duration_store(struct kobject *kob=
j,
> > > >> > > >  					struct kobj_attribute *attr,
> > > >> > > >  					const char *buf, size_t count)
> > > {
> > > >> > > >  	struct xe_hw_engine_class_intf *eclass =3D
> > > >> > > > kobj_to_eclass(kobj);
> > > >> > > > +#if
> IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> > > >> > > > +	u32 min =3D XE_HW_ENGINE_TIMESLICE_MIN;
> > > >> > > > +	u32 max =3D XE_HW_ENGINE_TIMESLICE_MAX; #else
> > > >> > > > +	u32 min =3D e->hwe->eclass->sched_props.timeslice_min;
> > > >> > > > +	u32 max =3D e->hwe->eclass->sched_props.timeslice_max;
> > > >> > > > +#endif
> > > >> > > >  	u32 duration;
> > > >> > > >  	int err;
> > > >> > > >
> > > >> > > > @@ -90,11 +218,92 @@ static ssize_t
> > > >> > > > timeslice_duration_store(struct
> > > >> kobject *kobj,
> > > >> > > >  	if (err)
> > > >> > > >  		return err;
> > > >> > > >
> > > >> > > > +	if (enforce_schedule_limit() &&
> > > >> > > > +	    !engine_timeout_in_range(duration, min, max))
> > > >> > > > +		return -EINVAL;
> > > >> > > > +
> > > >> > > >  	WRITE_ONCE(eclass->sched_props.timeslice_us, duration);
> > > >> > > >
> > > >> > > >  	return count;
> > > >> > > >  }
> > > >> > > >
> > > >> > > > +static ssize_t timeslice_duration_max_store(struct kobject
> *kobj,
> > > >> > > > +					    struct kobj_attribute *attr,
> > > >> > > > +					    const char *buf, size_t
> > > count) {
> > > >> > > > +	struct xe_hw_engine_class_intf *eclass =3D
> > > kobj_to_eclass(kobj);
> > > >> > > > +	u32 duration;
> > > >> > > > +	int err;
> > > >> > > > +
> > > >> > > > +	err =3D kstrtou32(buf, 0, &duration);
> > > >> > > > +	if (err)
> > > >> > > > +		return err;
> > > >> > > > +
> > > >> > > > +	if (duration < eclass->sched_props.timeslice_min)
> > > >> > > > +		return -EINVAL;
> > > >> > > > +
> > > >> > > > +	if (enforce_schedule_limit() &&
> > > >> > > > +	    !engine_timeout_in_range(duration,
> > > >> > > > +				     XE_HW_ENGINE_TIMESLICE_MIN,
> > > >> > > > +
> > > XE_HW_ENGINE_TIMESLICE_MAX))
> > > >> > > > +		return -EINVAL;
> > > >> > > > +
> > > >> > > > +	WRITE_ONCE(eclass->sched_props.timeslice_max, duration);
> > > >> > > > +
> > > >> > > > +	return count;
> > > >> > > > +}
> > > >> > > > +
> > > >> > > > +static ssize_t timeslice_duration_max_show(struct kobject
> *kobj,
> > > >> > > > +					   struct kobj_attribute *attr,
> > > >> > > > +					   char *buf)
> > > >> > > > +{
> > > >> > > > +	struct xe_hw_engine_class_intf *eclass =3D
> > > >> > > > +kobj_to_eclass(kobj);
> > > >> > > > +
> > > >> > > > +	return sprintf(buf, "%u\n",
> > > >> > > > +eclass->sched_props.timeslice_max);
> > > >> > > > +}
> > > >> > > > +
> > > >> > > > +static struct kobj_attribute timeslice_duration_max_attr =
=3D
> > > >> > > > +	__ATTR(timeslice_duration_max, 0644,
> > > >> timeslice_duration_max_show,
> > > >> > > > +	       timeslice_duration_max_store);
> > > >> > > > +
> > > >> > > > +static ssize_t timeslice_duration_min_store(struct kobject =
*kobj,
> > > >> > > > +					    struct kobj_attribute *attr,
> > > >> > > > +					    const char *buf, size_t
> > > count) {
> > > >> > > > +	struct xe_hw_engine_class_intf *eclass =3D
> > > kobj_to_eclass(kobj);
> > > >> > > > +	u32 duration;
> > > >> > > > +	int err;
> > > >> > > > +
> > > >> > > > +	err =3D kstrtou32(buf, 0, &duration);
> > > >> > > > +	if (err)
> > > >> > > > +		return err;
> > > >> > > > +
> > > >> > > > +	if (duration > eclass->sched_props.timeslice_max)
> > > >> > > > +		return -EINVAL;
> > > >> > > > +
> > > >> > > > +	if (enforce_schedule_limit() &&
> > > >> > > > +	    !engine_timeout_in_range(duration,
> > > >> > > > +				     XE_HW_ENGINE_TIMESLICE_MIN,
> > > >> > > > +
> > > XE_HW_ENGINE_TIMESLICE_MAX))
> > > >> > > > +		return -EINVAL;
> > > >> > > > +
> > > >> > > > +	WRITE_ONCE(eclass->sched_props.timeslice_min, duration);
> > > >> > > > +
> > > >> > > > +	return count;
> > > >> > > > +}
> > > >> > > > +
> > > >> > > > +static ssize_t timeslice_duration_min_show(struct kobject *=
kobj,
> > > >> > > > +					   struct kobj_attribute *attr,
> > > char
> > > >> *buf) {
> > > >> > > > +	struct xe_hw_engine_class_intf *eclass =3D
> > > >> > > > +kobj_to_eclass(kobj);
> > > >> > > > +
> > > >> > > > +	return sprintf(buf, "%u\n",
> > > >> > > > +eclass->sched_props.timeslice_min);
> > > >> > > > +}
> > > >> > > > +
> > > >> > > > +static struct kobj_attribute timeslice_duration_min_attr =
=3D
> > > >> > > > +	__ATTR(timeslice_duration_min, 0644,
> > > >> timeslice_duration_min_show,
> > > >> > > > +	       timeslice_duration_min_store);
> > > >> > > > +
> > > >> > > >  static ssize_t timeslice_duration_show(struct kobject *kobj=
,
> > > >> > > >  		struct kobj_attribute *attr, char *buf)  { @@ -118,11
> > > >> > > > +327,40 @@ static ssize_t timeslice_default(struct kobject
> > > >> > > > *kobj,  static struct kobj_attribute timeslice_duration_def
> > > >> > > > =3D __ATTR(timeslice_duration_us, 0444, timeslice_default,
> > > >> > > > NULL);
> > > >> > > >
> > > >> > > > +static ssize_t timeslice_min_default(struct kobject *kobj,
> > > >> > > > +				     struct kobj_attribute *attr, char
> > > *buf) {
> > > >> > > > +	struct xe_hw_engine_class_intf *eclass =3D
> > > >> > > > +kobj_to_eclass(kobj->parent);
> > > >> > > > +
> > > >> > > > +	return sprintf(buf, "%u\n",
> > > >> > > > +eclass->defaults.timeslice_min); }
> > > >> > > > +
> > > >> > > > +static struct kobj_attribute timeslice_duration_min_def =3D
> > > >> > > > +__ATTR(timeslice_duration_min, 0444,
> > > >> > > > +timeslice_min_default, NULL);
> > > >> > > > +
> > > >> > > > +static ssize_t timeslice_max_default(struct kobject *kobj,
> > > >> > > > +				     struct kobj_attribute *attr, char
> > > *buf) {
> > > >> > > > +	struct xe_hw_engine_class_intf *eclass =3D
> > > >> > > > +kobj_to_eclass(kobj->parent);
> > > >> > > > +
> > > >> > > > +	return sprintf(buf, "%u\n",
> > > >> > > > +eclass->defaults.timeslice_max); }
> > > >> > > > +
> > > >> > > > +static struct kobj_attribute timeslice_duration_max_def =3D
> > > >> > > > +__ATTR(timeslice_duration_max, 0444,
> > > >> > > > +timeslice_max_default, NULL);
> > > >> > > > +
> > > >> > > >  static ssize_t preempt_timeout_store(struct kobject *kobj,
> > > >> > > >  				     struct kobj_attribute *attr,
> > > >> > > >  				     const char *buf, size_t count)  {
> > > >> > > >  	struct xe_hw_engine_class_intf *eclass =3D
> > > >> > > > kobj_to_eclass(kobj);
> > > >> > > > +#if
> IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> > > >> > > > +	u32 min =3D XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
> > > >> > > > +	u32 max =3D XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX; #else
> > > >> > > > +	u32 min =3D e->hwe->eclass-
> > > >sched_props.preempt_timeout_min;
> > > >> > > > +	u32 max =3D e->hwe->eclass-
> > > >sched_props.preempt_timeout_max;
> > > >> > > > +#endif
> > > >> > > >  	u32 timeout;
> > > >> > > >  	int err;
> > > >> > > >
> > > >> > > > @@ -130,6 +368,10 @@ static ssize_t
> > > >> > > > preempt_timeout_store(struct
> > > >> kobject *kobj,
> > > >> > > >  	if (err)
> > > >> > > >  		return err;
> > > >> > > >
> > > >> > > > +	if (enforce_schedule_limit() &&
> > > >> > > > +	    !engine_timeout_in_range(timeout, min, max))
> > > >> > > > +		return -EINVAL;
> > > >> > > > +
> > > >> > > >  	WRITE_ONCE(eclass->sched_props.preempt_timeout_us,
> > > timeout);
> > > >> > > >
> > > >> > > >  	return count;
> > > >> > > > @@ -158,17 +400,129 @@ static ssize_t
> > > >> > > > preempt_timeout_default(struct kobject *kobj,  static
> > > >> > > > struct kobj_attribute preempt_timeout_def =3D
> > > >> > > > __ATTR(preempt_timeout_us, 0444, preempt_timeout_default,
> > > >> > > > NULL);
> > > >> > > >
> > > >> > > > +static ssize_t preempt_timeout_min_default(struct kobject
> *kobj,
> > > >> > > > +					   struct kobj_attribute *attr,
> > > >> > > > +					   char *buf)
> > > >> > > > +{
> > > >> > > > +	struct xe_hw_engine_class_intf *eclass =3D
> > > >> > > > +kobj_to_eclass(kobj->parent);
> > > >> > > > +
> > > >> > > > +	return sprintf(buf, "%u\n",
> > > >> > > > +eclass->defaults.preempt_timeout_min);
> > > >> > > > +}
> > > >> > > > +
> > > >> > > > +static struct kobj_attribute preempt_timeout_min_def =3D
> > > >> > > > +__ATTR(preempt_timeout_min, 0444,
> > > preempt_timeout_min_default,
> > > >> > > > +NULL);
> > > >> > > > +
> > > >> > > > +static ssize_t preempt_timeout_max_default(struct kobject
> *kobj,
> > > >> > > > +					   struct kobj_attribute *attr,
> > > >> > > > +					   char *buf)
> > > >> > > > +{
> > > >> > > > +	struct xe_hw_engine_class_intf *eclass =3D
> > > >> > > > +kobj_to_eclass(kobj->parent);
> > > >> > > > +
> > > >> > > > +	return sprintf(buf, "%u\n",
> > > >> > > > +eclass->defaults.preempt_timeout_max);
> > > >> > > > +}
> > > >> > > > +
> > > >> > > > +static struct kobj_attribute preempt_timeout_max_def =3D
> > > >> > > > +__ATTR(preempt_timeout_max, 0444,
> > > >> preempt_timeout_max_default,
> > > >> > > > +NULL);
> > > >> > > > +
> > > >> > > > +static ssize_t preempt_timeout_max_store(struct kobject *ko=
bj,
> > > >> > > > +					 struct kobj_attribute *attr,
> > > >> > > > +					 const char *buf, size_t count)
> > > {
> > > >> > > > +	struct xe_hw_engine_class_intf *eclass =3D
> > > kobj_to_eclass(kobj);
> > > >> > > > +	u32 timeout;
> > > >> > > > +	int err;
> > > >> > > > +
> > > >> > > > +	err =3D kstrtou32(buf, 0, &timeout);
> > > >> > > > +	if (err)
> > > >> > > > +		return err;
> > > >> > > > +
> > > >> > > > +	if (timeout < eclass->sched_props.preempt_timeout_min)
> > > >> > > > +		return -EINVAL;
> > > >> > > > +
> > > >> > > > +	if (enforce_schedule_limit() &&
> > > >> > > > +	    !engine_timeout_in_range(timeout,
> > > >> > > > +
> > > >> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
> > > >> > > > +
> > > >> XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
> > > >> > > > +		return -EINVAL;
> > > >> > > > +
> > > >> > > > +	WRITE_ONCE(eclass->sched_props.preempt_timeout_max,
> > > timeout);
> > > >> > > > +
> > > >> > > > +	return count;
> > > >> > > > +}
> > > >> > > > +
> > > >> > > > +static ssize_t preempt_timeout_max_show(struct kobject *kob=
j,
> > > >> > > > +					struct kobj_attribute *attr,
> > > char *buf)
> > > >> {
> > > >> > > > +	struct xe_hw_engine_class_intf *eclass =3D
> > > >> > > > +kobj_to_eclass(kobj);
> > > >> > > > +
> > > >> > > > +	return sprintf(buf, "%u\n",
> > > >> > > > +eclass->sched_props.preempt_timeout_max);
> > > >> > > > +}
> > > >> > > > +
> > > >> > > > +static struct kobj_attribute preempt_timeout_max_attr =3D
> > > >> > > > +	__ATTR(preempt_timeout_max, 0644,
> > > preempt_timeout_max_show,
> > > >> > > > +	       preempt_timeout_max_store);
> > > >> > > > +
> > > >> > > > +static ssize_t preempt_timeout_min_store(struct kobject *ko=
bj,
> > > >> > > > +					 struct kobj_attribute *attr,
> > > >> > > > +					 const char *buf, size_t count)
> > > {
> > > >> > > > +	struct xe_hw_engine_class_intf *eclass =3D
> > > kobj_to_eclass(kobj);
> > > >> > > > +	u32 timeout;
> > > >> > > > +	int err;
> > > >> > > > +
> > > >> > > > +	err =3D kstrtou32(buf, 0, &timeout);
> > > >> > > > +	if (err)
> > > >> > > > +		return err;
> > > >> > > > +
> > > >> > > > +	if (timeout > eclass->sched_props.preempt_timeout_max)
> > > >> > > > +		return -EINVAL;
> > > >> > > > +
> > > >> > > > +	if (enforce_schedule_limit() &&
> > > >> > > > +	    !engine_timeout_in_range(timeout,
> > > >> > > > +
> > > >> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
> > > >> > > > +
> > > >> XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
> > > >> > > > +		return -EINVAL;
> > > >> > > > +
> > > >> > > > +	WRITE_ONCE(eclass->sched_props.preempt_timeout_min,
> > > timeout);
> > > >> > > > +
> > > >> > > > +	return count;
> > > >> > > > +}
> > > >> > > > +
> > > >> > > > +static ssize_t preempt_timeout_min_show(struct kobject *kob=
j,
> > > >> > > > +					struct kobj_attribute *attr,
> > > char *buf)
> > > >> {
> > > >> > > > +	struct xe_hw_engine_class_intf *eclass =3D
> > > >> > > > +kobj_to_eclass(kobj);
> > > >> > > > +
> > > >> > > > +	return sprintf(buf, "%u\n",
> > > >> > > > +eclass->sched_props.preempt_timeout_min);
> > > >> > > > +}
> > > >> > > > +
> > > >> > > > +static struct kobj_attribute preempt_timeout_min_attr =3D
> > > >> > > > +	__ATTR(preempt_timeout_min, 0644,
> > > preempt_timeout_min_show,
> > > >> > > > +	       preempt_timeout_min_store);
> > > >> > > > +
> > > >> > > >  static const struct attribute *defaults[] =3D {
> > > >> > > >  	&job_timeout_def.attr,
> > > >> > > > +	&job_timeout_min_def.attr,
> > > >> > > > +	&job_timeout_max_def.attr,
> > > >> > > >  	&timeslice_duration_def.attr,
> > > >> > > > +	&timeslice_duration_min_def.attr,
> > > >> > > > +	&timeslice_duration_max_def.attr,
> > > >> > > >  	&preempt_timeout_def.attr,
> > > >> > > > +	&preempt_timeout_min_def.attr,
> > > >> > > > +	&preempt_timeout_max_def.attr,
> > > >> > > >  	NULL
> > > >> > > >  };
> > > >> > > >
> > > >> > > >  static const struct attribute *files[] =3D {
> > > >> > > >  	&job_timeout_attr.attr,
> > > >> > > > +	&job_timeout_min_attr.attr,
> > > >> > > > +	&job_timeout_max_attr.attr,
> > > >> > > >  	&timeslice_duration_attr.attr,
> > > >> > > > +	&timeslice_duration_min_attr.attr,
> > > >> > > > +	&timeslice_duration_max_attr.attr,
> > > >> > > >  	&preempt_timeout_attr.attr,
> > > >> > > > +	&preempt_timeout_min_attr.attr,
> > > >> > > > +	&preempt_timeout_max_attr.attr,
> > > >> > > >  	NULL
> > > >> > > >  };
> > > >> > > >
> > > >> > > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> > > >> > > > b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> > > >> > > > index 757136614672..2e2ab351a991 100644
> > > >> > > > --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> > > >> > > > +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> > > >> > > > @@ -10,6 +10,8 @@
> > > >> > > >
> > > >> > > >  #define MAX_ENGINE_CLASS_NAME_LEN    16
> > > >> > > >  int xe_hw_engine_class_sysfs_init(struct xe_gt *gt);
> > > >> > > > +bool enforce_schedule_limit(void); bool
> > > >> > > > +engine_timeout_in_range(u64 timeout, u64 min, u64 max);
> > > >> > > >
> > > >> > > >  /**
> > > >> > > >   * struct kobj_eclass - A eclass's kobject struct that
> > > >> > > > connects the kobject and the
> > > >> > > > --
> > > >> > > > 2.25.1
> > > >> > > >
