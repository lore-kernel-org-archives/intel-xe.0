Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2FF606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 07:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WOCmVvnj
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D834D10E2D8;
	Wed, 21 Oct 2026 07:04:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE5E10E2D8
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 07:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792566270; x=1824102270;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7h6SFZfBzKWbY9/gZD+LnmN8mSBpSsTL7ps3p6HWmL0=;
 b=WOCmVvnjwnOf+uw9h3Li0MCKONzj4Hy1gBqWCTy0nQPIyenUtvTd6NSb
 AGQod5gpi9aCNepUPaacKBkD4ke0mMTF1HqahOZvPyGFU1gx6gSvEU0XZ
 mB4tfp6fi9Xp0Vz7PNCOWCB58KVL/HQG/OaQ38G/niIR0/OkH2gzM2LEP
 B90ttKLaIC2Oo9ClYajooG0v3UZPyZkIB7jQcfK5mUFK+Y1OO6Fl7owwi
 RkGCZdWhq1SdIU7YDAOIUKiX8JDf90rYXZWexeXMVD4BxaTZwPR+MU7ez
 /57DTe4RhHCUBBBKd2pMl7t3hduSRTYqeGrUJUQRv6f8Zc1KEoJQp+P0G g==;
X-CSE-ConnectionGUID: lRC26qAmTYGftt37beT/hQ==
X-CSE-MsgGUID: eggLUH83T4alkfVVhRmjuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1176309"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1176309"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 00:04:29 -0700
X-CSE-ConnectionGUID: 0yjkCrkYRHGAj5Wd34OPKg==
X-CSE-MsgGUID: G4jlKv8FShmB6YQHrFMUMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="3015732"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 00:04:29 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 00:04:28 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 21 Oct 2026 00:04:28 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.45)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 00:04:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F1TZdIOeE5ZQW/t7bxkX/h7fOjwXbkNpnv2qogT04Snkk+Y5BAge5lB9JL0NMOBMRKgfrb6bRt0qdc8CAXDZT5cmDykz8M2MEtMSXxoXn/U2g6pne/B/DXJW1zWOFfsyAOjRdHgV70AFgSf4ZzKDZ6ZEc870wnl9OrIw+TKgohMR9hPrQVR6Hnv5TfJvqBE6feeFCwM2vbMtCYxHLgiZfBvWvifYHU0QoqQOPJ+5sc+7qIgr+1xaCf5IVUX0k0isB2+859+T7OZQZjYGAqD8OIKMOkSjT/SjecsePLVk6/mZnuJS8lquZTuPD09fWMCDNst7qp1jcs73+Jqi1RA/Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g77umD2Ov9y7zNWZXwnj3xswRB9HhbNHLpiv+LWYufE=;
 b=RbFF/+3d9xZEfsaKfkTS5PELnufMga6WACilZQMyefrPzKB1b/ZqmviNfsewzmGEAK0qLeF2IH7TvF1uel836ezF+LnYSiV8cSIA1qoMw6glagqvIRkkUmb/QKk8JTNdkU6jGQ7VpHetKZyKgRSVqQfcMlDoc0qYgfjSnAqNAzVh5K/NWr/0HYs5t6fvHjqLPAJBruGbuY7aZLUQMhOyQOIIfN9HQoow/s99KJoZqTESTky1thSSnQKu+8CZiMXOl5G4NhZKjB16L9F+I9ZHQSeA6QWfqC0yjvKf/S2C5nIINCsuMQzBt8ur0cd344ee4JpJCL8vfrC33uJygGo49g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by PH8PR11MB9772.namprd11.prod.outlook.com (2603:10b6:510:3a4::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 07:04:20 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 07:04:20 +0000
Date: Wed, 21 Oct 2026 09:04:16 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: "Lis, Tomasz" <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Maarten Lankhorst <dev@lankhorst.se>
Subject: Re: [PATCH v6 1/4] drm/xe/ggtt: Introduce full GGTT range size
Message-ID: <20261021070416.jbfgnnp6utwvohje@intel.com>
References: <20261020095532.473609-1-piotr.piorkowski@intel.com>
 <20261020095532.473609-2-piotr.piorkowski@intel.com>
 <a019cc66-f41c-414c-beb6-c4aa4d38321d@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a019cc66-f41c-414c-beb6-c4aa4d38321d@intel.com>
X-ClientProxiedBy: BE1P281CA0222.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:88::15) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|PH8PR11MB9772:EE_
X-MS-Office365-Filtering-Correlation-Id: 14e3b486-8597-4a03-4ad0-08df2f418759
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|56012099006|4143699003|11063799006|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: AP74pRaxf0OKv/oE20+CEn3zJ5CC8aDn3xUfmLPwAS5cMg2ZQNaRXiC4I65SIZzXRvw30PkLtAARbArOojuF/rMDPrmOkS9AOq4iiWXacIM6X+rINtbuWkeCpnkVicuA8oNCzefpyyZrcjmUq+hEmjt8cmROtEEnQQLg8Kik+rF+mRcmalnT6NglrtNEh8U6TA+jdRw8VecntoIeqOXrO0H1vvaps8DQejQhBjL8YBi9iY5Pqki5Fw0viH0SIAs2ZMOSamFfu8j9NDuGv8AsaZnjiUBM8+VeaMHDjYJXisAyxN8Sak3bfR3rwNtG8ZEN3THx8NIR3wVjv8QrPD0MYKpDx7yxfg4uhov11sAoahzpLypYMOtKFd6lokVpj5+sBi6BmWx9qow19mfDbzxS1XvFyqKqugHyC7NEEPNpmH3zlCFnI2AGjikeNCNFp/FOe1gXZ9zv7QyKjO7YppnYExaMgT3Sj1A23pl9RfYIxuK+ySUJJfgiguFC5jfiRPLE1ig4lTpu7EdvmympMzYNXaBXMaCzsfYHJoFN3MAGaVRF6cjVe255JclDnTKlKQMgGo2IVTxPsHhOKx7HboFs4StkFCcgxDm3ZzqL2N4A47bhr7pI3Qnooc+oit6jfw7N56dJkz/ANgYgq5a+WwNgw1cmnLSv71uYqbdkjtRrmVQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(56012099006)(4143699003)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGVGY2pobnQ4cm1yY0VqbmkrUCtpTU1iY3RVd1FSUXN0SzA4dkdlUkV1Lzlt?=
 =?utf-8?B?SFM1ejZubm1sbXYxWW1FeldMU3VPYjY4dHRIN0tTYTVXRnhudnhNNEdKWFF5?=
 =?utf-8?B?Y3BoVnhMcnArSWNVUkZwazZZMjRJb3BqNUQ4ZzFRL3kxb2h1M0I5MHFKWUdB?=
 =?utf-8?B?bE9qdklCSThwSlAxZWZqQllDdTIrMmw3cXRxYjE5MXh0SmwxZ2p5L1Q2NzNG?=
 =?utf-8?B?OXY2aEx6SWpiSUxKQU9DbHAzazg0aUY0NXFJYmx6b2J3M2Q2QUkweGhjRG41?=
 =?utf-8?B?LzcwUkF5UWxvTEI5NkI2N3NhKzV6VlFoYXV0MHNCd0pjYThxVk8vVS93TUhO?=
 =?utf-8?B?dmhnQnoreGFRaEZ5b0R3OUtHUkJkbElxd3JHU2FTOGJaem9kYXlPL3M2UDAx?=
 =?utf-8?B?V3A1enMzL3hsSXR5UzNxYWFsUmlhV3BBWGgraWRGUzVocVFzdTFBTXZJYkhn?=
 =?utf-8?B?U085WUcwK1Q2MTl3QmdpUDdYMDQ4b3JaRERWaHZMSkZrSmc4Q1A4UC95MTQv?=
 =?utf-8?B?ZTZlV2JnKzRGQkxIbWR4OHpVeXFMQlJmWjVDQVpxWi9udzBDblZrcUhHdGNx?=
 =?utf-8?B?RWhzeUdtVERhV0hvaTRoT3pjNS9jTE5NNG14dEJhQzNXcUF1Q0xYVkltM2Fi?=
 =?utf-8?B?UHpUVWllc2pvQUlCSVEvRW91S2RuTmlxUVJWK1ZqQ2UzYmlIdEVpc1NJZGMv?=
 =?utf-8?B?OVNFS3FZUnlTYWFGYlJQSkdoMC9Na1VaTHhrbk9LWkxjUEZxeEl1MFNtZ0xs?=
 =?utf-8?B?ZzMzVGx4WUtzZFEvZXk2YStCcDRIQzI2K1JGa2VnVFFCNHU0N0pkdGt6aHp0?=
 =?utf-8?B?Q3Jwa1pTOGJiZGxld1V4OFFLQVkwRXgxRlVyczZtcmJkLzBmVUpiSUcxUnZx?=
 =?utf-8?B?UnV3V2hHdU9ZRitsblhQWHRYUERIUXprbVlVaVUwTk5HZTZMTHpHN3JpNFNB?=
 =?utf-8?B?MC9EUEpzSzJVQ3A3NWJLWVZqRGNPWXA0WTJBYlAxdEtJcmxHSFZjTHJVNmdv?=
 =?utf-8?B?UXBxcVRQN3Q4NWdVYjduUVdEN2VYSWRQcS8zTlo1UElwbTVkem5IUThVTkpn?=
 =?utf-8?B?d1p6cjdPK0hMVHJQdnBpQmxhV1hmUk0rc1RMUjlwV2V4cnJvUlZpTVM2My9o?=
 =?utf-8?B?a1RaaGV3V01VRnhHQmU5T1FLdFJERlFlRXZzVW9NTzZDcjRRRTRRdWh3NmM1?=
 =?utf-8?B?cnQzdXBKNG54aytpTUpWeFY0elZ2WkRHaUt3K0pvc1kydEJWVS9XQnpYdnd3?=
 =?utf-8?B?elBDKzhwcDVNR3c2endjeVlXdjhmSklIYXg3U2U4cDVDMmVMVHNKNmQ4T0px?=
 =?utf-8?B?QU1xeE5rZTgreUttWE5wd3lhY0xLeEs3bWJJU1JZL3F6aG4zbExKZWxoK3BS?=
 =?utf-8?B?WDFScTZUaVFUYitBRzJPdzNMZzZJazA5dTNoejBOWkNlMFJpcWgyR1E0SG1o?=
 =?utf-8?B?aXlxc1NIU2lsM3dtSGRzSXdxVjN3SzhrM0liRzdLRkNjdS9KVVBNRWZ4Qm1H?=
 =?utf-8?B?dnJtVjQ0TmhxUDV2VkFZKzN4dUdFZWpzbk1GQnJMelYwTThiL3dXVlBaNzV6?=
 =?utf-8?B?M0ZFZ2FiUW53Q1Q4N2x2d2hlSk5aUHZ6VXR3eFcwQTNxMkpjZWtDejdaM1Q5?=
 =?utf-8?B?a2VUd2VFUW93WUltWUYydTQwbUprSWFXNnRKTTBIUVZYcGZLMFdMYk0rUWVI?=
 =?utf-8?B?VENhTytvajJORFp5ZngwekdlczFHaDlWRFhXUU54aHNTTVI0R1phKzI4bzZS?=
 =?utf-8?B?OWtpS29NSUdaSzN5Yy9iamJiaWdtKy9mTGtwdWJ2Wm1sSFFjS0dta080K1FO?=
 =?utf-8?B?TlNKdHorWE1RQlhXK05XSHhLWk5YOFgxYnNVTXdTeURlMWRuVlh4VThpZjh1?=
 =?utf-8?B?cXhmcWRJemtlUHBVNmswWjZoeWtjbUpBd2cvNHpBakh2WlZSTlRWa0IxYUxU?=
 =?utf-8?B?aGZZcDZhT0owREh0YzBaQlB3eklaZVNlN3JHQnN1Vk04WmtEeTVUcnBsYmZx?=
 =?utf-8?B?a2ViZldCbmEralo3anBqaGdyTkZZUGpiMTJHdW5xbTJVamNyK01xL2ZFUGdr?=
 =?utf-8?B?MzRBM2wzbFRNUUw1bTZHdjIzWGEwdWZrV1o3UTFPc080b01uZmMwaTAzaHRJ?=
 =?utf-8?B?KzN0blZhUUpxSktXNjN0bG1QSWUzNXRSamlRSHNqeWY2dU4zOVRieWpkc1ZV?=
 =?utf-8?B?MllKczRwRTg5aDBPVkNhWEhNZUJKSzJsSHpDbStBT3RLNEZDZitHMWVTU0Jh?=
 =?utf-8?B?aVBxeS9vZURaZzd6eEwzbllKRWdxUUlMWlRIVjZRZlJyUWN0Z1JDQ3NxOUcy?=
 =?utf-8?B?S2NyRnpKUTBhMjdFZUJWZE0yc0JaY2FwNGVQQlkySVl3YllTK0N3SUdidzdT?=
 =?utf-8?Q?PgL8igwJZkQgxraI=3D?=
