Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F15F5CA0EEC
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 14:21:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 884C910E231;
	Tue, 12 Sep 2023 14:21:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1689F10E231
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 14:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694528481; x=1726064481;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=dl6zFhR7pswRb/FzE5xDYSsh1s4icl+iM66Kk1LL34c=;
 b=n0pV7h0AmJHP98shRDC8XfZrDMRCIUtecmPIrNOd7Av6TRtFq5HY9wux
 25x4tTo5IxvVHdyOS8Ju4ZSALEl25HaTobCV6gbLwHp0SWh9S2aRYlKmr
 855YYC8Djbp5T3et+Omzc3tIGOOb9gZz++SYRucXwFThWkTLnVjV1O5LR
 52m3vUeRiivupdmhcZX6Ww8fnvvhppPZvljOtDuCue3RGRDvbTzd4/LjF
 WC0DTrubBRYAAqqFPkaQOvMECLVpDus3DaEO1v/iNiQE7hftfATUww47K
 OWXwtotgF6sgUlT2cOGSfkqo1mmIU4bYMe019zkXGQIm6enaarS5XTNr/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="464758457"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="464758457"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 07:21:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="917445360"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="917445360"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2023 07:21:14 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 12 Sep 2023 07:21:13 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 12 Sep 2023 07:21:13 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 12 Sep 2023 07:21:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LvzYee/Ue04F3sZneMm1Q/lItPJm7yXqi6lB/c9AILOS9HOHdmC++yqz3GHINlZfIfI/05JmIwun6AOyx6kJYzZ5nUxvdp/aT90XMfpWkmrGh4AuEpgLrVleqNOjhrXm1KoZuA5wLlfaZZBqZUus1EfnUV1NqksMPJY43bUWaxTcFBMmBc8msmYwcc7M+JzYXGgElUQCaDmzKBXyhgQOQJDYIXUvBBeLIN88vtW4dXoh/S+Ad/uRWUTRYs3oyOGJHVvhOOMlpRE0qLWftqvp3Ew+WX5jL9+vwvFyfRyw+Y3h+AAP45V1sg9G8ZkSOKZNKIlwTqYKi8SEq7DMFJYq4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nZMgYaUszivy+Wc1+jcxGmlOx/Ck8jwF/ncNBgSZiuE=;
 b=Q2U5psXk5HVpeSqiFfmkbIWsVMH9VN3a87IWZaLe1HDqjfgRjKwInQB1JcS8ypUdzBAMz6sdBko8HbBsZt5yxBSKenrxABkYcMfyj3k3AWTvGJqxjhzNEr81LDckw3z3X5mitjWiFvLvRxVEc14rBm7YlY04UZDUjZFB0v+618gdy3QFqAZEV39UvWkNWzkqFTYKRrGrRLVu0W/10ObWyJAiblWMhxEzv9/jvLkAQ6Ul9sqUCZkZumZSVGoGxI95FbXOY4wQ0Jbt3oh1QQr2XpJlwk6PHnt+h0tLMg3vh3Ww9kEAu+9Wu14cx4pJ8DRs0p8f/9umwy7LqW9fs7PjoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB8065.namprd11.prod.outlook.com (2603:10b6:806:2de::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Tue, 12 Sep
 2023 14:21:11 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.034; Tue, 12 Sep 2023
 14:21:11 +0000
Date: Tue, 12 Sep 2023 10:21:04 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <ZQBz0Mk3O71oebl+@intel.com>
References: <20230912083635.7-1-francois.dugast@intel.com>
 <20230912083635.7-3-francois.dugast@intel.com>
 <87pm2nd3p1.fsf@intel.com>
 <b9a8df25-d070-9339-fdb7-2b4cd9d66fb3@intel.com>
 <871qf3y0qa.fsf@intel.com>
 <268cacb5-2feb-b43f-325f-5aef9cf8951f@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <268cacb5-2feb-b43f-325f-5aef9cf8951f@intel.com>
X-ClientProxiedBy: MW4P223CA0003.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::8) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB8065:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a907ce4-4dc1-4008-1f8d-08dbb39b834f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zUkwaFvJuTnvhUKUoOmBw4UFIpFVQpRFYdO0Ir58vTVDPplHuR4FCCcrmVQ10R9nfyfc76C/aJI5RRaWBmrHxcHqpOrLw0lRN1p0Sivpyyxj7GNaLx1jhxSQNtr3vIvIrZvsOp6eXYad2T1/Eh1SuRYeBhalYoCi4OEWh6LemZzO9P4V4vxBN2Sfe8O8/rRFFrAW5MyYT773SRA+kSS+yXGUOCtH18oukcwm0KiRAbCS20ACGAt3ER/1FFafccMa+WKn8hk+VBguDROCuA3YKWQU/UT5eyDl+kJ+JqBDuXhAOr1ychr4QJMVBpW7HgydZSX4EcsNqyBNILOFJsF4og/WkSGV+DXHO847f+GBbnuoCWGi2nJCAbm2rmIYJg9TfZCpBhUh8ldc/qHjK31HkXUVI3JtjclTiwB0sj1viaSHxbJtMjL6Zwl7brlNYqd9T5auB9WmaXzHlbd0vEMh1eUCdiUsB+lTvr4gpAOAGIicFUJRla9LBJkC3PiuDlwMBeSWiyYFQjHuOAWIyTf3RL6byrhcYZqc/469lbh/KB5H3Teovv9x0hlTiaqSaQyy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(346002)(39860400002)(376002)(136003)(186009)(1800799009)(451199024)(36756003)(4326008)(8936002)(6862004)(8676002)(41300700001)(5660300002)(107886003)(316002)(66899024)(30864003)(26005)(44832011)(86362001)(66476007)(66946007)(66556008)(6636002)(37006003)(54906003)(82960400001)(2906002)(478600001)(2616005)(83380400001)(6666004)(6506007)(6486002)(6512007)(38100700002)(53546011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?yCqAQHZXpVnZ4a+sLn+NylfgVw7w2OUZ/HU3ueV1VAgMjLuKBMBva4XX4M?=
 =?iso-8859-1?Q?j+XV+tBjQYCnurvWeR2/4X48qsnp/aAywFltjvsjWh6wNRGaevJrAvWLQj?=
 =?iso-8859-1?Q?fNKecpueTzAre1J3aqApZKgr8SIqPHxTWVcskuxiJGbbGovKpCjHzY74ej?=
 =?iso-8859-1?Q?05xFG9mN2YzorDbYJhBqoZzKLwngEzz2/nQ73agJvfM8DOEjQXatb/388J?=
 =?iso-8859-1?Q?MiNUvAOKxPMZn1UtqfY3g6a4enikCNBPkNB0FEM3o2MUSI7ZlCPqPkhWAS?=
 =?iso-8859-1?Q?X8gcoJsygB4RgVXI1vlTQdySj67E6rBlD71PjLgDSF0TVR7Po69lvomGW1?=
 =?iso-8859-1?Q?BK8m9kQKfjkiwFL3IOzvB1UhDM09nSf0A6Dgu33jbw629bhJ//lELhEcqi?=
 =?iso-8859-1?Q?nOVfJKaoOebmU+lkI4w6YvL8vP1b7biThI1G+ciH6F+rP/jCrbfOnZkQ2A?=
 =?iso-8859-1?Q?3GnMwbEZu9BGXO/NeN07KvinqgIHJpdwB+JhjbS4C1BbYgJcIdWZCO6oYk?=
 =?iso-8859-1?Q?bCTXYYle0F2VZGtWpuDAJXcYYbOgwITtjMkKuf2MeUdTPLmEIdF/kiXIHY?=
 =?iso-8859-1?Q?R9+i3SpESt4dI/yxVU37PovOcYluUg87s1tdxtsWUYXUXdQYLe8ng1CK7y?=
 =?iso-8859-1?Q?1Bak2QJzz1tJ85ji63DM0UXLtQqYQFDatEBXhiDUVYSwh9d8bM04xcUODH?=
 =?iso-8859-1?Q?lrHRLOldPw3W5TfVn78/eXVLYKhI1ZUbpu9NHSZfxij3YVGQLEEVhjG15Z?=
 =?iso-8859-1?Q?QXUTkLupHFaQlhL78nPfkYU1UT6mh+0ksUeFfGNYcCt4ue4fVn35ZLb3TM?=
 =?iso-8859-1?Q?pPkGpn0eVEjgAOJPCTQc+VUwxCvZ9BeOVta+p2XLCy3sPtdPcTZOVFdBxX?=
 =?iso-8859-1?Q?bSLcOlFRfmsIgHSZqO0t2I/rwyfJhlb62pnuV9g82WGlcSg7kVuCPWxmAW?=
 =?iso-8859-1?Q?SBG6au1K+PzGcQ4j9LEmmUbDGjJ6CP0aQd6VMhJ1ith+n8tpuBYCMzoVHU?=
 =?iso-8859-1?Q?on7H96TKwCRbEtXGaaFWzlAvkIQBEaINwNnDxefEUoKF/h+ZRcabJ4dZr/?=
 =?iso-8859-1?Q?Lpu76OvZ+ZPjqeSTIhHtI22NrrmmZWxpUw3wLFG0GbFoe8pu5pL20OZsRQ?=
 =?iso-8859-1?Q?VSFcMioZk0TJhZvq7K5JGyU2cpTOFdNoVXKT+8bBN9SxjSs0zP45d61MUC?=
 =?iso-8859-1?Q?BvcxVZLUfISsR0iHqt5PHRfqHYwF2NLodkCZAfeDvzVkdFrwbbA57B151p?=
 =?iso-8859-1?Q?JCPwrWWzGEhA3xd/12xu+508NyTug/ZARY+hnr/PcjY/di1Q7v+kSGedpI?=
 =?iso-8859-1?Q?aodBFqgleDYZe5Ci0hULIxg5gd8KnDOkQ8T0NSsstg37Mf0cAQw51SNFBl?=
 =?iso-8859-1?Q?u3cz7mokJ7vM/zBwu1OAcAdd9I3dS03qc9LA74KeOD6rvG/cugb7u+Rzum?=
 =?iso-8859-1?Q?wubFc0toRPGNqW1d0KO6tmtxXvVZRgNs5rArUQEa/1ogf05LCzYGJsTqRP?=
 =?iso-8859-1?Q?Bfz+MZz9Pky9NnpKTlI0zNW3kh+MTlWLcRBseyJ6JwZApVxHS/uX2AXKqj?=
 =?iso-8859-1?Q?IMjEuLQPPHnSO6uEU58HdBJJ8V0FbTCedrAvIRGJdKlZHJYscj3CP8m3rK?=
 =?iso-8859-1?Q?UYCmw+8GsXuQtTs2BsnqO71wR4Ztks7Fi9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a907ce4-4dc1-4008-1f8d-08dbb39b834f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 14:21:11.1359 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hr6jwtAX4BL+joifY1uErcCiyOPLHEmfMNsNdPRK9RLuz4Itb5L8g3bMpoK54M/QEOJ4XGkEl3Z+V+z2Qn+Icg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8065
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 2/3] drm/xe: Introduce Xe assert macros
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Francois Dugast <francois.dugast@intel.com>, Lucas De
 Marchi <lucas.demarchi@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Sep 12, 2023 at 03:48:01PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 12.09.2023 15:34, Jani Nikula wrote:
> > On Tue, 12 Sep 2023, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
> >> On 12.09.2023 13:35, Jani Nikula wrote:
> >>> On Tue, 12 Sep 2023, Francois Dugast <francois.dugast@intel.com> wrote:
> >>>> From: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >>>>
> >>>> As we are moving away from the controversial XE_BUG_ON macro,
> >>>> relying just on WARN_ON or drm_err does not cover the cases
> >>>> where we want to annotate functions with additional detailed
> >>>> debug checks to assert that all prerequisites are satisfied,
> >>>> without paying footprint or performance penalty on non-debug
> >>>> builds, where all misuses introduced during code integration
> >>>> were already fixed.
> >>>>
> >>>> Introduce family of Xe assert macros that try to follow classic
> >>>> assert() utility and can be compiled out on non-debug builds.
> >>>>
> >>>> Macros are based on drm_WARN, but unlikely to origin, disallow
> >>>> use in expressions since we will compile that code out.
> >>>>
> >>>> As we are operating on the xe pointers, we can print additional
> >>>> information about the device, like tile or GT identifier, that
> >>>> is not available from generic WARN report:
> >>>>
> >>>> [ ] xe 0000:00:02.0: [drm] Assertion `true == false` failed!
> >>>>     platform: 1 subplatform: 1
> >>>>     graphics: Xe_LP 12.00 step B0
> >>>>     media: Xe_M 12.00 step B0
> >>>>     display: enabled step D0
> >>>>     tile: 0 VRAM 0 B
> >>>>     GT: 0 type 1
> >>>>
> >>>> [ ] xe 0000:b3:00.0: [drm] Assertion `true == false` failed!
> >>>>     platform: 7 subplatform: 3
> >>>>     graphics: Xe_HPG 12.55 step A1
> >>>>     media: Xe_HPM 12.55 step A1
> >>>>     display: disabled step **
> >>>>     tile: 0 VRAM 14.0 GiB
> >>>>     GT: 0 type 1
> >>>>
> >>>> [ ] WARNING: CPU: 0 PID: 2687 at drivers/gpu/drm/xe/xe_device.c:281 xe_device_probe+0x374/0x520 [xe]
> >>>> [ ] RIP: 0010:xe_device_probe+0x374/0x520 [xe]
> >>>> [ ] Call Trace:
> >>>> [ ]  ? __warn+0x7b/0x160
> >>>> [ ]  ? xe_device_probe+0x374/0x520 [xe]
> >>>> [ ]  ? report_bug+0x1c3/0x1d0
> >>>> [ ]  ? handle_bug+0x42/0x70
> >>>> [ ]  ? exc_invalid_op+0x14/0x70
> >>>> [ ]  ? asm_exc_invalid_op+0x16/0x20
> >>>> [ ]  ? xe_device_probe+0x374/0x520 [xe]
> >>>> [ ]  ? xe_device_probe+0x374/0x520 [xe]
> >>>> [ ]  xe_pci_probe+0x6e3/0x950 [xe]
> >>>> [ ]  ? lockdep_hardirqs_on+0xc7/0x140
> >>>> [ ]  pci_device_probe+0x9e/0x160
> >>>> [ ]  really_probe+0x19d/0x400
> >>>>
> >>>> v2: use lowercase names
> >>>> v3: apply xe coding style
> >>>>
> >>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >>>> Cc: Oded Gabbay <ogabbay@kernel.org>
> >>>> Cc: Jani Nikula <jani.nikula@intel.com>
> >>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >>>> Cc: Matthew Brost <matthew.brost@intel.com>
> >>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> >>>> Cc: Matt Roper <matthew.d.roper@intel.com>
> >>>> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> >>>> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >>>> ---
> >>>>  drivers/gpu/drm/xe/xe_assert.h | 177 +++++++++++++++++++++++++++++++++
> >>>>  1 file changed, 177 insertions(+)
> >>>>  create mode 100644 drivers/gpu/drm/xe/xe_assert.h
> >>>>
> >>>> diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_assert.h
> >>>> new file mode 100644
> >>>> index 000000000000..b2d3c9b82b31
> >>>> --- /dev/null
> >>>> +++ b/drivers/gpu/drm/xe/xe_assert.h
> >>>> @@ -0,0 +1,177 @@
> >>>> +/* SPDX-License-Identifier: MIT */
> >>>> +/*
> >>>> + * Copyright © 2023 Intel Corporation
> >>>> + */
> >>>> +
> >>>> +#ifndef _XE_ASSERT_H_
> >>>> +#define _XE_ASSERT_H_
> >>>> +
> >>>> +#include <linux/string_helpers.h>
> >>>> +
> >>>> +#include <drm/drm_print.h>
> >>>> +
> >>>> +#include "xe_device_types.h"
> >>>> +#include "xe_step.h"
> >>>> +
> >>>> +/**
> >>>> + * DOC: Xe ASSERTs
> >>>> + *
> >>>> + * While Xe driver aims to be simpler than legacy i915 driver it is still
> >>>> + * complex enough that some changes introduced while adding new functionality
> >>>> + * could break the existing code.
> >>>> + *
> >>>> + * Adding &drm_WARN or &drm_err to catch unwanted programming usage could lead
> >>>> + * to undesired increased driver footprint and may impact production driver
> >>>> + * performance as this additional code will be always present.
> >>>> + *
> >>>> + * To allow annotate functions with additional detailed debug checks to assert
> >>>> + * that all prerequisites are satisfied, without worrying about footprint or
> >>>> + * performance penalty on production builds where all potential misuses
> >>>> + * introduced during code integration were already fixed, we introduce family
> >>>> + * of Xe assert macros that try to follow classic assert() utility:
> >>>> + *
> >>>> + *  * &xe_assert
> >>>> + *  * &xe_tile_assert
> >>>> + *  * &xe_gt_assert
> >>>> + *
> >>>> + * These macros are implemented on top of &drm_WARN, but unlikely to the origin,
> >>>> + * warning is triggered when provided condition is false. Additionally all above
> >>>> + * assert macros cannot be used in expressions or as a condition, since
> >>>> + * underlying code will be compiled out on non-debug builds.
> >>>> + *
> >>>> + * Note that these macros are not intended for use to cover known gaps in the
> >>>> + * implementation; for such cases use regular &drm_WARN or &drm_err and provide
> >>>> + * valid safe fallback.
> >>>> + *
> >>>> + * Also in cases where performance or footprint is not an issue, developers
> >>>> + * should continue to use the regular &drm_WARN or &drm_err to ensure that bug
> >>>> + * reports from production builds will contain meagningful diagnostics data.
> >>>> + *
> >>>> + * Below code shows how asserts could help in debug to catch unplanned use::
> >>>> + *
> >>>> + *	static void one_igfx(struct xe_device *xe)
> >>>> + *	{
> >>>> + *		xe_assert(xe, xe->info.is_dgfx == false);
> >>>> + *		xe_assert(xe, xe->info.tile_count == 1);
> >>>> + *	}
> >>>> + *
> >>>> + *	static void two_dgfx(struct xe_device *xe)
> >>>> + *	{
> >>>> + *		xe_assert(xe, xe->info.is_dgfx);
> >>>> + *		xe_assert(xe, xe->info.tile_count == 2);
> >>>> + *	}
> >>>> + *
> >>>> + *	void foo(struct xe_device *xe)
> >>>> + *	{
> >>>> + *		if (xe->info.dgfx)
> >>>> + *			return two_dgfx(xe);
> >>>> + *		return one_igfx(xe);
> >>>> + *	}
> >>>> + *
> >>>> + *	void bar(struct xe_device *xe)
> >>>> + *	{
> >>>> + *		if (drm_WARN_ON(xe->drm, xe->info.tile_count > 2))
> >>>> + *			return;
> >>>> + *
> >>>> + *		if (xe->info.tile_count == 2)
> >>>> + *			return two_dgfx(xe);
> >>>> + *		return one_igfx(xe);
> >>>> + *	}
> >>>> + */
> >>>> +
> >>>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> >>>> +#define __xe_assert_msg(xe, condition, msg, arg...) ({						\
> >>>> +	(void)drm_WARN(&(xe)->drm, !(condition), "[" DRM_NAME "] Assertion `%s` failed!\n" msg,	\
> >>>> +		       __stringify(condition), ## arg);						\
> >>>> +})
> >>>> +#else
> >>>> +#define __xe_assert_msg(xe, condition, msg, arg...) ({						\
> >>>> +	typecheck(struct xe_device *, xe);							\
> >>>> +	BUILD_BUG_ON_INVALID(condition);							\
> >>>> +})
> >>>> +#endif
> >>>> +
> >>>> +/**
> >>>> + * xe_assert - warn if condition is false when debugging.
> >>>> + * @xe: the &struct xe_device pointer to which &condition applies
> >>>> + * @condition: condition to check
> >>>> + *
> >>>> + * xe_assert() uses &drm_WARN to emit a warning and print additional information
> >>>> + * that could be read from the &xe pointer if provided &condition is false.
> >>>> + *
> >>>> + * Contrary to &drm_WARN, xe_assert() is effective only on debug builds
> >>>> + * (&CONFIG_DRM_XE_DEBUG must be enabled) and cannot be used in expressions
> >>>> + * or as a condition.
> >>>> + *
> >>>> + * See `Xe ASSERTs`_ for general usage guidelines.
> >>>> + */
> >>>> +#define xe_assert(xe, condition) xe_assert_msg((xe), condition, "")
> >>>> +#define xe_assert_msg(xe, condition, msg, arg...) ({						\
> >>>> +	struct xe_device *__xe = (xe);								\
> >>>> +	__xe_assert_msg(__xe, condition,							\
> >>>> +			"platform: %d subplatform: %d\n"					\
> >>>> +			"graphics: %s %u.%02u step %s\n"					\
> >>>> +			"media: %s %u.%02u step %s\n"						\
> >>>> +			"display: %s step %s\n"							\
> >>>> +			msg,									\
> >>>> +			__xe->info.platform, __xe->info.subplatform,				\
> >>>> +			__xe->info.graphics_name,						\
> >>>> +			__xe->info.graphics_verx100 / 100,					\
> >>>> +			__xe->info.graphics_verx100 % 100,					\
> >>>> +			xe_step_name(__xe->info.step.graphics),					\
> >>>> +			__xe->info.media_name,							\
> >>>> +			__xe->info.media_verx100 / 100,						\
> >>>> +			__xe->info.media_verx100 % 100,						\
> >>>> +			xe_step_name(__xe->info.step.media),					\
> >>>> +			str_enabled_disabled(__xe->info.enable_display),			\
> >>>> +			xe_step_name(__xe->info.step.display),					\
> >>>> +			## arg);								\
> >>>> +})
> >>>
> >>> I guess I have missed this huge splat all along... Why is it necessary?
> >>> If you print the device id, all the information should be there already,
> >>> right?
> >>
> >> somewhere in the dmesg (if someone/CI was clever enough) maybe yes
> >>
> >> but in bug reports usually only the WARN is included, so exposing some
> >> basic info here for quicker triage
> > 
> > I just think it's unnecessary duplication. 
> 
> but what if assert() fires before driver print welcome messages ;)
> 
> IMO we should try to collect whatever is possible and comes almost at no
> extra cost (you don't need to type anything, macro takes care of that)
> 
> > Most likely this will only be
> > enabled in CI only anyway.
> 
> I assume asserts will fire mostly during pre-merge testing (either on CI
> or on tested manually on DUT machines)

I'm with Jani here. In all of these cases you already know the PCI ID of
that specific machine, so all this extra information should already be known.

The only benefit would be to get user reports when we get just that debug
msg. But also asking for a lspci -nn | grep VGA was never that complicated.

My recommendation is to remove the duplication of this information here.
But this is not a blocker in my opinion and we could go with this patch as is.

Jani, do you see this as a blocker and a new version needed?

maybe a follow-up later so we don't block this entire series?

Thanks,
Rodrigo.

> 
> > 
> >>
> >>>
> >>> This also makes it impossible to use xe_assert() with a NULL xe device
> >>> pointer in contexts where you don't have the device available.
> >>
> >> there was no such requirement (but we can add that if needed)
> >>
> >> note that code is based on drm_WARN() which also doesn't work with NULL
> > 
> > Ah, true. The drm_dbg and friends do.
> 
> true, so do you want xe_assert() and family to also accept NULL ?
> 
> > 
> >>
> >> Michal
> >>
> >>>
> >>> BR,
> >>> Jani.
> >>>
> >>>
> >>>> +
> >>>> +/**
> >>>> + * xe_tile_assert - warn if condition is false when debugging.
> >>>> + * @tile: the &struct xe_tile pointer to which &condition applies
> >>>> + * @condition: condition to check
> >>>> + *
> >>>> + * xe_tile_assert() uses &drm_WARN to emit a warning and print additional
> >>>> + * information that could be read from the &tile pointer if provided &condition
> >>>> + * is false.
> >>>> + *
> >>>> + * Contrary to &drm_WARN, xe_tile_assert() is effective only on debug builds
> >>>> + * (&CONFIG_DRM_XE_DEBUG must be enabled) and cannot be used in expressions
> >>>> + * or as a condition.
> >>>> + *
> >>>> + * See `Xe ASSERTs`_ for general usage guidelines.
> >>>> + */
> >>>> +#define xe_tile_assert(tile, condition) xe_tile_assert_msg((tile), condition, "")
> >>>> +#define xe_tile_assert_msg(tile, condition, msg, arg...) ({					\
> >>>> +	struct xe_tile *__tile = (tile);							\
> >>>> +	char __buf[10];										\
> >>>> +	xe_assert_msg(tile_to_xe(__tile), condition, "tile: %u VRAM %s\n" msg,			\
> >>>> +		      __tile->id, ({ string_get_size(__tile->mem.vram.actual_physical_size, 1,	\
> >>>> +				     STRING_UNITS_2, __buf, sizeof(__buf)); __buf; }), ## arg);	\
> >>>> +})
> >>>> +
> >>>> +/**
> >>>> + * xe_gt_assert - warn if condition is false when debugging.
> >>>> + * @gt: the &struct xe_gt pointer to which &condition applies
> >>>> + * @condition: condition to check
> >>>> + *
> >>>> + * xe_gt_assert() uses &drm_WARN to emit a warning and print additional
> >>>> + * information that could be safetely read from the &gt pointer if provided
> >>>> + * &condition is false.
> >>>> + *
> >>>> + * Contrary to &drm_WARN, xe_gt_assert() is effective only on debug builds
> >>>> + * (&CONFIG_DRM_XE_DEBUG must be enabled) and cannot be used in expressions
> >>>> + * or as a condition.
> >>>> + *
> >>>> + * See `Xe ASSERTs`_ for general usage guidelines.
> >>>> + */
> >>>> +#define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
> >>>> +#define xe_gt_assert_msg(gt, condition, msg, arg...) ({						\
> >>>> +	struct xe_gt *__gt = (gt);								\
> >>>> +	xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,			\
> >>>> +			   __gt->info.id, __gt->info.type, ## arg);				\
> >>>> +})
> >>>> +
> >>>> +#endif
> >>>
> > 