X-Exchange-RoutingPolicyChecked: Fo+skYncePNYPFDY5bQLSSQrJcW7lJ2BgM7of2MpeJzQnLJ8vLXOxMVtWpWLVdrkfzAvY8a/kjlaiknZLpKIBlW8E/gVvSjVXk0xiEHZgSd5HzkU4gppJVUapHke8XkbPvB+k3yJmAnJJMqjVUEOSy0gdqygqizqqp36CZIAKnYqKbI42xRxwre0IWmnrcQ8W9iH9z/uhEpsxSG1CUYiIDD8rtAdlK9725rkEMa59MDmqeOTxE+H346XkCPhpjS4AOQNjVqBSlaxqZ4IaxHViim6EgHbXR+eWE1QBPtuJ6MO8qUbIYyNdsWGuemX4JDHDdRgA/4jyCuaU99FV+sVhA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 14e3b486-8597-4a03-4ad0-08df2f418759
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 07:04:20.2682 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d/QdnULTQvB7ZpvhiytSwf8ObJB5XWG1bqxenbayQ3gSfDHHdomMQ/KJoV6tuy1PCvjFohdXKBKDBPVNvpHq5U47wUQw2oQnDAiAliSO6GA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9772
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Lis, Tomasz <tomasz.lis@intel.com> wrote on śro [2026-paź-21 03:00:38 +0200]:
> 
> On 2026-10-20 11:55, Piórkowski, Piotr wrote:
> > From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > 
> > Separate the full assigned GGTT range size from the size available for
> > regular allocations.
> > 
> > For now both sizes are identical. A subsequent change will reserve part of
> > the full range for VF provisioning.
> > 
> > Assisted-by: Claude:claude-5-sonnet
> > Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Cc: Maarten Lankhorst <dev@lankhorst.se>
> > ---
> >   drivers/gpu/drm/xe/xe_ggtt.c | 11 +++++++----
> >   1 file changed, 7 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> > index 773777afc68a2..abcc929c08535 100644
> > --- a/drivers/gpu/drm/xe/xe_ggtt.c
> > +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> > @@ -113,9 +113,11 @@ struct xe_ggtt_pt_ops {
> >   struct xe_ggtt {
> >   	/** @tile: Back pointer to tile where this GGTT belongs */
> >   	struct xe_tile *tile;
> > -	/** @start: Start offset of GGTT */
> > +	/** @start: Start offset of the assigned GGTT range */
> >   	u64 start;
> > -	/** @size: Total usable size of this GGTT */
> > +	/** @full_size: Full size of the assigned GGTT range */
> > +	u64 full_size;
> > +	/** @size: Size of the GGTT range for regular use */
> >   	u64 size;
> >   	/**
> >   	 * @flags: Flags for this GGTT.
> > @@ -240,7 +242,7 @@ u64 xe_ggtt_size(struct xe_ggtt *ggtt)
> >   static void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
> >   {
> >   	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
> > -	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->size);
> > +	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->full_size);
> 
> Looks like the `start` was introduced in "Start using ggtt->start in
> preparation of balloon removal"
> 
> back in January, but asserts remained only for the top bound. Shouldn't we
> check the bottom
> 
> bound as well? Though that should probably be a separate patch.

Good point, thanks. I'll add the bottom-bound check as a separate patch at the start of the series.

Piotr

> -Tomasz
> 
> >   	writeq(pte, &ggtt->gsm[addr >> XE_PTE_SHIFT]);
> >   }
> > @@ -254,7 +256,7 @@ static void xe_ggtt_set_pte_and_flush(struct xe_ggtt *ggtt, u64 addr, u64 pte)
> >   static u64 xe_ggtt_get_pte(struct xe_ggtt *ggtt, u64 addr)
> >   {
> >   	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
> > -	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->size);
> > +	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->full_size);
> >   	return readq(&ggtt->gsm[addr >> XE_PTE_SHIFT]);
> >   }
> > @@ -359,6 +361,7 @@ static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
> >   static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u64 start, u64 size)
> >   {
> >   	ggtt->start = start;
> > +	ggtt->full_size = size;
> >   	ggtt->size = size;
> >   	drm_mm_init(&ggtt->mm, 0, size);
> >   }

-- 
